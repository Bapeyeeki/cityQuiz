// Inicjalizacja zmiennych globalnych
let cityCount = 0;
let totalPopulation = 0;
const totalPolandPopulation = 38386000;
const visitedCities = new Set();
const addedCities = [];

// Funkcja konwertująca współrzędne geograficzne na współrzędne mapy
function geoToMapCoords(lat, lon, mapWidth, mapHeight) {
    const minLat = 49.0;
    const maxLat = 54.9;
    const minLon = 14.1;
    const maxLon = 24.2;

    const latScale = (lat - minLat) / (maxLat - minLat);
    const lonScale = (lon - minLon) / (maxLon - minLon);

    const expectedAspect = 10 / 7;
    const actualAspect = mapWidth / mapHeight;

    let x, y, offsetX = 0, offsetY = 0;

    // Dopasowanie współrzędnych do proporcji mapy
    if (actualAspect > expectedAspect) {
        const adjustedWidth = mapHeight * expectedAspect;
        offsetX = (mapWidth - adjustedWidth) / 2;
        x = lonScale * adjustedWidth + offsetX;
        y = (1 - latScale) * mapHeight;
    } else {
        const adjustedHeight = mapWidth / expectedAspect;
        offsetY = (mapHeight - adjustedHeight) / 2;
        x = lonScale * mapWidth;
        y = (1 - latScale) * adjustedHeight + offsetY;
    }

    return { x, y };
}

// Funkcja dodająca punkt (miasto) na mapie
function addCityDot(cityData) {
    const originalCity = cityData.city;
    const cityLower = originalCity.toLowerCase();

    // Sprawdzanie, czy miasto zostało już dodane
    if (visitedCities.has(cityLower)) {
        alert(`Miasto "${originalCity}" zostało już dodane!`);
        return;
    }

    const map = document.getElementById('map');
    const mapWidth = map.offsetWidth;
    const mapHeight = map.offsetHeight;

    const lat = parseFloat(cityData.lat);
    const lon = parseFloat(cityData.lng);
    const { x, y } = geoToMapCoords(lat, lon, mapWidth, mapHeight);

    const cityDot = document.createElement('div');
    cityDot.classList.add('city-dot');

    const dotSize = Math.max(10, Math.min(24, cityData.populatio / 40000));
    cityDot.style.width = `${dotSize}px`;
    cityDot.style.height = `${dotSize}px`;
    cityDot.style.left = `${x - dotSize / 2}px`;
    cityDot.style.top = `${y - dotSize / 2}px`;

    // Ustawiamy z-index odwrotnie do rozmiaru — mniejsze wyżej
    cityDot.style.zIndex = `${1000 - Math.round(dotSize)}`;

    // Atrybuty dla tooltipa
    cityDot.dataset.name = originalCity;
    cityDot.dataset.population = cityData.populatio;

    // Obsługa tooltipa (pokazywanie i ukrywanie)
    cityDot.addEventListener('mouseenter', showTooltip);
    cityDot.addEventListener('mouseleave', hideTooltip);

    // Dodajemy punkt na mapie
    document.getElementById('city-dots-container').appendChild(cityDot);

    // Aktualizacja danych
    cityCount++;
    totalPopulation += cityData.populatio;
    visitedCities.add(cityLower);
    addedCities.push({ ...cityData, cityLower });

    updateStats();
}

// Funkcja pokazująca tooltip z nazwą miasta i liczbą mieszkańców
function showTooltip(e) {
    const tooltip = document.getElementById('tooltip');
    const cityName = e.target.dataset.name;
    const population = parseInt(e.target.dataset.population).toLocaleString();

    tooltip.textContent = `${cityName} – ${population} mieszkańców`;
    tooltip.style.left = `${e.pageX + 10}px`;
    tooltip.style.top = `${e.pageY - 30}px`;
    tooltip.style.display = 'block';
}

// Funkcja ukrywająca tooltip
function hideTooltip() {
    document.getElementById('tooltip').style.display = 'none';
}

// Funkcja aktualizująca dane statystyczne (liczba miast, populacja)
function updateStats() {
    const percent = ((totalPopulation / totalPolandPopulation) * 100).toFixed(2);

    // Funkcja zwracająca odpowiednią formę słowa "miasto"
    function getCityWordForm(count) {
        const lastDigit = count % 10;
        const lastTwoDigits = count % 100;

        if (count === 1) return 'miasto';
        if (lastDigit >= 2 && lastDigit <= 4 && !(lastTwoDigits >= 12 && lastTwoDigits <= 14)) {
            return 'miasta';
        }
        return 'miast';
    }

    const cityText = ` ${cityCount} ${getCityWordForm(cityCount)}`;

    // Aktualizacja liczby miast i populacji
    document.getElementById('city-count').textContent = cityText;
    document.getElementById('total-population').textContent = totalPopulation.toLocaleString();
    document.getElementById('population-percent').textContent = percent;
}

