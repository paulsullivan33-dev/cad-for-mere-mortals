# Sketches and Constraints

This chapter is about the *parametric* world — FreeCAD, Fusion,
Onshape, SolidWorks. There are no scripts to run here; instead,
you're learning the ideas those programs are built on, so the first
time you open one, it feels familiar instead of alien.

## The sketch: a drawing with rules

A **sketch** is a 2D drawing on a flat plane — usually one of the
three principal planes (XY, XZ, YZ), or the face of something
you've already built. You draw rough shapes: rectangles, circles,
lines, arcs. Rough is fine, because the magic isn't the drawing —
it's what comes next.

## Constraints: telling the sketch what you mean

A **constraint** is a rule you attach to the sketch. Instead of
carefully drawing a 40 mm line, you draw *any* line and add a
**dimension constraint**: "this is 40 mm." Instead of eyeballing
two lines parallel, you add a **geometric constraint**:
"parallel."

The common ones:

| Constraint | What it says | Example |
|---|---|---|
| Dimension | "This length/radius is exactly N" | Hole diameter = 4.5 mm |
| Horizontal / Vertical | "This line is exactly horizontal/vertical" | Bracket edges |
| Coincident | "These two points touch" | Line endpoint on a circle |
| Parallel / Perpendicular | The obvious | Bracket sides |
| Concentric | "Same center" | Bolt circle holes |
| Symmetric | "Mirror of each other about this line" | Two holes mirrored |

## Fully defined: the goal

A sketch is **fully defined** (some programs say "fully
constrained") when every point's position is nailed down by
constraints — nothing can wiggle. Programs usually color-code this:
blue/under-defined (can still move), black or green/fully defined.

**Why it matters:** an under-defined sketch is a landmine. You
change one dimension and a hole slides somewhere unexpected,
because it was never actually *told* where to be — it just happened
to look right. Fully defining is the parametric equivalent of
writing down your measurements instead of trusting your memory.

**The habit:** when a sketch looks right, try dragging its points.
If anything moves that shouldn't, add constraints until it can't.
Five minutes here saves a reprint later.

## The parametric superpower: edit, don't redraw

Remember the bracket that's 62 mm instead of 60? In a parametric
modeler you open the sketch, change the dimension `60` to `62`, and
everything built on that sketch — holes positioned from its edges,
the upright sitting on its face — updates. The model *remembers
how it was built*.

This is also why parametric models beat raw STLs: an STL has no
dimensions to edit, just triangles. The recipe (sketch +
constraints + features) is the valuable part. Same rule as
[What Is CAD?](what-is-cad.md): keep the recipe.

## How this maps to OpenSCAD

OpenSCAD doesn't have interactive sketches — but the *idea* is
identical, and you'll use it in every script from here on:

- A **dimension constraint** becomes a **variable**:
  `hole_d = 4.5;` used everywhere the hole appears. Change it once,
  every hole updates. (See [OpenSCAD in
  Depth](openscad-in-depth.md).)
- A **geometric constraint** becomes **math in the script**:
  `translate([x, base_w/2, -1])` *is* a "centered" constraint,
  written as arithmetic.

So when a FreeCAD tutorial says "constrain the hole 10 mm from the
edge," your OpenSCAD brain hears `translate([10, ...])`. Same
thought, different buttons — exactly as promised.

## Which parametric tool should you try?

Honest, short guidance:

- **Tinkercad** (free, browser): the shallow end. Great for a first
  afternoon, outgrown quickly.
- **FreeCAD** (free, open source, all platforms): the real thing,
  zero cost. Rougher edges than commercial tools, fully capable.
- **Fusion** (free tier for hobbyists): polished, widely
  tutorialized. Cloud account required; check the current free-tier
  limits before investing heavily.
- **Onshape** (free tier): runs in a browser, excellent for
  Chromebooks. Free-tier designs are public.

Any of them will teach you sketches and constraints. Pick the one
whose installer annoys you least.

**Next:** [From Sketch to Solid](from-sketch-to-solid.md)
