(* ::Package:: *)
(* Musical Saw parametric Wolfram model. Estimate-only source; not fabrication authority. *)

ClearAll["Global`*"];

musicalSawMetadata = <|
   "instrument" -> "Musical Saw",
   "packet" -> "V5 L1 concept packet",
   "modelName" -> "Estimate-only flexural blade control relationship",
   "authority" -> "reference_only",
   "calibrationStatus" -> "pending measurement, not fabrication authority"
   |>;

activeLengthRatioEstimate = 1.; (* estimate — pending measurement, not fabrication authority *)
activeLengthRatioMinimumEstimate = 0.45; (* estimate — pending measurement, not fabrication authority *)
activeLengthRatioMaximumEstimate = 1.25; (* estimate — pending measurement, not fabrication authority *)
bendControlEstimate = 0.35; (* estimate — pending measurement, not fabrication authority *)
bendControlMinimumEstimate = 0.; (* estimate — pending measurement, not fabrication authority *)
bendControlMaximumEstimate = 1.; (* estimate — pending measurement, not fabrication authority *)
torsionControlEstimate = 0.2; (* estimate — pending measurement, not fabrication authority *)
torsionControlMinimumEstimate = 0.; (* estimate — pending measurement, not fabrication authority *)
torsionControlMaximumEstimate = 1.; (* estimate — pending measurement, not fabrication authority *)
bendPitchGainEstimate = 0.8; (* estimate — pending measurement, not fabrication authority *)
bendPitchGainMinimumEstimate = 0.; (* estimate — pending measurement, not fabrication authority *)
bendPitchGainMaximumEstimate = 2.; (* estimate — pending measurement, not fabrication authority *)
torsionPitchGainEstimate = 0.35; (* estimate — pending measurement, not fabrication authority *)
torsionPitchGainMinimumEstimate = 0.; (* estimate — pending measurement, not fabrication authority *)
torsionPitchGainMaximumEstimate = 2.; (* estimate — pending measurement, not fabrication authority *)
supportFactorEstimate = 1.; (* estimate — pending measurement, not fabrication authority *)
supportFactorMinimumEstimate = 0.5; (* estimate — pending measurement, not fabrication authority *)
supportFactorMaximumEstimate = 1.5; (* estimate — pending measurement, not fabrication authority *)
plotSampleCountEstimate = 24; (* estimate — pending measurement, not fabrication authority *)

ClearAll[
  musicalSawFlexuralFrequency,
  musicalSawControlFrequencyRatio,
  musicalSawCentsShift,
  musicalSawLengthSweep,
  musicalSawSymbolicLaw
  ];

musicalSawFlexuralFrequency[
   modalBeta_,
   activeLength_,
   youngModulus_,
   areaMoment_,
   density_,
   sectionArea_,
   supportFactor_
   ] :=
  (modalBeta^2/(2 Pi activeLength^2)) Sqrt[(youngModulus areaMoment)/(density sectionArea)] Sqrt[supportFactor];

musicalSawSymbolicLaw =
  HoldForm[
   f == (beta^2/(2 Pi activeLength^2)) Sqrt[(youngModulus areaMoment)/(density sectionArea)] Sqrt[supportFactor]
   ];

musicalSawControlFrequencyRatio[
   activeLengthRatio_,
   bendControl_,
   torsionControl_,
   bendPitchGain_,
   torsionPitchGain_,
   supportFactor_
   ] :=
  (1/activeLengthRatio^2) Sqrt[
    supportFactor (1 + bendPitchGain bendControl^2 + torsionPitchGain torsionControl^2)
    ];

musicalSawCentsShift[
   activeLengthRatio_,
   bendControl_,
   torsionControl_,
   bendPitchGain_,
   torsionPitchGain_,
   supportFactor_
   ] :=
  1200 Log[
    2,
    musicalSawControlFrequencyRatio[
     activeLengthRatio,
     bendControl,
     torsionControl,
     bendPitchGain,
     torsionPitchGain,
     supportFactor
     ]
    ];

