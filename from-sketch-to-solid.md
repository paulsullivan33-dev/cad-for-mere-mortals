# From Sketch to Solid

Sketches are flat. Parts aren't. This chapter is the bridge: the
handful of operations that turn 2D shapes into 3D solids. Learn
these five and you can build most functional parts.

## Extrude: pull the sketch into a solid

**Extrude** takes a 2D shape and gives it thickness — like pushing
dough through a cookie cutter. It's the single most-used CAD
operation.

```scad
// A 30 x 20 mm rectangle, pulled 8 mm tall.
linear_extrude(height = 8)
    square([30, 20]);
```

In FreeCAD this is **Pad**; in Fusion, **Extrude**. Same thought:
pick a sketch, pick a distance, get a solid.

Extrudes also *cut*: sketch a circle on the face of a solid and
extrude it *into* the part, and you've made a hole. (In OpenSCAD
you'd more often use `difference()` with a cylinder, as in [Your
First Model](your-first-model.md) — same result.)

## Revolve: spin the sketch

**Revolve** spins a 2D profile around an axis. Knobs, pulleys,
vases, bottles — anything round.

```scad
// A knob: profile points are [radius, height], spun around Z.
rotate_extrude($fn = 64)
    polygon(points = [[0, 0], [12, 0], [12, 4], [6, 10], [0, 10]]);
```

Read the profile: start at the axis (radius 0, height 0), out to
radius 12, up 4 mm, taper in to radius 6, up to height 10, back to
the axis. Spun 360°, that's a knob 24 mm across and 10 mm tall
with a tapered top.

**Careful:** the profile must stay on one side of the axis (all
radii ≥ 0) and should touch the axis at the top and bottom if you
want a solid rather than a hollow shell. If your revolve looks
like a weird funnel, check for negative radii.

## Holes: through, blind, countersunk

Most holes are one of three:

- **Through hole** — all the way through. The `plate.scad` hole
  from [Your First Model](your-first-model.md): a cylinder taller
  than the part, `difference()`d out.
- **Blind hole** — partway. A cylinder that stops inside the part
  (a pocket for a magnet, a screw boss). In a parametric tool:
  extrude-cut with a depth instead of "through all."
- **Countersunk / counterbored** — a hole with a cone or wider
  cylinder at the top so a screw head sits flush:

```scad
// M4 countersunk hole in a 6 mm plate: 4.5 mm shaft, cone to 9 mm.
difference() {
    cube([30, 30, 6]);
    // straight shaft, all the way through
    translate([15, 15, -1])
        cylinder(d = 4.5, h = 8, $fn = 32);
    // cone at the top for the screw head
    translate([15, 15, 3])
        cylinder(d1 = 4.5, d2 = 9, h = 3, $fn = 32);
}
```

`d1` is the bottom diameter, `d2` the top — so this cone widens
upward, meeting the shaft at z = 3 and opening to 9 mm at the top
face (z = 6). The screw head hides inside.

## Fillets and chamfers: removing the sharp edge

**Fillet** = round an edge. **Chamfer** = cut it at 45°. Both do
three jobs: they remove stress risers (sharp inside corners crack),
they're kinder to fingers, and on printed parts they hide the
layer-line stair-step on angled edges.

In parametric tools this is one click on an edge. In OpenSCAD it's
awkward — honest limitation — so the pragmatic move is:

- Design the chamfer *into* the profile (draw the polygon with the
  corner already cut, like the knob's tapered top above), or
- Add a 1–2 mm 45° chamfer only where fingers or stress demand it,
  and skip the rest. Printed parts rarely need jewelry-grade
  fillets.

## Patterns: don't place sixteen holes by hand

**Pattern** (array) repeats a feature: four mounting holes, a row
of vents. In OpenSCAD it's a `for` loop — see [OpenSCAD in
Depth](openscad-in-depth.md). In parametric tools it's the Pattern
tool. Either way, the idea is the same: define it once, repeat it
with spacing.

## The feature list of a real part

Look at the L-bracket you'll build in [the project
chapter](the-bracket-project.md) through this lens:

1. Base plate — rectangle, extruded 5 mm.
2. Two holes — circles, cut through.
3. Upright — rectangle, extruded 5 mm, joined to the base.
4. Two more holes — cut through the upright.
5. Gusset — triangle, extruded 5 mm.

Five features. That's a Tuesday evening, not a thesis.

**Next:** [OpenSCAD in Depth](openscad-in-depth.md)
