// sphere mount


sphere_dia = 16;


$fn = 50;

screw_dia = 4.4;

countersink_dia = 8.2;      // verified good
countersink_depth = sphere_dia/2 - 4;

difference () {
    union () {
        sphere(r = sphere_dia/2);

    }
    // center hole
    union() {
        // screw hole
        translate([0,0, sphere_dia/4])
        cylinder(r = screw_dia/2, h = sphere_dia/2, center = true);

        // countersink - nut
        translate([0,0, sphere_dia/2 - countersink_depth/2])
        #cylinder(r = countersink_dia/2, h = countersink_depth, $fn=6, center = true);       
        
        // take out 1/2 of the sphere
        translate([0,0,-sphere_dia/4])
        cube([sphere_dia, sphere_dia, sphere_dia/2], center = true);
    }
}