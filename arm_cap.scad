// arm cap

sphere_dia = 16.0;

arm_depth = 8;
arm_width = sphere_dia + 2 * 8;
arm_height = sphere_dia/2 + 4;


m4_pilot = 3.35;
m4_dia = 4.5;

$fn = 50;

difference () {
    union () {

        // arm height is on TOP of plate
        translate([0,0, arm_height/2])
        cube([arm_depth, arm_width, arm_height], center = true);
    }
    // holes
    union () {
       
        // mounting sphere
        sphere(r = (sphere_dia + 0.5)/2);
        
        // cap screw holes
        translate([0, arm_width/2 - 4,0])
        cylinder(r = m4_dia/2, h = arm_height, center = false);
        
        translate([0, -(arm_width/2 - 4),0])
        cylinder(r = m4_dia/2, h = arm_height, center = false);
        
        // fix the globe screw
        translate([0,0, arm_height/2])
        cylinder(r = m4_pilot/2, h = arm_height, center = true);
        
    }
}
