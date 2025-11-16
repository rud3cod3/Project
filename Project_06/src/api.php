<?php
header('Content-Type: application/json');

echo json_encode([
    "status" => "success",
    "message" => "API is working!",
    "server_time" => date("Y-m-d H:i:s")
]);
