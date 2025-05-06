let cityCount = 0;
let totalPopulation = 0;
const totalPolandPopulation = 38386000;
const visitedCities = new Set();
const addedCities = [];

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

function addCityDot(cityData) {
    const city = cityData.city.toLowerCase();
    if (visitedCities.has(city)) {
        alert(`Miasto "${city}" zostało już dodane!`);
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

    cityDot.dataset.name = cityData.city;
    cityDot.dataset.population = cityData.populatio;

    cityDot.addEventListener('mouseenter', showTooltip);
    cityDot.addEventListener('mouseleave', hideTooltip);

    document.getElementById('city-dots-container').appendChild(cityDot);

    cityCount++;
    totalPopulation += cityData.populatio;
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
            .catch(() => alert("xxxxxxxx."));
        
        event.target.value = '';
    }
});

document.getElementById('clear-game').addEventListener('click', function() {
    cityCount = 0;
    totalPopulation = 0;
    visitedCities.clear();
    addedCities.length = 0;

    const cityDotsContainer = document.getElementById('city-dots-container');
    const cityDots = cityDotsContainer.querySelectorAll('.city-dot');
    cityDots.forEach(dot => dot.remove());

    document.getElementById('tooltip').style.display = 'none';

    updateStats();
});

function repositionCityDots() {
    const map = document.getElementById('map');
    const mapWidth = map.offsetWidth;
    const mapHeight = map.offsetHeight;

    document.querySelectorAll('.city-dot').forEach(dot => {
        const cityData = addedCities.find(c => c.city === dot.dataset.name);
        if (!cityData) return;

        const lat = parseFloat(cityData.lat);
        const lon = parseFloat(cityData.lng);
        const { x, y } = geoToMapCoords(lat, lon, mapWidth, mapHeight);

        const dotSize = parseFloat(dot.style.width);
        dot.style.left = `${x - dotSize / 2}px`;
        dot.style.top = `${y - dotSize / 2}px`;
    });
}

window.addEventListener('resize', repositionCityDots);

// Motyw
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