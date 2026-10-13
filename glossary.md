# Glossary

**Boolean (operation)** — combining solids: *union* (add), 
*difference* (subtract), *intersection* (keep the overlap).
OpenSCAD's `difference()` is how most holes get made.

**Bridge** — a horizontal span printed between two supports, with
nothing underneath. Short bridges (up to ~10–25 mm) print fine;
long ones sag.

**CAD** — Computer-Aided Design: describing shapes with numbers
so machines can make them.

**Captive nut** — a standard nut trapped in a printed hexagonal
pocket, giving you real metal threads where you need them.

**Chamfer** — a flat 45° (usually) cut replacing a sharp edge.
Prints cleanly; the FDM-friendly alternative to a fillet.

**Clearance fit** — a joint with deliberate slack: the hole is
bigger than the shaft so parts assemble and move freely.

**Constraint** — a rule attached to a sketch ("this is 40 mm",
"these are parallel"). Constraints are what make a model
parametric.

**Elephant's foot** — the squished-wider first layer of a print.
Chamfer bottom edges or compensate in the slicer when it matters.

**Extrude** — pull a 2D sketch into a 3D solid (FreeCAD calls it
*Pad*). The most-used CAD operation.

**FDM** — Fused Deposition Modeling: 3D printing by extruding
molten plastic layer by layer. The process this guide designs for.

**Fillet** — a rounded edge. Removes stress risers; one click in
parametric tools, awkward in OpenSCAD.

**Fully defined** — a sketch where constraints nail down every
point; nothing can wiggle. The goal before you build on a sketch.

**Gusset** — a triangular rib reinforcing a corner joint, like the
one in [the bracket project](the-bracket-project.md).

**Heat-set insert** — a brass threaded insert melted into a
printed hole with a soldering iron. The strong way to put real
threads in plastic.

**hull()** — an OpenSCAD function returning the convex hull of its
children: shrink-wrap for geometry.

**Infill** — the internal structure of a print (honeycomb, grid,
etc.). Perimeters carry most of the strength; infill mostly keeps
the top layers up.

**Line width** — the width of one extruded plastic strand, usually
0.4–0.45 mm from a 0.4 mm nozzle. Design wall thicknesses as
multiples of it.

**Manifold / watertight** — a mesh with no holes, cracks, or
loose edges: a proper solid. Slicers want manifold meshes.

**Mesh** — a shape described as triangles (STL, 3MF). What the
slicer eats; hard to edit.

**Module** — OpenSCAD's named, reusable feature. A block of
geometry with a name and optional parameters.

**Origin** — the (0, 0, 0) corner of your model's universe. Put it
somewhere sensible (a corner or center of the bottom face).

**Overhang** — geometry sticking out past the layer below. Steeper
than 45° from vertical prints without supports; shallower needs
them.

**Parametric** — a model that remembers *how* it was built, so
changing a dimension updates everything downstream. Both
sketch-based and code-driven CAD are parametric.

**Perimeter** — one loop of the outer wall of a print. "3
perimeters" ≈ 1.2 mm wall with a 0.4 mm nozzle.

**Press / interference fit** — a joint with zero or negative
slack: the parts hold by friction.

**Revolve** — spin a 2D profile around an axis to make a round
part (knobs, pulleys, vases).

**Shrinkage** — plastic contracting as it cools; parts come out
slightly smaller than modeled. PLA barely shrinks; ABS/ASA more.

**Sketch** — a 2D drawing on a plane, the starting point of most
parametric features. Rough is fine; constraints make it exact.

**STEP** — a file format carrying real solid geometry between CAD
programs. The polite way to share an editable design.

**STL** — the standard mesh format for 3D printing: triangles,
no units, no metadata. Export it last.

**Support** — sacrificial printed scaffolding for overhangs.
Avoidable with 45° chamfers and smart orientation.

**Tolerance** — the acceptable error on a dimension, and by
extension the deliberate slack you design into mating parts.

**$fn** — OpenSCAD's "how many segments" control for curves.
Higher = rounder = slower.

**3MF** — a modern mesh format: triangles plus units, colors, and
print settings. STL's smarter successor.
