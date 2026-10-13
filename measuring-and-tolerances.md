# Measuring and Tolerances

CAD is exact. Printers are not. This chapter is about the gap
between the two — and the numbers that bridge it.

## Tolerance: how wrong you're allowed to be

A **tolerance** is the acceptable error on a dimension. When you
model a 20 mm peg, the printer might produce 19.85 or 20.1 mm.
Tolerance thinking means asking, for every mating surface: *how
much slop can this joint survive?*

Two joints, two answers:

- **Clearance fit** (parts must move or assemble easily): design
  the hole *bigger* than the shaft, deliberately.
- **Press/interference fit** (parts must stay put): design the
  hole *at or slightly below* the shaft size, and let friction (or
  heat) do the work.

## Clearance holes for screws

A screw needs a hole bigger than its threads. Starting points
that work on most FDM printers:

| Screw | Screw Ø | Clearance hole Ø | Snug hole Ø |
|---|---|---|---|
| M3 | 3.0 mm | 3.4 mm | 3.2 mm |
| M4 | 4.0 mm | 4.5 mm | 4.2 mm |
| M5 | 5.0 mm | 5.5 mm | 5.2 mm |

"Clearance" = the screw drops through freely. "Snug" = it threads
in with finger pressure and won't rattle. **These are starting
points, not laws** — your printer, filament, and slicer settings
move them by ±0.1–0.2 mm. The project in this guide uses 4.5 mm
clearance holes for M4 screws, the middle of the road.

## The printed-hole problem

**Holes print smaller than modeled** — typically 0.1–0.3 mm
undersized. Molten plastic gets dragged inward as the nozzle
circles, and the effect is worst on small holes. So:

- A modeled 4.5 mm hole often measures ~4.3 mm. For M4 clearance
  that's still fine — which is why the table above has margin
  built in.
- A modeled 3.0 mm hole for an M3 screw will likely *not* fit.
  Model it at 3.4 and thank the shrinkage.
- For precision fits (bearings, shafts), model slightly under and
  finish with a drill bit. A 8 mm drill through a modeled 7.8 mm
  hole gives you a true 8.00 mm bore — the cheapest precision in
  the hobby.

## Designing mating parts

When two printed parts must fit together, don't model them
line-to-line (shaft 10.0, hole 10.0). Give the joint room:

| Joint | Rule of thumb |
|---|---|
| Sliding (drawer, hinge) | hole = shaft + 0.3 mm |
| Easy assembly (lid on box) | hole = shaft + 0.4–0.5 mm |
| Snug (press with thumb) | hole = shaft + 0.1–0.2 mm |
| Permanent press | hole = shaft − 0.1 mm (or heat-set) |

And the golden rule: **print a test coupon first.** A 20-minute
test print of just the joint beats a 6-hour print of the whole
assembly that doesn't fit. Model a small block with your hole, a
small peg with your shaft, print both, adjust once.

## Shrinkage and elephant's foot

Two printer behaviors that eat tolerances:

- **Shrinkage:** plastics contract as they cool. PLA barely (~0.2%);
  ABS/ASA more (~0.5–1%). Large flat parts come out slightly
  small. Slicers have a shrinkage-compensation setting; for most
  PLA parts you can ignore it.
- **Elephant's foot:** the first layer squishes wider than modeled.
  If a part must sit flat *and* mate precisely at its base, add a
  0.5 mm × 45° chamfer to the bottom edge, or enable the slicer's
  elephant's-foot compensation.

## Measuring what you got

Close the loop: measure the print with calipers, compare to the
model, and write the difference on the test coupon. After three or
four parts you'll know *your* printer's habits — "my holes come
out 0.2 under, my walls 0.1 over" — and your designs will start
fitting the first time.

**The one-line summary:** model holes bigger than the math says,
test the joint before the assembly, and let the caliper — not
hope — decide.

**Next:** [Designing for FDM](designing-for-fdm.md)
