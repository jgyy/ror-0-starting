#!/usr/bin/env ruby

def find_state_by_capital(capital)
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
  
    state_abbrev = capitals_cities.key(capital)
    return "Unknown capital city" if state_abbrev.nil?
  
    states.each do |state_name, abbrev|
        return state_name if abbrev == state_abbrev
    end
end
  
puts find_state_by_capital(ARGV[0]) if ARGV.length == 1

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