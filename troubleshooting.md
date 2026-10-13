# Troubleshooting

Symptom → likely cause → fix. Design problems first, OpenSCAD
problems second.

## The part doesn't fit

**Holes too small for the screws.** The classic. Holes print
0.1–0.3 mm undersized — see [Measuring and
Tolerances](measuring-and-tolerances.md). Fix: model clearance
holes oversize (4.5 mm for M4), or drill the printed hole to size.
A drill bit is a legitimate CAD tool.

**Peg won't go in the hole.** Same cause, or elephant's foot on
the peg's first layer. Fix: add the joint clearance from the
[tolerance table](measuring-and-tolerances.md) (start with
+0.3 mm on the hole), chamfer the peg's bottom edge 0.5 mm.

**It fit yesterday's print but not today's.** Filament, temperature,
or slicer settings changed — not the model. Fix: reprint the test
coupon before blaming the design.

## The print fails

**Warping / corners lifting.** Plastic shrinks as it cools; big
flat parts pull up at the corners. Fix: brim or raft, hotter bed,
enclosure for ABS/ASA, or split the part. (This is a printer
problem wearing a design costume — the model is probably fine.)

**Layer separation on tall thin parts.** Fix: orient the part so
the weak Z axis isn't the loaded direction ([Designing for
FDM](designing-for-fdm.md)), print hotter, slow down.

**Stringy / blobby holes.** Small holes + retraction settings.
Fix: drill them out, or model holes slightly larger and let the
slicer do less heroics.

## OpenSCAD renders nothing

**Empty render, no error.** Usually a `difference()` whose cutters
miss the solid — a hole positioned outside the part removes
nothing and warns about nothing. Fix: check the cutter's
`translate()` against the solid's bounds. Temporarily render the
cutter *without* the difference to see where it actually is.

**"WARNING: Ignoring unknown variable 'hole_d'"** (real message from
OpenSCAD 2021.01):

```
WARNING: Ignoring unknown variable 'hole_d' in file plate.scad, line 4
```

Fix: typo in the variable name — OpenSCAD treats the unknown name
as `undef` and soldiers on, so the geometry silently comes out
wrong. **Read warnings.** An `undef` in a dimension usually means
a zero-size or missing feature, not a crash.

**A 2D shape where a 3D one was expected.** Real messages —
note these are *warnings*, so the render "succeeds" with the 2D
part silently dropped, which is worse than an error:

```
WARNING: Mixing 2D and 3D objects is not supported in file x.scad, line 3
WARNING: Ignoring 2D child object for 3D operation in file x.scad, line 3
```

Fix: you passed `square()` to something wanting a solid
(`cube()`, `cylinder()`, `difference()`), or forgot
`linear_extrude`. The line number points at the guilty statement.

## The render is wrong

**The hole goes sideways.** The cutter cylinder's axis isn't where
you think. Fix: remember `rotate([-90, 0, 0])` tips a Z-cylinder
onto the +Y axis ([the bracket
project](the-bracket-project.md)); render the cutter alone to
check its orientation.

**Circles look like hexagons.** `$fn` too low. Fix: `$fn = 32`
while designing, `$fn = 64` for export — see [Exporting and
Sharing](exporting-and-sharing.md).

**Render takes forever.** Suspects, in order: `$fn` set
absurdly high, `minkowski()` anywhere (it's brutally slow),
deeply nested `difference()`/`intersection()`. Fix: lower `$fn`
while iterating; reserve `minkowski()` for final exports or avoid
it.

## The slicer complains

**"Model is not watertight" / non-manifold edges.** The mesh has
holes or internal walls. From OpenSCAD this is rare (its
booleans are robust) — it usually means coincident faces from
two cubes exactly abutting. Fix: overlap abutting solids by
0.01–0.1 mm instead of aligning them exactly, re-export.

**Slicer dimensions look wrong (giant or tiny).** The units trap
— see [Exporting and Sharing](exporting-and-sharing.md). Fix:
check whether the model was inches; scale by 25.4 if so.

## The meta-fix

When stuck: **simplify until it works, then add back.** Comment
out half the script (`//`), render, repeat. CAD debugging is
binary search — the same skill as any other debugging, applied to
geometry.

**Next:** [Glossary](glossary.md)
