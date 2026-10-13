# Thinking in 3D

Before you model anything, you need the mental furniture: where
things are, what unit you're in, and the one big idea every CAD
tool is built on.

## Coordinates: X, Y, Z

Every point in your model has an address made of three numbers:
`(x, y, z)`. The conventions:

- **X** — left/right (width)
- **Y** — front/back (depth)
- **Z** — down/up (height)

Z is up. This trips up everyone exactly once — in school math, Y
was up. In CAD and 3D printing, **Z is up**, because that's the
direction the printer builds. A point at `(10, 20, 5)` is 10 mm
right, 20 mm back, 5 mm up from the origin.

The **origin** `(0, 0, 0)` is the corner of your universe. In
OpenSCAD, `cube([20, 20, 10])` puts one corner at the origin and
extends 20 in X, 20 in Y, 10 in Z. In parametric modelers, you
usually sketch centered on the origin so the part grows
symmetrically.

**The habit to build:** before modeling a real part, decide where
the origin goes. A good default: a corner or the center of the
part's bottom face, so Z = 0 is the surface that sits on the print
bed. Your future self, orienting the STL in the slicer, will thank
you.

## Units: millimeters, always

The 3D-printing world runs on **millimeters**. Slicers assume
millimeters. Filament is 1.75 mm. Nozzles are 0.4 mm. If you model
in inches or centimeters and export without converting, your 20 mm
bracket arrives as a 20-*inch* bracket (or a 2 mm speck).

**The rule:** model in millimeters, export in millimeters, and
distrust any file that doesn't say. The units trap is common enough
to get its own section in [Exporting and
Sharing](exporting-and-sharing.md).

## The one big idea: sketch → feature

Every CAD tool, GUI or code, works the same way underneath:

1. **Sketch** — draw a 2D shape (a rectangle, a circle, a profile).
2. **Feature** — do something 3D with it: pull it into a solid
   (*extrude*), spin it (*revolve*), cut it out of something else.

A box is a rectangle, extruded. A pipe is a circle, extruded, with
a smaller circle cut out. A vase is a curved profile, revolved. A
bracket is rectangles, extruded, with holes cut out. That's about
80% of functional CAD: **2D shapes, given thickness.**

In OpenSCAD the "sketch" and the "feature" happen in one line —
`linear_extrude(height = 10) square([20, 20]);` — but it's the same
idea. In FreeCAD you'd draw the square in the sketcher, then hit
Pad. Different buttons, same thought.

## Measuring the real world

CAD models real objects, so it starts with real measurements. The
tool is a **digital caliper** (about $20–30, worth every cent):

- Measure twice, in two orientations. Plastic parts are rarely
  perfectly square.
- Measure the *mating* part, not your memory of it. "M4 screw"
  means the screw is ~4.0 mm, but the hole you need is bigger —
  see [Measuring and Tolerances](measuring-and-tolerances.md).
- Write measurements down *with a sketch*, even a rough one on
  paper. "40 wide, 5 thick, holes 10 from each end" is already a
  design.

**Careful:** calipers have an inside-measurement jaw and an
outside-measurement jaw — using the wrong one is a classic 2 mm
error. The small jaws on top measure insides (holes); the big jaws
measure outsides.

## Think in features, not triangles

Beginners try to build shapes triangle-by-triangle in their head.
Don't. Think in **features**: "a base plate, an upright, four
holes, a gusset." Each feature is one sketch plus one operation.
The L-bracket you'll build in [the project
chapter](the-bracket-project.md) is exactly four features — and
you'll be able to change any dimension in one place.

**Next:** [Your First Model](your-first-model.md)
