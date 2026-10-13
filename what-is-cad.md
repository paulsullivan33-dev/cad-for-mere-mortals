# What Is CAD?

**The one-sentence version:** CAD is drawing with numbers — you
describe a shape so precisely that a machine can manufacture it
without you standing there explaining.

## Why not just download models?

Downloading models (from Printables, Thingiverse, and friends) is
how most people start 3D printing, and there's nothing wrong with
it. But sooner or later you need a bracket that's 62 mm long instead
of 60, a lid that fits *your* box, or a replacement knob for a
stove the manufacturer stopped supporting in 2011. That's the moment
downloading stops working and CAD starts paying off.

CAD turns "I wish this existed" into a file you can print tonight.

## The two worlds

Every CAD tool falls into one of two families. They solve the same
problem with opposite philosophies:

| | Parametric modelers | Code-driven modelers |
|---|---|---|
| Examples | FreeCAD, Fusion, Onshape, Tinkercad, SolidWorks | OpenSCAD |
| You work by | Clicking, dragging, typing dimensions into sketches | Writing text: `cube([20, 20, 10]);` |
| Strength | Fast for one-off shapes; visual feedback | Perfect for parametric, repeatable parts; version-controllable |
| Feels like | Drawing | Programming |
| Price range | Free (FreeCAD, Tinkercad, Onshape free tier) to subscription (Fusion) | Free and open source |

**Parametric** means the model remembers *how* it was built: "this
hole is 10 mm from that edge." Change the 10 to 15 and the hole
moves. Both families are parametric — they just let you edit the
parameters differently.

This guide teaches the *ideas* with both families in mind, but every
hands-on example uses **OpenSCAD**, for one reason: code can be
tested. Every script in this guide was actually rendered before it
shipped, so the geometry you're reading about is geometry that
exists. Try doing that with a sequence of mouse clicks.

## Meshes vs solids: STL is not the model

Two file types you'll meet constantly:

- **The model** (your `.scad` file, or a FreeCAD `.FCStd`): the
  *recipe*. Editable, precise, small.
- **The mesh** (`.stl`, `.3mf`): the *baked cake*. A list of
  triangles approximating the shape. Your slicer eats meshes, but
  you can't easily change a dimension in one.

**The rule:** keep the recipe. Export the mesh only when you're
ready to slice. If someone sends you only an STL and you need it
2 mm wider, you're in for a bad afternoon — which is exactly why
learning CAD matters.

A third format, **STEP** (`.step`/`.stp`), sits between the two: it
carries real solid geometry (curves stay curves, not triangles) and
most CAD tools can open and edit it. When you share a design with
someone using different software, STEP is the polite choice. More
in [Exporting and Sharing](exporting-and-sharing.md).

## What CAD is not

- **Not art.** CAD models functional shapes with exact dimensions.
  Sculpting a dragon is a different discipline (and a different
  program — Blender).
- **Not the printer.** CAD makes the *design*; the slicer and the
  printer make the *object*. A perfect model can still print badly,
  and a sloppy model can sometimes print fine. See [Designing for
  FDM](designing-for-fdm.md).
- **Not one program.** The ideas — sketches, constraints, extrudes,
  tolerances — transfer between every tool on the list above. Learn
  the ideas once; the buttons are just details.

## The shape of the guide

You'll learn to *think* in 3D (coordinates, units), build your
first real model in OpenSCAD, understand the parametric ideas
(sketches, constraints, extrudes) that every GUI modeler uses, learn
the numbers that make parts actually fit (tolerances), learn the
rules that make parts actually print (designing for FDM), and finish
by designing a complete L-bracket from a blank file to a valid STL.

**Next:** [Thinking in 3D](thinking-in-3d.md)
