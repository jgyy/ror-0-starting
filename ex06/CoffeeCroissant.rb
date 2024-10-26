#!/usr/bin/env -S ruby -w

def display_sorted_names
    data = [
        ['Frank', 33],
        ['Stacy', 15],
        ['Juan' , 24],
        ['Dom' , 32],
        ['Steve', 24],
        ['Jill' , 24]
    ]

    sorted_data = data.sort_by { |person| [person[1], person[0]] }

    sorted_data.each do |person|
        puts person[0]
    end
end
  
display_sorted_names

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

    function array2hash_sorted($array) {
        $result = array();
        foreach ($array as $item) {
            if (count($item) >= 2) {
                $name = $item[0];
                $age = $item[1];
                $result[$name] = $age;
            }
        }
        krsort($result);
        return $result;
    }
?>
=end
