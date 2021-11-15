// base plate


plate_width = 36;
plate_depth = 36;
plate_thick = 4;

sphere_dia = 16.0;

arm_depth = 8;
arm_width = sphere_dia + 2 * 8;
arm_height = 30;
// 1/4" camera mount
pilot_dia = 0.228 * 25.4;    // about 5mm

m4_pilot = 3.35;

$fn = 50;

difference () {
    union () {
        //plate
        translate([0,-plate_width/2,0])
        cube([plate_depth, plate_width, plate_thick], center = false);

        // 1/4 mount hole
        translate([plate_depth/2,0,0])
        cylinder(r = 10/2, h = 8, center = false);

        // arm height is on TOP of plate
        translate([0,-arm_width/2,plate_thick])
        cube([arm_depth, arm_width, arm_height], center = false);
    }
    // holes
    union () {
        // 1/4 mount hole
        translate([plate_depth/2,0,0])
        cylinder(r = pilot_dia/2, h = 8, center = false);
        
        // mounting sphere
        translate([sphere_dia/4,0,plate_thick + arm_height])
        sphere(r = (sphere_dia + 0.5)/2);
        
        // cap screw holes
        translate([arm_depth/2, arm_width/2 - 4,0])
        cylinder(r = m4_pilot/2, h = arm_height + plate_thick, center = false);
        
        translate([arm_depth/2, -(arm_width/2 - 4),0])
        cylinder(r = m4_pilot/2, h = arm_height + plate_thick, center = false);
    }
}
