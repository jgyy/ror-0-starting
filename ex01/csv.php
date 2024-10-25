<?php

if (!file_exists('numbers.txt')) {
    die("Error: numbers.txt file not found\n");
}

$content = file_get_contents('numbers.txt');

$content = trim($content);

$values = explode(',', $content);

foreach ($values as $value) {
    echo trim($value) . "\n";
}

?>
