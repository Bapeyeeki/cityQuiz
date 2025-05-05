<?php
class Database {
    private $servername = "mysql";
    private $username = "v.je";
    private $password = "v.je";
    private $dbname = "quizCity";
    private $conn;

    public function __construct() {
        try {
            $this->conn = new PDO("mysql:host=$this->servername;dbname=$this->dbname",
                                  $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch(PDOException $e) {
            echo json_encode(['error' => 'Błąd połączenia z bazą danych.']);
            exit;
        }
    }

    public function getConnection() {
        return $this->conn;
    }
}
?>