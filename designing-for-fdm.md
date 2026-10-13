# Designing for FDM

A model can be geometrically perfect and still print terribly.
FDM builds objects one horizontal layer at a time, out of squished
plastic strings — and that process has opinions. Design with them,
not against them.

## Walls: multiples of the line width

A printed wall is made of parallel **perimeters** (also called
walls/loops), each one **line width** wide — usually 0.4–0.45 mm
from a 0.4 mm nozzle. Design wall thicknesses as whole multiples:

| Perimeters | Wall thickness (0.4 mm nozzle) | Use for |
|---|---|---|
| 2 | 0.8 mm | Light-duty, prototypes |
| 3 | 1.2 mm | General purpose — the default |
| 4–5 | 1.6–2.0 mm | Load-bearing, screw bosses |

A 1.0 mm wall on a 0.4 mm nozzle forces the slicer into awkward
fractions (two perimeters + a gap, or a wobbly single fat line).
A 1.2 mm wall is three clean perimeters. **Model to the process:**
pick 0.8 / 1.2 / 1.6 / 2.0 and move on.

(If you run a 0.6 mm nozzle, the multiples shift to 1.2 / 1.8 /
2.4. Same idea.)

## Overhangs: the 45° rule

Each layer needs something underneath it. A wall leaning out at
**45° or steeper from vertical** prints fine — each layer is
supported by most of the one below. Shallower than 45°, and you're
printing in mid-air.

Consequences for design:

- Replace 90° ledges with 45° chamfers where you can. A 45°
  chamfer prints cleanly; a flat overhang needs supports.
- Arches beat flat ceilings: a 20 mm wide flat ceiling sags; an
  arched one (even a shallow arch) bridges much better.
- **Bridges** — horizontal spans between two supports — work up
  to roughly 10–25 mm depending on filament and cooling. Design
  short bridges; the slicer stretches straight strands across
  them.

## Orientation: choose what the layers do

Parts are strongest along the layers (X/Y) and weakest *between*
layers (Z) — layer adhesion is the weak axis, often half the
strength. So:

- Put mechanical loads **across** layers, not **along** Z. A hook
  that holds weight should print lying down, not standing up.
- Put the prettiest face **up or vertical** — the bottom gets the
  bed texture, overhangs get rougher.
- Put holes with their axis **vertical** when roundness matters —
  a vertical hole is a clean circle; a horizontal hole prints as a
  slightly saggy oval (and needs supports above ~10 mm diameter).

The L-bracket in [the project chapter](the-bracket-project.md)
prints flat on its base for exactly these reasons: no supports,
strong layer orientation for the upright's loads, clean vertical
holes.

## Supports: a cost, not a crime

Sometimes you need them. But supports cost time, filament, and
surface quality, so treat them as a design smell: *can I add a
45° chamfer instead? Can I split this into two parts that bolt
together?* Splitting a complex part into two simple printed parts
plus screws is often faster and stronger than one heroic print.

## Threads: don't model what you can buy

- **Printed threads** work for coarse, low-load jobs (a jar lid,
  a knob) — model them big (M12+) and with generous clearance.
  Small printed threads (M3–M6) are fiddly and weak.
- **Heat-set inserts** are the pro move for real fasteners: model
  a plain hole (sized per the insert's datasheet, typically screw
  Ø + ~1.5 mm), press the brass insert in with a soldering iron.
  Strong, repeatable, removable screws.
- **Captive nuts** are the free alternative: model a hexagonal
  pocket, drop a nut in mid-print (pause) or slide it in after.
  Size the pocket nut-flat-to-nut-flat + 0.2–0.3 mm.

## Text and details

Embossed (raised) or debossed (recessed) text needs to be **at
least 0.6–0.8 mm tall/deep and chunky** — fine serif fonts won't
survive a 0.4 mm nozzle. Sans-serif, bold, ≥ 4 mm letter height is
the safe zone. Details smaller than your line width simply don't
exist to the printer.

## The pre-print checklist

Before you export (see [Exporting and
Sharing](exporting-and-sharing.md)), run through this:

1. Walls are multiples of line width (0.8 / 1.2 / 1.6 / 2.0)?
2. Overhangs ≥ 45° from vertical, or supported, or bridged short?
3. Weak axis (Z) isn't carrying the main load?
4. Holes oversized for shrinkage ([tolerances](measuring-and-tolerances.md))?
5. Bottom face flat on Z = 0, no floating bits?

Five yeses and the slicer is on your side.

**Next:** [Project: The L-Bracket](the-bracket-project.md)
