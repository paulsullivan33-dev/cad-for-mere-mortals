# Project: The L-Bracket

Everything in this guide converges here: one complete, useful
part, from a blank file to a valid STL. An **L-bracket** — the
humble corner joiner that holds shelves, enclosures, and robots
together.

**These dimensions are the single source of truth.** Every number
below is the number in `bracket.scad` (in this repo) and in the
rendered STL. If another chapter mentions the bracket, it uses
these numbers.

## The design

| Part | Dimensions |
|---|---|
| Base plate | 60 × 40 × 5 mm |
| Base holes | 2 × ⌀4.5 mm (M4 clearance), at x = 10 and 50, centered y = 20 |
| Upright | 40 × 5 × 45 mm, centered on the base (x = 10…50), back edge |
| Upright holes | 2 × ⌀4.5 mm, at x = 20 and 40, 12 mm above the base top |
| Gusset | 30 × 30 × 5 mm triangular rib, centered |

Four features, matching [the feature list](from-sketch-to-solid.md):
base, holes, upright, holes, gusset. The 4.5 mm holes come straight
from the [clearance table](measuring-and-tolerances.md).

## The script

`bracket.scad` — save it, render it, change it:

```scad
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
```

Notes on the tricky lines:

- The upright holes are drilled along Y, so the cylinder is
  `rotate()`d −90° about X to point its axis along +Y. The cutter
  starts 1 mm in front of the upright and is 2 mm longer than the
  5 mm thickness — cutters must always clear both faces.
- Hole positions are expressions (`up_x0 + 10`), not bare numbers:
  widen the upright and the holes follow. That's the [constraint
  habit](sketches-and-constraints.md), in code.
- The gusset's two plates overlap the base and upright slightly —
  overlapping solids `union()` cleanly in the render. Don't fuss
  over exact abutment; overlap by a hair instead.

## Render and verify

```bash
openscad -o bracket.stl bracket.scad
```

**Check:** the render exits silently, and the STL's bounding box
is 60 × 40 × 50 mm — base 60 long, 40 wide, upright reaching
z = 50 (5 base + 45 upright). If any dimension is off, a variable
is wrong; the box doesn't lie.

## Print checklist

Run the [five checks](designing-for-fdm.md):

1. **Walls:** the bracket is solid 5 mm plate — no thin-wall
   worry. Use 3–4 perimeters and 20–40% infill; the upright's
   bending load wants perimeters more than infill.
2. **Overhangs:** none. Base is flat, upright is vertical, gusset
   is a 45°… well, the gusset's diagonal is exactly 45° (30 over
   30) — the boundary of the rule, and it prints fine.
3. **Weak axis:** print it flat on the base. The upright's load
   then runs across layers, and both base holes print vertically
   (clean circles).
4. **Holes:** 4.5 mm modeled for M4 — shrinkage margin built in.
5. **Bed contact:** the entire 60 × 40 base sits on Z = 0. No
   supports needed anywhere.

**Careful:** the upright holes print horizontally (their axis is
along Y). At 4.5 mm diameter that's fine without supports — but
don't scale the design up to 12 mm holes and expect the same.

## Make it yours

The parametric payoff, in four edits:

- **M5 version:** `hole_d = 5.5;` — every hole updates.
- **Taller upright:** `up_h = 60;` — holes stay 12 mm above the
  base, gusset keeps its 30 mm legs (or parametrize those too).
- **Longer base:** `base_l = 80;` — base holes stay 10 mm from
  each end, upright and gusset stay centered.
- **No gusset:** delete the `gusset();` line (and only that line).

Each change is one line, then re-render and re-check the bounding
box. That's a maintainable design.

**Next:** [Exporting and Sharing](exporting-and-sharing.md)
