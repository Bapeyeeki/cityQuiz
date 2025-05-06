<?php
header('Content-Type: application/json');
require_once 'db.php';

$database = new Database();
$conn = $database->getConnection();

$cityName = isset($_GET['city']) ? trim($_GET['city']) : null;
if ($cityName) {
    // Zmiana zapytania SQL pod nową tabelę i kolumny
    $stmt = $conn->prepare("SELECT city, lat, lng, populatio FROM cities WHERE LOWER(city) = LOWER(:city) LIMIT 1");
    $stmt->bindParam(':city', $cityName);
    $stmt->execute();

    $city = $stmt->fetch(PDO::FETCH_ASSOC);
    echo $city ? json_encode($city) : json_encode(['error' => 'Miasto nie znalezione.']);
} else {
    echo json_encode(['error' => 'Brak parametru city']);
}
?>