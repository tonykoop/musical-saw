# Design Intent — musical-saw rev A

- Master CAD: none exists. `wolfram/musical-saw-wolfram-model.wl` (sha256: ef107c5af229e00420eb38e2f3d78fe94190869cd976110a1a2002d7a5bfae5e) is the only computational source — a dimensionless control-ratio model (reference_only).
- Function: A flexible hand-saw blade, bowed or struck, played by controlling S-curve bend, torsion, support, and contact point rather than fixed frets or tuned bars (design.md "Design Thesis"). Bowed mode is primary (sustained tone); struck mode is a secondary transient-response test.
- Environment: hand-held/bowed acoustic mechanism; sharp-edge and uncontrolled-motion safety hazards are first-order concerns.
- Target qty: 1 (concept study). Deadline: TBD. Budget: TBD.

## Critical dimensions (carry tolerances)

None exist. design.md's "Parametric Intent" section names seven unknowns
(`estimate_blade_family_pending_measurement`,
`estimate_blade_flex_state_pending_measurement`,
`estimate_bow_contact_region_pending_measurement`,
`estimate_strike_contact_region_pending_measurement`,
`estimate_handle_support_method_pending_measurement`,
`estimate_safety_guarding_pending_measurement`,
`estimate_pitch_observation_method_pending_measurement`) and states none are
specified. The Wolfram model's constants (activeLengthRatioEstimate=1.0,
bendControlEstimate=0.35, torsionControlEstimate=0.2, etc.) are all
dimensionless 0-1 control-ratio placeholders, not blade geometry.

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Blade material/thickness/profile | TBD | measurement_required | governs safe flex + tone | design.md "Blade" (not specified) |
| Active vibrating length ratio | dimensionless (Wolfram placeholder: 1.0) | measurement_required | pitch control | wolfram model `activeLengthRatioEstimate` |
| Bend/torsion control | dimensionless (placeholders: 0.35 / 0.2) | measurement_required | pitch control | wolfram model |

## Incidental (free for DFM)

- Not applicable yet — no geometry exists to separate critical vs. incidental features.

## Must-nots (DFM may never violate)

- Do not create CAD, DXF, tuning tables, blade profiles, or fixture geometry
  before measured blade-survey and flex-test data exist (decision-record.md
  "Rejected For L1").
- Do not treat the Wolfram model's dimensionless control ratios as absolute
  blade dimensions.
- Do not skip the safety review (edge guarding, storage, transport) before
  any public build guidance (design.md "First Measurement Gates").

## Material intent

- Blade: unspecified saw-blade family (bom.csv `blade`, `pending_measurement`).

## Stage status

Stage 0 intake complete 2026-07-01 (documentation-only; no CAD master exists
to intake). Gate A (Alpha shop compile) NOT applicable until measured blade
survey and safety data exist.
