// polarizer holder
// 2 needed

case_thickness = 23.5;  // case sandwich thickness

polarz_distance = 12;   // face-to-inside of polarizer
polarz_thickness = 7.1; // frame thickness
polarz_radius = 10;     // corner radius
polarz_block_height = polarz_radius + 0;

backbone_width = 10;
backbone_thickness = 3;

clamp_height = 8;
clamp_thickness = 3;    // thickness of each finger clamp

// total length
backbone_length = clamp_thickness + 
    case_thickness +
    polarz_distance +
    polarz_thickness +
    clamp_thickness;

pb_thickness = clamp_thickness + polarz_thickness + clamp_thickness;
// pb_x = translate distance
//      = subtract the last clamp thickness because it's the inside dist
pb_x = clamp_thickness + case_thickness + polarz_distance - clamp_thickness;

// overall
// difference(parts, polarizer)
$fn = 50;

difference () {
    union () {
        // main backbone    
        cube([backbone_length, backbone_width, backbone_thickness],
            center=false
            );
            
        // 1st vertical - behind case
        translate([0,0,backbone_thickness])
            cube([clamp_thickness, backbone_width, clamp_height], 
                center=false
                );
                
        // 2nd veritical - front of case
        translate([clamp_thickness + case_thickness, 0, backbone_thickness])
            cube([clamp_thickness, backbone_width, clamp_height],
                center=false
                );
                
        // polarz block


        translate([pb_x, 0, backbone_thickness])
            cube([pb_thickness, backbone_width, polarz_block_height],
                center=false
                );
    }
    // subtract the polarizer
    
    union () {
        translate([pb_x + clamp_thickness,
            polarz_radius,
            polarz_radius + backbone_thickness])
        rotate([0,90,0])
            cylinder(r = polarz_radius, h = polarz_thickness, 
                center = false);
        // larger radius
        translate([pb_x,
            polarz_radius,
            polarz_radius + 3])
        rotate([0,90,0])
            cylinder(r = polarz_radius - 3, h = polarz_thickness + 6, 
                center = false);
    }

}