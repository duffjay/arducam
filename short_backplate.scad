//
// backplate of ArduCam IMX291
//

camera_square = 38.00;
lip_width = 2;
depth = 12 - 4;  // subtract 4mm since you took off the back mount

circuit_board_thickness = 1.75;

globe_major = 10;
globe_pilot = 3.2;
globe_bar_thickness = 4;

globe_bar_width = 4;

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
        // board mounting lip
        translate([0,0, (depth/2 - circuit_board_thickness/2)])
            cube([camera_square + 1 ,
                camera_square + 1,
                circuit_board_thickness + 0.5], center=true);
        }
    }
    

    
    // add side mounts
    // left side
    difference () {
        union () {
        translate([-((camera_square+2)/2 + globe_major/2),0,0])
        cylinder(r = globe_major/2, h = depth, center = true);
        
        translate([-((camera_square+2)/2 + globe_major/4),0,0])
        cube([globe_major/2, globe_major, depth], center = true);
        }
        // screw hole
        {
        translate([-((camera_square+2)/2 + globe_major/2),0,0])
        cylinder(r = globe_pilot/2, h = depth, center = true);
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
        translate([((camera_square+2)/2 + globe_major/2),0,0])
        cylinder(r = globe_pilot/2, h = depth, center = true);
        }
    }
} // union