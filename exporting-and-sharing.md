# Exporting and Sharing

Your `.scad` file is the recipe. Your slicer needs the baked cake.
This chapter is the handoff: formats, mesh resolution, and the
units trap.

## The three formats

| Format | What it carries | Use it when |
|---|---|---|
| **STL** | Triangles only. No units, no color, no metadata. | Slicing. The universal minimum every slicer reads. |
| **3MF** | Triangles + units + colors + print settings hints. | Slicing, when your slicer supports it (most modern ones do). Strictly better than STL. |
| **STEP** | Real solid geometry — curves stay curves. | Sharing the *design* with someone using different CAD software. Editable, precise. |

**The rule of thumb:** STL (or 3MF) *to the printer*, STEP *to
another human*, `.scad`/`.FCStd` *to your future self*. Never
treat an STL as an archive of the design — it's the one format you
can't cleanly edit.

## Exporting from OpenSCAD

```bash
openscad -o bracket.stl bracket.scad
```

For 3MF: `openscad -o bracket.3mf bracket.scad`. Same command,
better container. For STEP, OpenSCAD can't help — STEP export is a
parametric-modeler feature (FreeCAD: File → Export → STEP).

## Mesh resolution: $fn and the faceting tradeoff

An STL approximates curves with flat triangles. Too few and your
"circle" is visibly a hexagon; too many and the file balloons.

- `$fn = 24`–`32`: fine for holes and small features while
  designing.
- `$fn = 64`: the final export for visible curves.
- `$fn = 128+`: diminishing returns — your 0.4 mm nozzle can't
  resolve the difference, but your slicer will take longer to
  think about it.

**Check:** export the bracket at `$fn = 32` and `$fn = 64` and
compare file sizes. The 64 version is bigger but not absurdly so;
if a simple part exports to tens of megabytes, something (usually
a `$fn` on a big flat part, or `minkowski()`) got out of hand.

## The units trap

STL files carry **no unit information** — just numbers. Everyone
*assumes* millimeters, and usually that's right. The trap:

1. You model in inches (or import a model made in inches).
2. You export numbers like `2.5`.
3. The slicer reads `2.5 mm`. Your 2.5-inch part arrives the size
   of a grain of rice.

**Defenses:** model in millimeters from the start ([Thinking in
3D](thinking-in-3d.md)); when importing someone else's STL, check
the slicer's reported dimensions *before* printing — a phone stand
that previews at 1800 mm long was modeled in inches (or cm).

## Sharing your designs

- **Printables / Thingiverse / MakerWorld:** share the STL/3MF
  *and* the source (`.scad` or STEP). Source included is what
  separates a file dump from a design others can adapt.
- **License:** pick one and state it. CC BY-SA and MIT are common
  for hobby designs; "all rights reserved" is also fine — just say
  so instead of leaving it ambiguous.
- **Document the parameters:** a README that says "M4 holes, 5 mm
  plate, prints without supports" is worth more than a fourth
  photo. Future-you is also a downloader.

## Versioning designs

`.scad` files are text — they belong in git, like any code. Commit
the script; optionally commit the exported STL too (it's a build
artifact, but handy for downloaders). A commit message like
"bracket: widen base to 80 mm for the new shelf" beats "update"
every time. (Git itself is covered in [Git for Mere
Mortals](https://paulsullivan33-dev.github.io/git-for-mere-mortals/).)

**Next:** [Troubleshooting](troubleshooting.md)
