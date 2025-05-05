const citiesData = {
    "warszawa": { population: 1790658, lat: 52.2298, lon: 21.0118 },
    "kraków": { population: 779115, lat: 50.0647, lon: 19.9450 },
    "wrocław": { population: 640648, lat: 51.1079, lon: 17.0385 },
    "gdańsk": { population: 470907, lat: 54.3520, lon: 18.6466 },
};

let cityCount = 0;
let totalPopulation = 0;
const totalPolandPopulation = 38386000;
const visitedCities = new Set();

function geoToMapCoords(lat, lon, mapWidth, mapHeight) {
    const minLat = 49.0;
    const maxLat = 54.9;
    const minLon = 14.1;
    const maxLon = 24.2;

    const latScale = (lat - minLat) / (maxLat - minLat);
    const lonScale = (lon - minLon) / (maxLon - minLon);

    const x = lonScale * mapWidth;
    const y = (1 - latScale) * mapHeight;

    return { x: x, y: y };
}

function addCityDot(city) {
    if (visitedCities.has(city)) {
        alert(`Miasto "${city.charAt(0).toUpperCase() + city.slice(1)}" zostało już wpisane!`);
        return;
    }

    const cityDot = document.createElement('div');
    cityDot.classList.add('city-dot');
    const cityInfo = citiesData[city];
    
    const mapWidth = document.getElementById('map').offsetWidth;
    const mapHeight = document.getElementById('map').offsetHeight;

    const { x, y } = geoToMapCoords(cityInfo.lat, cityInfo.lon, mapWidth, mapHeight);

    cityDot.style.position = 'absolute';
    cityDot.style.left = `${x - cityDot.offsetWidth / 2}px`;
    cityDot.style.top = `${y - cityDot.offsetHeight / 2}px`;

    const dotSize = Math.max(8, Math.min(20, cityInfo.population / 50000));
    cityDot.style.width = `${dotSize}px`;
    cityDot.style.height = `${dotSize}px`;
    cityDot.style.backgroundColor = 'red';
    cityDot.style.borderRadius = '50%';

    document.getElementById('city-dots-container').appendChild(cityDot);

    cityCount++;
    totalPopulation += cityInfo.population;
    visitedCities.add(city);
    updateStats();
}

function updateStats() {
    const populationPercentage = ((totalPopulation / totalPolandPopulation) * 100).toFixed(2);
    document.getElementById('city-count').textContent = `${cityCount} miast`;
    document.getElementById('total-population').textContent = totalPopulation.toLocaleString();
    document.getElementById('population-percent').textContent = populationPercentage;
}

document.getElementById('city-input').addEventListener('input', function(event) {
    const cityInput = event.target.value.trim().toLowerCase();

    if (citiesData[cityInput]) {
        addCityDot(cityInput);
        event.target.value = '';
    }
});

document.getElementById('clear-game').addEventListener('click', function() {
    cityCount = 0;
    totalPopulation = 0;
    visitedCities.clear();
    document.getElementById('city-dots-container').innerHTML = '';
    updateStats();
});
