# OpenSCAD in Depth

You can already render models. Now the language features that turn
one-off scripts into *designs you can change*: variables, modules,
loops, and `hull()`.

## Variables: dimensions with names

A variable is a dimension constraint with a name (see [Sketches
and Constraints](sketches-and-constraints.md)). Set them at the
top; everything below follows:

```scad
wall = 2;
w = 60; d = 40; h = 30;
```

Change `w = 60` to `w = 80` and every feature that references `w`
updates — the parametric superpower, in text form. **One rule:**
give every meaningful number a name. A script full of bare `10`s
and `4.5`s is a script you can't safely edit next month.

(OpenSCAD variables are set-once: assign the same name twice and
the last assignment wins, with a warning. So don't.)

## Modules: named features

A **module** is a reusable feature — the script equivalent of a
parametric tool's feature tree entry:

```scad
wall = 2;
w = 60; d = 40; h = 30;

// An open-top box: outer solid minus inner cavity.
module box_shell() {
    difference() {
        cube([w, d, h]);
        translate([wall, wall, wall])
            cube([w - 2*wall, d - 2*wall, h]);
    }
}

box_shell();
```

The inner cube starts one `wall` in from every side and pokes
through the top, so `difference()` leaves a 2 mm floor, 2 mm walls,
and an open top. Render it — then change `h = 30` to `h = 45` and
re-render. That's the whole pitch.

Modules can take parameters, like functions:

```scad
module bolt_hole(d, depth) {
    translate([0, 0, -1])
        cylinder(d = d, h = depth + 2, $fn = 24);
}
```

## Loops: patterns without the tedium

`for` repeats a feature — the script version of a pattern:

```scad
wall = 2;
w = 60; d = 40; h = 30;

difference() {
    // the box from above, vent slots cut in the front wall
    difference() {
        cube([w, d, h]);
        translate([wall, wall, wall])
            cube([w - 2*wall, d - 2*wall, h]);
    }
    for (x = [10 : 10 : w - 10])
        translate([x, -1, 10])
            cube([5, wall + 2, 12]);
}
```

`[10 : 10 : w - 10]` means "10, 20, 30… up to w − 10" — five slots
for `w = 60`, seven for `w = 80`, automatically. Each slot is a
5 mm wide cutter punching through the 2 mm front wall (the cutter
is `wall + 2` deep so it clears both faces).

**Careful:** loop variables are local to the loop. And like
`translate()`, `for` applies to the *next statement only* — wrap
multiple shapes in `{ }` if the loop should repeat all of them.

## hull(): shrink-wrap

`hull()` returns the convex hull of its children — imagine
shrink-wrapping them:

```scad
// A capsule: two cylinders, shrink-wrapped.
hull() {
    translate([-15, 0, 0]) cylinder(d = 10, h = 5, $fn = 32);
    translate([15, 0, 0]) cylinder(d = 10, h = 5, $fn = 32);
}
```

Two 10 mm discs, 30 mm apart, become a 40 mm capsule. `hull()` is
also the clean way to build gussets and brackets from simple
pieces — you'll use exactly this trick in [the project
chapter](the-bracket-project.md).

## $fn, $fa, $fs: how round is round?

Circles in CAD are polygons pretending. Three variables control
the pretense:

- `$fn` — fixed number of segments. `cylinder($fn = 32)` is
  smooth enough for most printed parts.
- `$fa` / `$fs` — minimum angle / size per segment; the
  automatic, size-aware alternative.

**The habit:** use `$fn = 24`–`32` while designing (fast renders),
bump to `$fn = 64` for the final export of visible curves. More in
[Exporting and Sharing](exporting-and-sharing.md).

## Putting it together: the design workflow

1. **Variables** at the top — every dimension that matters.
2. **Modules** for each feature — base, holes, lid.
3. **Assemble** at the bottom — `difference()` the cutters out of
   the solids.
4. **Render, measure the STL** (bounding box matches your
   variables?), print.

When a dimension is wrong, you change *one line*. That's not a
party trick — it's the difference between a design you can
maintain and a script you rewrite from scratch.

**Next:** [Measuring and Tolerances](measuring-and-tolerances.md)
