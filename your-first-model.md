# Your First Model

Time to make real geometry. You'll install OpenSCAD, write a
six-line script, and render an STL file a slicer would accept.

## Installing OpenSCAD

OpenSCAD is free and open source, and it runs on everything:

- **Linux:** `sudo apt install openscad` (Debian/Ubuntu), or your
  distro's package manager.
- **Windows / macOS:** download the installer from
  [openscad.org](https://openscad.org/downloads.html).

**Check:** after installing, run:

```bash
openscad --version
```

You should see something like:

```
OpenSCAD version 2021.01
```

(The exact version doesn't matter; anything from the last few
years works with this guide. Every example here was rendered with
2021.01.)

## The first script

Create a file called `plate.scad` with this in it:

```scad
// A 40 x 30 x 5 mm plate with a 6 mm hole in the middle.
difference() {
    cube([40, 30, 5]);
    translate([20, 15, -1])
        cylinder(d = 6, h = 7, $fn = 32);
}
```

Read it inside out:

- `cube([40, 30, 5]);` — a box 40 mm in X, 30 in Y, 5 in Z, with
  one corner at the origin.
- `translate([20, 15, -1])` — move the next thing to the middle of
  the plate (20, 15), sunk 1 mm below the bottom (`-1`).
- `cylinder(d = 6, h = 7, $fn = 32);` — a 6 mm diameter cylinder,
  7 mm tall. `$fn = 32` says "draw the circle with 32 segments" —
  smooth enough to look round, coarse enough to render fast. It
  pokes 1 mm below and 1 mm above the plate so the cut goes all the
  way through.
- `difference() { A  B }` — *A minus B*: the plate with the
  cylinder's volume removed. A hole.

**The pattern to memorize:** `difference()` with the solid first
and the cutters after is how you make *most* holes, slots, and
pockets in OpenSCAD. You'll use it constantly.

## Rendering to STL

OpenSCAD can render without opening its GUI — handy for checking
your work:

```bash
openscad -o plate.stl plate.scad
```

**Check:** it exits silently (no news is good news) and `plate.stl`
exists. Peek at the size — a 40×30 plate with one hole should be a
few kilobytes, not zero bytes and not megabytes:

```bash
ls -la plate.stl
```

If you open `plate.stl` in your slicer, you'll see a plate with a
hole, sitting flat on the bed (Z = 0 is the bottom — remember
[Thinking in 3D](thinking-in-3d.md)).

## What just happened, conceptually

You did the whole CAD loop in six lines:

1. **Sketch** (implicit): the rectangle `[40, 30]` and the circle
   `d = 6`.
2. **Feature**: `cube` extruded the rectangle 5 mm; `difference`
   cut the hole.
3. **Export**: a mesh (STL) your slicer understands.

The `.scad` file is the *recipe*; the `.stl` is the *baked cake*.
Keep the recipe — see [What Is CAD?](what-is-cad.md).

## A second shape, for confidence

Add this to a new file, `shapes.scad`, and render it:

```scad
// Three primitives, spaced 30 mm apart.
cube([20, 20, 10]);

translate([30, 0, 0])
    cylinder(d = 20, h = 10, $fn = 32);

translate([60, 0, 0])
    sphere(d = 20, $fn = 32);
```

**Check:** `openscad -o shapes.stl shapes.scad` succeeds. In the
slicer you'll see a box, a cylinder, and a ball in a row. Notice
the sphere sits half *below* Z = 0 — spheres are centered on their
position, unlike cubes. (In the GUI you'd see this instantly;
headless, the STL's bounding box tells the story.)

**Careful:** `translate()` only affects the *next* statement. If
you write two shapes after one `translate`, only the first moves.
This bites everyone once.

**Next:** [Sketches and Constraints](sketches-and-constraints.md)
