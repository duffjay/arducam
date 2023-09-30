// polarizer holder
// 2 needed

case_thickness = 23.5;  // case sandwich thickness
case_height = 42;

polarz_distance = 12;   // face-to-inside of polarizer
polarz_thickness = 7.1; // frame thickness
polarz_radius = 10;     // corner radius
polarz_block_height = polarz_radius + 0;
polarz_height = 38.25 + 0.2;

polarz_center_adj = (case_height - (polarz_height + 0.2))/2;

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
        // bottom backbone    
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
            cube([clamp_thickness, 
                backbone_width - 4, 
                case_height],
                center=false
                );
                
        // polarz block


        translate([pb_x, 0, backbone_thickness])
            cube([pb_thickness, backbone_width, polarz_block_height],
                center=false
                );
                
        // top backbone
        translate([0,0,backbone_thickness + case_height])
            cube([backbone_length, backbone_width, backbone_thickness],
                center=false
            );
        // 1st vertical - behind case
        translate([0,0,backbone_thickness + case_height - clamp_height])
            cube([clamp_thickness, backbone_width, clamp_height], 
                center=false
                );
        translate([pb_x, 0, 
            backbone_thickness + case_height -polarz_block_height])
            cube([pb_thickness, backbone_width, polarz_block_height],
                center=false
                );
    }
    // subtract the polarizer
    
    union () {
        translate([pb_x + clamp_thickness,
            polarz_radius,
            polarz_radius + backbone_thickness +
            polarz_center_adj
            ])
        rotate([0,90,0])
            cylinder(r = polarz_radius + 0.1, h = polarz_thickness, 
                center = false);
        // larger radius
        translate([pb_x,
            polarz_radius,
            polarz_radius + 3 +
            polarz_center_adj
            ])
        rotate([0,90,0])
            cylinder(r = polarz_radius - 3, h = polarz_thickness + 6, 
                center = false);
        
        // top 
        translate([pb_x + clamp_thickness,
            polarz_radius,
            (backbone_thickness + case_height) - 
            (polarz_radius + polarz_center_adj)])
        rotate([0,90,0])
            cylinder(r = polarz_radius + 0.1, h = polarz_thickness, 
                center = false);
        
        translate([pb_x,
            polarz_radius,
            (backbone_thickness + case_height) - 
            (polarz_radius + polarz_center_adj)])
        rotate([0,90,0])
            cylinder(r = polarz_radius - 3, h = polarz_thickness + 6, 
                center = false);
    }

}