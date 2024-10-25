#!/usr/bin/env ruby

def sort_numbers_from_file
    begin
        numbers_text = File.read('numbers.txt')
      
        numbers = numbers_text.split(',').map(&:strip).map(&:to_i)
      
        sorted_numbers = numbers.sort
      
        sorted_numbers.each { |num| puts num }
    rescue Errno::ENOENT
        puts "Error: numbers.txt file not found"
    rescue => e
        puts "Error: #{e.message}"
    end
end
  
sort_numbers_from_file

=begin
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
=end
