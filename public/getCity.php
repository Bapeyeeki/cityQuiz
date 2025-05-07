<?php
header('Content-Type: application/json');
require_once 'db.php';

$database = new Database();
$conn = $database->getConnection();

$cityName = isset($_GET['city']) ? trim($_GET['city']) : null;
$getAll = isset($_GET['all']) && $_GET['all'] === 'true';

if ($getAll) {
    // Zwraca wszystkie miasta z bazy
    try {
        $stmt = $conn->query("SELECT city, lat, lng, populatio FROM cities");
        $cities = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($cities);
    } catch (PDOException $e) {
        echo json_encode(['error' => 'Błąd zapytania: ' . $e->getMessage()]);
    }
} elseif ($cityName) {
    // Zwraca jedno miasto
    $stmt = $conn->prepare("SELECT city, lat, lng, populatio FROM cities WHERE LOWER(city) = LOWER(:city) LIMIT 1");
    $stmt->bindParam(':city', $cityName);
    $stmt->execute();

    $city = $stmt->fetch(PDO::FETCH_ASSOC);
    echo $city ? json_encode($city) : json_encode(['error' => 'Miasto nie znalezione.']);
} else {
    echo json_encode(['error' => 'Brak parametru city']);
}