musicalSawLengthSweep[
   lengthMinimum_,
   lengthMaximum_,
   sampleCount_Integer?Positive,
   bendControl_,
   torsionControl_,
   bendPitchGain_,
   torsionPitchGain_,
   supportFactor_
   ] :=
  Table[
   {
    lengthRatio,
    musicalSawControlFrequencyRatio[
     lengthRatio,
     bendControl,
     torsionControl,
     bendPitchGain,
     torsionPitchGain,
     supportFactor
     ]
    },
   {lengthRatio, Subdivide[lengthMinimum, lengthMaximum, sampleCount]}
   ];

musicalSawExplorer = Manipulate[
 Module[
  {
   ratio = musicalSawControlFrequencyRatio[
     activeLengthRatio,
     bendControl,
     torsionControl,
     bendPitchGain,
     torsionPitchGain,
     supportFactor
     ],
   cents = musicalSawCentsShift[
     activeLengthRatio,
     bendControl,
     torsionControl,
     bendPitchGain,
     torsionPitchGain,
     supportFactor
     ],
   sweep = musicalSawLengthSweep[
     activeLengthRatioMinimumEstimate,
     activeLengthRatioMaximumEstimate,
     plotSampleCountEstimate,
     bendControl,
     torsionControl,
     bendPitchGain,
     torsionPitchGain,
     supportFactor
     ]
   },
  Column[
   {
    Style[musicalSawMetadata["modelName"], 14, Bold],
    musicalSawSymbolicLaw,
    Grid[
     {
      {"authority", musicalSawMetadata["authority"]},
      {"normalized frequency ratio", NumberForm[ratio, {6, 3}]},
      {"cents shift from neutral control", NumberForm[cents, {7, 1}]},
      {"active length ratio placeholder", NumberForm[activeLengthRatio, {5, 2}]},
      {"bend control placeholder", NumberForm[bendControl, {5, 2}]},
      {"torsion control placeholder", NumberForm[torsionControl, {5, 2}]}
      },
     Alignment -> Left,
     Frame -> All
     ],
    ListLinePlot[
     sweep,
     Frame -> True,
     FrameLabel -> {
       "active vibrating length ratio estimate",
       "normalized frequency ratio"
       },
     PlotMarkers -> Automatic,
     PlotRange -> All,
     ImageSize -> Large
     ]
    }
   ]
  ],
 {{activeLengthRatio, activeLengthRatioEstimate, "active vibrating length ratio estimate"},
  activeLengthRatioMinimumEstimate, activeLengthRatioMaximumEstimate, Appearance -> "Labeled"},
 {{bendControl, bendControlEstimate, "S-curve bend control estimate"},
  bendControlMinimumEstimate, bendControlMaximumEstimate, Appearance -> "Labeled"},
 {{torsionControl, torsionControlEstimate, "torsion control estimate"},
  torsionControlMinimumEstimate, torsionControlMaximumEstimate, Appearance -> "Labeled"},
 {{bendPitchGain, bendPitchGainEstimate, "bend pitch-gain estimate"},
  bendPitchGainMinimumEstimate, bendPitchGainMaximumEstimate, Appearance -> "Labeled"},
 {{torsionPitchGain, torsionPitchGainEstimate, "torsion pitch-gain estimate"},
  torsionPitchGainMinimumEstimate, torsionPitchGainMaximumEstimate, Appearance -> "Labeled"},
 {{supportFactor, supportFactorEstimate, "support factor estimate"},
  supportFactorMinimumEstimate, supportFactorMaximumEstimate, Appearance -> "Labeled"},
 TrackedSymbols :> {
   activeLengthRatio,
   bendControl,
   torsionControl,
   bendPitchGain,
   torsionPitchGain,
   supportFactor
   }
 ]
