let cityCount = 0;
let totalPopulation = 0;
const totalPolandPopulation = 38386000;
const visitedCities = new Set();
const addedCities = [];

function geoToMapCoords(lat, lon, mapWidth, mapHeight) {
    const minLat = 48.6;
    const maxLat = 55.2;
    const minLon = 13.0;
    const maxLon = 25.5;

    const latScale = (lat - minLat) / (maxLat - minLat);
    const lonScale = (lon - minLon) / (maxLon - minLon);

    const x = lonScale * mapWidth;
    const y = (1 - latScale) * mapHeight;

    return { x, y };
}

function addCityDot(cityData) {
    const city = cityData.nazwa.toLowerCase();
    if (visitedCities.has(city)) {
        alert(`Miasto "${city}" zostało już dodane!`);
        return;
    }

    const map = document.getElementById('map');
    const mapWidth = map.offsetWidth;
    const mapHeight = map.offsetHeight;

    const lat = parseFloat(cityData.lat);
    const lon = parseFloat(cityData.lon);
    const { x, y } = geoToMapCoords(lat, lon, mapWidth, mapHeight);

    const cityDot = document.createElement('div');
    cityDot.classList.add('city-dot');

    const dotSize = Math.max(10, Math.min(24, cityData.populacja / 40000));
    cityDot.style.width = `${dotSize}px`;
    cityDot.style.height = `${dotSize}px`;
    cityDot.style.left = `${x - dotSize / 2}px`;
    cityDot.style.top = `${y - dotSize / 2}px`;

    cityDot.dataset.name = cityData.nazwa;
    cityDot.dataset.population = cityData.populacja;

    cityDot.addEventListener('mouseenter', showTooltip);
    cityDot.addEventListener('mouseleave', hideTooltip);

    document.getElementById('city-dots-container').appendChild(cityDot);

    cityCount++;
    totalPopulation += cityData.populacja;
    visitedCities.add(city);
    addedCities.push(cityData);
    updateStats();
}

function showTooltip(e) {
    const tooltip = document.getElementById('tooltip');
    const cityName = e.target.dataset.name;
    const population = parseInt(e.target.dataset.population).toLocaleString();

    tooltip.textContent = `${cityName} – ${population} mieszkańców`;
    tooltip.style.left = `${e.pageX + 10}px`;
    tooltip.style.top = `${e.pageY - 20}px`;
    tooltip.style.display = 'block';
}

function hideTooltip() {
    document.getElementById('tooltip').style.display = 'none';
}

function updateStats() {
    const percent = ((totalPopulation / totalPolandPopulation) * 100).toFixed(2);
    document.getElementById('city-count').textContent = `${cityCount} miast`;
    document.getElementById('total-population').textContent = totalPopulation.toLocaleString();
    document.getElementById('population-percent').textContent = percent;
}

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
            .catch(() => alert("Błąd połączenia z serwerem."));
        
        event.target.value = '';
    }
});

document.getElementById('clear-game').addEventListener('click', function() {
    cityCount = 0;
    totalPopulation = 0;
    visitedCities.clear();
    addedCities.length = 0;
    document.getElementById('tooltip').style.display = 'none';
    updateStats();
});

function repositionCityDots() {
    const map = document.getElementById('map');
    const mapWidth = map.offsetWidth;
    const mapHeight = map.offsetHeight;

    document.querySelectorAll('.city-dot').forEach(dot => {
        const cityData = addedCities.find(c => c.nazwa === dot.dataset.name);
        if (!cityData) return;

        const lat = parseFloat(cityData.lat);
        const lon = parseFloat(cityData.lon);
        const { x, y } = geoToMapCoords(lat, lon, mapWidth, mapHeight);

        const dotSize = parseFloat(dot.style.width);
        dot.style.left = `${x - dotSize / 2}px`;
        dot.style.top = `${y - dotSize / 2}px`;
    });
}

window.addEventListener('resize', repositionCityDots);

// Motyw jasny/ciemny
const themeButton = document.getElementById('toggleTheme');
const body = document.body;

function loadTheme() {
    const theme = localStorage.getItem('theme') || 'light';
    body.classList.toggle('dark', theme === 'dark');
}

function toggleTheme() {
    body.classList.toggle('dark');
    const newTheme = body.classList.contains('dark') ? 'dark' : 'light';
    localStorage.setItem('theme', newTheme);
}

themeButton.addEventListener('click', toggleTheme);
loadTheme();
