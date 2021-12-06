//
// FRONTplate of ArduCam IMX291
//

camera_square = 38.00;
lip_width = 2;          // still used - to indicate size beyond the camera square
depth = 11;             // might call this height - it's depth relative to how deep is the box
face_thickness = 3;
m4_depth = 4;   // m4 thickness = depth - countersink
m4_screw_head_dia = 7.5;

circuit_board_thickness = 1.75;

globe_major = 10;
globe_pilot = 4.2;
globe_bar_thickness = 4;

globe_bar_width = 4;

lense_dia = 18;

$fn = 50;

union() {
    difference() {
        {
        // major square
        cube([camera_square + (2*lip_width), 
            camera_square + (2*lip_width), 
            depth], center=true);
        }
        // subtract the center
        {
        // remove the center
        cube([camera_square - (2*lip_width), 
            camera_square - (2*lip_width), 
            depth], center=true);

        }
    }
    
    // add globe mount 
    difference() {
        {
        // face plate
        translate([0,0,-(depth/2 - face_thickness/2)])
        cube([camera_square,
            camera_square,
            face_thickness], center=true);    
        }
        // camera lense hole
        {
        translate([0,0,-(depth/2 - face_thickness/2)])
        cylinder(r = lense_dia/2, h = face_thickness, center = true); 
        }
        
    } // end of globe mount
    
    // add side mounts
    // left side
    countersink_depth = depth - m4_depth;
    difference () {
        union () {
        translate([-((camera_square+2)/2 + globe_major/2),0,0])
        cylinder(r = globe_major/2, h = depth, center = true);
        
        translate([-((camera_square+2)/2 + globe_major/4),0,0])
        cube([globe_major/2, globe_major, depth], center = true);
        }
        // screw hole
        {
        translate([-((camera_square+2)/2 + globe_major/2),0, (depth/2 - m4_depth/2 + 0.1)])
        #cylinder(r = globe_pilot/2, h = m4_depth, center = true);
        // countersink
        translate([-((camera_square+2)/2 + globe_major/2),0, -depth/2 + countersink_depth/2])
        cylinder(r = m4_screw_head_dia/2, h = countersink_depth, center = true); 
        }
    }
    // right side
    difference () {
        union () {
        translate([((camera_square+2)/2 + globe_major/2),0,0])
        cylinder(r = globe_major/2, h = depth, center = true);
        
        translate([((camera_square+2)/2 + globe_major/4),0,0])
        cube([globe_major/2, globe_major, depth], center = true);
        }
        // screw hole
        {
        translate([((camera_square+2)/2 + globe_major/2),0, (depth/2 - m4_depth/2 + 0.1)])
        #cylinder(r = globe_pilot/2, h = m4_depth, center = true);
        // countersink
        translate([((camera_square+2)/2 + globe_major/2),0, -depth/2 + countersink_depth/2])
        cylinder(r = m4_screw_head_dia/2, h = countersink_depth, center = true); 
        }
    }
} // union