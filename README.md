<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Musical Saw

Status: L1 concept packet

This repository is a V5 L1 concept packet for a musical saw: a flexible hand
saw played by bowing or striking while the blade is bent into an S curve. Pitch
is controlled by changing the bend, torsion, support, and contact point rather
than by fixed frets, holes, or tuned bars.

This packet is not a build-ready plan. It contains no released dimensions, no
tuning table, no blade profile, no steel specification, no bowing force, no
handle geometry, no fixture geometry, no DXF coordinates, no CAD geometry, and
no fabrication instructions. All physical claims are concept-only or pending
measurement.

## Packet Map

- `design.md` - mechanism study, playing modes, subsystem boundaries, and
  measurement gates.
- `bom.csv` - estimated part classes and unresolved procurement decisions.
- `decision-record.md` - qmd Step 0 result, decisions, assumptions, and open
  questions.
- `visual-output-register.csv` - V5 authority register; every row is
  `concept_only` or `pending_measurement`.
- `cad/mcp-session-log.md` - provenance stub; no MCP or CAD authoring occurred.

## Mechanism Summary

- A flexible saw blade is bent into an S curve so a localized vibrating region
  can speak.
- Bowed playing excites a sustained tone with bow hair, rosin, and contact
  control.
- Struck playing is possible as a secondary test mode, but damping and safety
  must be reviewed before treating it as a performance method.
- Pitch depends on blade flex state, torsion, hand support, bow or strike
  point, and material behavior.
- Bow control, handle comfort, blade edge safety, flex repeatability, and
  measurement repeatability are first-order risks.

## Readiness Boundary

L1 means this repo captures concept intent, mechanism boundaries, and risk
structure only. Promotion to L2 requires reviewed parameter names, a measurement
plan, a safe blade-handling strategy, and a clear separation between blade
authority, bowing authority, flex-control authority, and future visual or CAD
artifacts.
