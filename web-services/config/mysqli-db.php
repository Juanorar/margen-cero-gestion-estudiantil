<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../interfaces/database-connection.php';

use Dotenv\Dotenv;


class MySQLIDB implements DatabaseConnectionInterface
{
    private $connection;

    public function connect()
    {
        $dotenv = Dotenv::createImmutable(__DIR__ . "/../");
        $dotenv->load();

        $host = $_ENV['DB_HOST'] ?? 'localhost';
        $dbname = $_ENV['DB_NAME'] ?? '';
        $username = $_ENV['DB_USER'] ?? 'root';
        $password = $_ENV['DB_PASS'] ?? '';

        if ($this->connection === null) {
            $this->connection = new mysqli($host, $username, $password, $dbname);

            if ($this->connection->connect_error) {
                throw new Exception("Conexión fallida: " . $this->connection->connect_error);
            }
            $this->connection->set_charset('utf8mb4');
        }
        return $this->connection;
    }
}
