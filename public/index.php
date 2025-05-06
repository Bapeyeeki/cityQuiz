<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Polska</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<buttton id="toggleTheme">Zmień tryb</buttton>

<h1>Jak dużo Polskich miast potrafisz nazwać?</h1>

<input id="city-input" type="text" class="city-input" placeholder="Podaj nazwę miasta..." autocomplete="off" spellcheck="false" enterkeyhint="done">

<div class="map-container">
    <div id="city-dots-container">
    <img src="POL_location_map.svg" alt="Mapa Polski" id="map">
    </div> 
</div>
<div id="tooltip" class="tooltip"></div>
<div class="stats">
    <p class="text-center">
        Nazwałeś <span id="city-count" class="stat">0 miast</span> z łączną populacją <span id="total-population" class="stat">0</span> (<span id="population-percent" class="stat">0.00</span>% mieszkańców Polski).
    </p>
    <button id="clear-game" class="error">Clear</button>
    <button id="finish-game" class="success">Zakończ i zapisz</button>
</div>

<script src="script.js"></script>

</body>
</html>
