# CAD for Mere Mortals

**CAD** (Computer-Aided Design) is how you tell a computer exactly
what shape you want — so a 3D printer, a CNC mill, or a laser cutter
can make it real. If the 3D-printing guide was about *printing*
other people's designs, this guide is about *drawing your own*.

No art degree required. Ideas first, then real models you build and
render yourself, in millimeters, with numbers that all check out.

## What this guide covers

- **What CAD is** — the two worlds: parametric modelers (FreeCAD,
  Fusion, Onshape, Tinkercad) and code-driven modeling (OpenSCAD)
- **Thinking in 3D** — coordinates, units, and the sketch-to-solid
  idea behind every CAD tool
- **Your first model** — installing OpenSCAD and rendering real
  geometry
- **Sketches and constraints** — the parametric way: dimensions
  instead of eyeballing
- **From sketch to solid** — extrude, revolve, holes, fillets
- **OpenSCAD in depth** — variables, modules, loops, and parametric
  parts
- **Measuring and tolerances** — calipers, clearance, and why holes
  print small
- **Designing for FDM** — wall thickness, overhangs, orientation,
  threads
- **Project: the L-bracket** — a complete part, designed, exported,
  and print-ready
- **Exporting and sharing** — STL vs STEP vs 3MF, and the units trap
- **Troubleshooting** — symptom → fix, including real OpenSCAD
  error messages

## What it doesn't cover

Sculpting organic shapes (that's Blender territory), 2D drafting for
construction documents, CAM toolpaths for CNC mills, or advanced
surfacing. Those are real skills; they're just beyond this guide's
scope. Everything here is aimed at one goal: **functional parts you
can print on an Ender-style or Bambu-style FDM printer.**

## How to use this guide

Every OpenSCAD example was rendered with real OpenSCAD 2021.01
before shipping — the geometry is real and the STL files are valid.
**Check:** blocks show what success looks like. **Careful:** marks
steps where a wrong number wastes plastic. Dimensions in the
project chapter are the single source of truth; every chapter that
references the bracket uses the same numbers.

## Chapters

1. [What Is CAD?](what-is-cad.md)
2. [Thinking in 3D](thinking-in-3d.md)
3. [Your First Model](your-first-model.md)
4. [Sketches and Constraints](sketches-and-constraints.md)
5. [From Sketch to Solid](from-sketch-to-solid.md)
6. [OpenSCAD in Depth](openscad-in-depth.md)
7. [Measuring and Tolerances](measuring-and-tolerances.md)
8. [Designing for FDM](designing-for-fdm.md)
9. [Project: The L-Bracket](the-bracket-project.md)
10. [Exporting and Sharing](exporting-and-sharing.md)
11. [Troubleshooting](troubleshooting.md)
12. [Glossary](glossary.md)

*Written to the [nine-point writing standard](criteria.md) shared by
every guide in this series.*

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [OpenSCAD for Mere Mortals](https://paulsullivan33-dev.github.io/openscad-for-mere-mortals/)
- [KiCad for Mere Mortals](https://paulsullivan33-dev.github.io/kicad-for-mere-mortals/)
- [3D Printing for Mere Mortals](https://paulsullivan33-dev.github.io/3d-printing-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/cad-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/cad-for-mere-mortals/blob/main/LICENSE-CODE).
