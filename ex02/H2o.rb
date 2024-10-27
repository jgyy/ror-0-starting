#!/usr/bin/env -S ruby -w

def convert_to_hash
    data = [['Caleb' , 24],
            ['Calixte' , 84],
            ['Calliste', 65],
            ['Calvin' , 12],
            ['Cameron' , 54],
            ['Camil' , 32],
            ['Camille' , 5],
            ['Can' , 52],
            ['Caner' , 56],
            ['Cantin' , 4],
            ['Carl' , 1],
            ['Carlito' , 23],
            ['Carlo' , 19],
            ['Carlos' , 26],
            ['Carter' , 54],
            ['Casey' , 2]]

    hash = {}
    data.each do |name, age|
        hash[age] = name
    end

    hash.each do |age, name|
        puts "#{age} : #{name}"
    end
end
  
convert_to_hash

=begin
<?php
    function array2hash($input_array) {
        $result = array();
        foreach ($input_array as $pair) {
            if (count($pair) >= 2) {
                $name = $pair[0];
                $age = $pair[1];
                $result[$age] = $name;
            }
        }
        return $result;
    }
    $array = array(array("Pierre","30"), array("Mary","28"));
    print_r ( array2hash($array) );
?>
=end