// Obsługa dodawania miast po naciśnięciu Enter w polu tekstowym
document.getElementById('city-input').addEventListener('keydown', function(event) {
    if (event.key === 'Enter') {
        const city = event.target.value.trim().toLowerCase();
        if (!city) {
            alert('Wprowadź nazwę miasta');
            return;
        }

        fetch(`getCity.php?city=${encodeURIComponent(city)}`)
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    alert(`Błąd: ${data.error}`);
                } else {
                    addCityDot(data);
                }
            })
            .catch(() => alert("Błąd połączenia z serwerem"));

        event.target.value = '';
    }
});

// Funkcja czyszcząca grę
function clearGame() {
    cityCount = 0;
    totalPopulation = 0;
    visitedCities.clear();
    addedCities.length = 0;

    const cityDotsContainer = document.getElementById('city-dots-container');
    cityDotsContainer.querySelectorAll('.city-dot').forEach(dot => dot.remove());

    document.getElementById('tooltip').style.display = 'none';
    document.getElementById('end-screen').style.display = 'none';

    updateStats();
}

// Przycisk czyszczący grę
document.getElementById('clear-game').addEventListener('click', clearGame);

// Funkcja do kończenia gry i wyświetlania wyników
document.getElementById('finish-game').addEventListener('click', () => {
    if (addedCities.length === 0) {
        alert('Nie dodano żadnych miast!');
        return;
    }

    const sorted = [...addedCities].sort((a, b) => b.populatio - a.populatio);
    const largest = sorted[0];
    const smallest = sorted[sorted.length - 1];

    const largestPopulation = typeof largest.populatio === 'number' ? largest.populatio.toLocaleString() : 'Nieznana';
    const smallestPopulation = typeof smallest.populatio === 'number' ? smallest.populatio.toLocaleString() : 'Nieznana';

    const summary = `
Największe miasto: ${largest.city} (${largestPopulation} mieszkańców)
Najmniejsze miasto: ${smallest.city} (${smallestPopulation} mieszkańców)
    `;

    // Pobieranie danych o wszystkich miastach z serwera
    fetch('getCity.php?all=true')
        .then(response => response.json())
        .then(allCities => {
            const guessedSet = new Set(addedCities.map(c => c.city.toLowerCase()));
            const missed = allCities.filter(c => !guessedSet.has(c.city.toLowerCase()));

            const list = document.getElementById('missed-cities');
            list.innerHTML = '';

            missed.forEach(city => {
                const li = document.createElement('li');
                li.textContent = `${city.city} (${parseInt(city.populatio).toLocaleString()} mieszkańców)`;
                list.appendChild(li);
            });

            alert(summary);
            document.getElementById('end-screen').style.display = 'block';
        })
        .catch(() => alert("Błąd podczas ładowania danych z serwera."));
});

// Funkcja do ponownego ustawiania punktów miast po zmianie rozmiaru okna
function repositionCityDots() {
    const map = document.getElementById('map');
    const mapWidth = map.offsetWidth;
    const mapHeight = map.offsetHeight;

    document.querySelectorAll('.city-dot').forEach(dot => {
        const dotCity = dot.dataset.name.toLowerCase();
        const cityData = addedCities.find(c => c.cityLower === dotCity);
        if (!cityData) return;

        const { x, y } = geoToMapCoords(parseFloat(cityData.lat), parseFloat(cityData.lng), mapWidth, mapHeight);
        const dotSize = parseFloat(dot.style.width);
        dot.style.left = `${x - dotSize / 2}px`;
        dot.style.top = `${y - dotSize / 2}px`;
    });
}

// Nasłuchiwacz zmiany rozmiaru okna
window.addEventListener('resize', repositionCityDots);

// Tryb ciemny
const themeButton = document.getElementById('toggleTheme');
const body = document.body;

// Funkcja ładująca aktualny motyw (ciemny lub jasny)
function loadTheme() {
    const theme = localStorage.getItem('theme') || 'light';
    body.classList.toggle('dark', theme === 'dark');
}

// Funkcja przełączająca tryb ciemny
function toggleTheme() {
    body.classList.toggle('dark');
    const newTheme = body.classList.contains('dark') ? 'dark' : 'light';
    localStorage.setItem('theme', newTheme);
}

// Przycisk zmieniający motyw
themeButton.addEventListener('click', toggleTheme);
loadTheme();