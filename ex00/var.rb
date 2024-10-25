#!/usr/bin/env ruby

def my_var
    a = 10
    b = "10"
    c = nil
    d = 10.0

    puts "my variables :"
    puts "    a contains: #{a} and is a type: #{a.class}"
    puts "    b contains: #{b} and is a type: #{b.class}"
    if c.nil?
        puts "    c contains: nil and is a type: #{c.class}"
    else
        puts "    c contains: #{c} and is a type: #{c.class}"
    end
    puts "    d contains: #{d} and is a type: #{d.class}"
end

my_var

=begin
<?php
    $a = 10;
    $b = "10";
    $c = "ten";
    $d = 10.0;

    echo "My first variables:\n";
    echo "a contains : " . $a . " and has type : " . gettype($a) . "\n";
    echo "b contains : " . $b . " and has type : " . gettype($b) . "\n";
    echo "c contains : " . $c . " and has type : " . gettype($c) . "\n";
    echo "d contains : " . $d . " and has type : " . gettype($d) . "\n";
?>
=end
