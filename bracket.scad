// L-bracket for Mere Mortals.
// Base 60 x 40 x 5 mm, upright 40 x 45 x 5 mm, gusset 30 x 30 x 5 mm.
// Four M4 clearance holes (4.5 mm). All units mm.
// Render: openscad -o bracket.stl bracket.scad

base_l = 60; base_w = 40; base_t = 5;
up_w = 40; up_t = 5; up_h = 45;
up_x0 = (base_l - up_w) / 2;  // upright centered on the base
hole_d = 4.5;                 // M4 clearance (see Measuring and Tolerances)
gus_leg = 30; gus_t = 5;

module base_plate() {
    difference() {
        cube([base_l, base_w, base_t]);
        for (x = [10, base_l - 10])
            translate([x, base_w / 2, -1])
                cylinder(d = hole_d, h = base_t + 2, $fn = 32);
    }
}

module upright() {
    difference() {
        translate([up_x0, base_w - up_t, base_t])
            cube([up_w, up_t, up_h]);
        for (x = [up_x0 + 10, up_x0 + up_w - 10])
            translate([x, base_w - up_t - 1, base_t + 12])
                rotate([-90, 0, 0])
                    cylinder(d = hole_d, h = up_t + 2, $fn = 32);
    }
}

module gusset() {
    // Triangular rib via hull(): a flat plate on the base
    // shrink-wrapped with a vertical plate against the upright.
    x0 = (base_l - gus_t) / 2;
    hull() {
        translate([x0, 5, base_t])
            cube([gus_t, gus_leg, 2]);
        translate([x0, base_w - up_t - 2, base_t])
            cube([gus_t, 2, gus_leg]);
    }
}

base_plate();
upright();
gusset();
