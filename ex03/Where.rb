#!/usr/bin/env ruby

def find_capital(state_name)
    states = {
        "Oregon" => "OR",
        "Alabama" => "AL",
        "New Jersey" => "NJ",
        "Colorado" => "CO"
    }
    
    capitals_cities = {
        "OR" => "Salem",
        "AL" => "Montgomery",
        "NJ" => "Trenton",
        "CO" => "Denver"
    }
    
    if ARGV.length != 1
        return
    end
    
    state_abbrev = states[state_name]
    
    if state_abbrev
        puts capitals_cities[state_abbrev]
    else
        puts "Unknown state"
    end
end

find_capital(ARGV[0])

=begin
<?php
    $states = [
        'Oregon' => 'OR',
        'Alabama' => 'AL',
        'New Jersey' => 'NJ',
        'Colorado' => 'CO'
    ];
    $capitals = [
        'OR' => 'Salem',
        'AL' => 'Montgomery',
        'NJ' => 'trenton',
        'KS' => 'Topeka'
    ];
    function capital_city_from($state_name) {
        global $states, $capitals;  
        if (!isset($states[$state_name])) {
            return "Unknown\n";
        }
        $state_code = $states[$state_name];
        if (!isset($capitals[$state_code])) {
            return "Unknown\n";
        }
        return $capitals[$state_code] . "\n";
    }
?>
=end
