#!/usr/bin/env ruby

def parse_element(line)
    name, attributes = line.split(' = ')
    attrs = attributes.split(', ').map do |attr|
        key, value = attr.split(':')
        [key, value]
    end.to_h
    
    attrs['name'] = name
    attrs
end

def create_element_html(element)
    <<~HTML
        <td class="element box">
            <div class="number">#{element['number']}</div>
            <div class="symbol">#{element['small']}</div>
            <div class="name">#{element['name']}</div>
            <div class="mass">#{element['molar']}</div>
        </td>
    HTML
end

def create_empty_cell
    '<td class="empty"></td>'
end

def generate_periodic_table
    elements = File.readlines('periodic_table.txt').map { |line| parse_element(line.chomp) }
    
    html = <<~HTML
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>Periodic Table</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 20px;
                    background-color: #f5f5f5;
                }
                
                table {
                    border-collapse: separate;
                    border-spacing: 2px;
                    margin: 0 auto;
                }
                
                .element {
                    width: 70px;
                    height: 80px;
                    padding: 4px;
                    text-align: center;
                    position: relative;
                    transition: transform 0.2s;
                    border-radius: 2px;
                }
                
                .element:hover {
                    transform: scale(2);
                    z-index: 1;
                    box-shadow: 0 0 10px rgba(0,0,0,0.3);
                }
                
                .number {
                    font-size: 10px;
                    text-align: left;
                }
                
                .symbol {
                    font-size: 18px;
                    font-weight: bold;
                    margin: 4px 0;
                }
                
                .name {
                    font-size: 10px;
                    margin-bottom: 2px;
                }
                
                .mass {
                    font-size: 9px;
                    color: #666;
                }
                
                .empty {
                    width: 70px;
                    height: 80px;
                }

                .box {
                    background-color: #d6d6d6;
                }
            </style>
        </head>
        <body>
            <table>
    HTML

    current_row = []
    max_position = 17
    
    elements.each do |element|
        position = element['position'].to_i

        while current_row.length < position
            current_row << create_empty_cell
        end
        
        current_row << create_element_html(element)
        
        if position == max_position
            html += "        <tr>#{current_row.join("\n")}</tr>\n"
            current_row = []
        end
    end

    html += "        <tr>#{current_row.join("\n")}</tr>\n" unless current_row.empty?

    html += <<~HTML
            </table>
        </body>
        </html>
    HTML
    
    File.write('periodic_table.html', html)
end

generate_periodic_table

=begin
<?php
    $elements = [];
    $lines = file('ex06.txt', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (preg_match('/^(\w+)\s*=\s*position:(\d+),\s*number:(\d+),\s*small:\s*(\w+),\s*molar:([\d.]+),\s*electron:(.+)$/', $line, $matches)) {
            $elements[] = [
                'name' => $matches[1],
                'position' => (int)$matches[2],
                'number' => (int)$matches[3],
                'symbol' => $matches[4],
                'molar' => $matches[5],
                'electron' => $matches[6]
            ];
        }
    }
    $html = '<!DOCTYPE html>
    <html lang="en">
    <head>
        <title>Periodic Table</title>
        <style>
            table {
                border-collapse: collapse;
                margin: 20px;
                font-family: Arial, sans-serif;
            }
            td {
                border: 1px solid #ccc;
                padding: 10px;
                width: 120px;
                vertical-align: top;
            }
            .element {
                background-color: #f0f0f0;
            }
            h4 {
                margin: 0 0 10px 0;
                color: #333;
            }
            ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
                font-size: 14px;
            }
            li {
                margin-bottom: 4px;
            }
            .empty {
                border: none;
            }
        </style>
    </head>
    <body>
    <table>';
    $maxRows = 10;
    $maxCols = 18;
    $table = array_fill(0, $maxRows, array_fill(0, $maxCols, null));
    foreach ($elements as $element) {
        $row = null;
        $col = $element['position'];
        $num = $element['number'];
        
        if ($num <= 2) {
            $row = 0;
        }
        else if ($num <= 10) {
            $row = 1;
        }
        else if ($num <= 18) {
            $row = 2;
        }
        else if ($num <= 36) {
            $row = 3;
        }
        else if ($num <= 54) {
            $row = 4;
        }
        else if ($num <= 86) {
            $row = 5;
            if ($num > 57 && $num < 72) continue;
        }
        else {
            $row = 6;
            if ($num > 89 && $num < 104) continue;
        }
        if ($row !== null) {
            $table[$row][$col] = $element;
        }
    }
    for ($row = 0; $row < $maxRows; $row++) {
        $html .= '<tr>';
        for ($col = 0; $col < $maxCols; $col++) {
            if (isset($table[$row][$col])) {
                $element = $table[$row][$col];
                $html .= '<td class="element">
                    <h4>' . htmlspecialchars($element['name']) . '</h4>
                    <ul>
                        <li>No ' . $element['number'] . '</li>
                        <li>' . htmlspecialchars($element['symbol']) . '</li>
                        <li>' . $element['molar'] . '</li>
                        <li>' . $element['electron'] . ' electron</li>
                    </ul>
                </td>';
            } else {
                $html .= '<td class="empty"></td>';
            }
        }
        $html .= '</tr>';
    }
    $html .= '</table></body></html>';
    file_put_contents('mendeleiev.html', $html);
?>
=end