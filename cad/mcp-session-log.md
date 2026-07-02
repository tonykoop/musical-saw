<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# CAD MCP And Authoring Log

Status: V5 L1 provenance stub.

No MCP, CAD, CAM, Wolfram Desktop, Wolfram Cloud, image-generation,
creative-tool, measurement, or fabrication session produced an artifact in this
repository. Wolfram source added later was authored by hand as reference-only
code.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-30-local | codex text edit | user prompt; failed qmd Step 0 | `README.md`; `design.md`; `bom.csv`; `decision-record.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | packet_scaffold | concept_only | self_checked | No blade dimensions, tuning values, curvature values, CAD geometry, DXF coordinates, toolpaths, measured data, or fabrication instructions were generated. |
| 2026-05-30-codex-musical-saw-wolfram | codex text edit | User round 8 Wolfram authoring prompt; existing concept packet | `musical-saw-starter.wl`; `wolfram/musical-saw-wolfram-model.wl`; `visual-output-register.csv`; `cad/mcp-session-log.md` | wolfram_source_authoring | reference_only | self_checked | No MCP, Wolfram Desktop, Wolfram Cloud, CAD, measurement, or fabrication session was run. Source authored by hand; all physical inputs are Estimate placeholders pending measurement and not fabrication authority. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | design.md; bom.csv; decision-record.md | `risks.md`; `sourcing.csv`; `cut-list.csv`; `validation.csv`; `drawing-brief.md` | packet_refresh | concept_only | self_checked | V5 refresh pass: verified README Status line already matches the approved format (no change needed). Scaffolded missing baseline files (all TBD/measurement_required). Deliberately did NOT author cad/*.scad — wolfram/musical-saw-wolfram-model.wl models only DIMENSIONLESS control ratios (no absolute blade length/thickness/material constants anywhere in this repo), and decision-record.md explicitly rejects CAD/DXF at L1; there is nothing to parameterize a dimensioned model from. |

## Promotion Rule

Promote an artifact to `fabrication` only after reviewed CAD, DXF, design-table
parameters, measured templates, or physical build measurements are committed
and cited in the authority register.
