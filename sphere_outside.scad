// sphere mount


sphere_dia = 16;


$fn = 50;
screw_major = 8;
screw_dia = 4.4;
screw_segment = 8;

difference () {
    union () {
        sphere(r = sphere_dia/2);
        translate([0,0, sphere_dia/2])
        cylinder(r = screw_major/2, h = sphere_dia/2 + screw_segment, center = true);
    }
    // center hole
    union() {
        translate([0,0, sphere_dia/2])
        cylinder(r = screw_dia/2, h = sphere_dia/2 + screw_segment, center = true);
        
        // take out 1/2 of the sphere
        translate([0,0,-sphere_dia/4])
        cube([sphere_dia, sphere_dia, sphere_dia/2], center = true);
    }
}