# Descriptive Analysis of Synthetic STRONG Data

**DATA 550 — Data Science Toolkit**  
**Author:** Madhu Bulusu

## Overview

This project uses a **synthetic** dataset modeled on selected variables from the Study of Transition, Outcomes, and Gender (STRONG). It develops a reproducible descriptive analysis of adult participants, comparing transfeminine (TF) and transmasculine (TM) subgroups.

**All observations are simulated. No actual STRONG participant-level data are included. Results are not findings from the real STRONG study.**

## Objectives

- Describe age at index, study site, race/ethnicity, and administrative sex.
- Create Table 1 comparing TF and TM participant characteristics.
- Create Figure 1 showing age distributions in separate TF and TM panels.

## Project structure

```text
STRONG_Data_Analysis/
├── code/
│   ├── 00_simulate_data.R
│   ├── 01_prepare_data.R
│   ├── 02_make_table1.R
│   └── 03_make_figure1.R
├── data/
│   └── strong_simulated.rds
├── output/                  # Generated files
├── strong_analysis.Rmd
├── Makefile
├── README.md
└── strong_simulation.Rproj
```

## How to generate the report

Open a Terminal in the `STRONG_Data_Analysis` project directory. The project requires R, `make`, and the R packages used in the scripts and report (`dplyr`, `ggplot2`, `gtsummary`, `rmarkdown`, and `knitr`).

Then run this in the **Terminal**, not the R Console:

```bash
make
```

The Makefile generates two versions of the final report:

- **HTML report:** `strong_analysis.html`
- **PDF report:** `strong_analysis.pdf`

Both reports include Table 1 and Figure 1. PDF generation requires a LaTeX distribution.

To rebuild all generated outputs from scratch:

```bash
make clean
make
```

The Makefile uses the supplied synthetic dataset as input; it does not automatically rerun the simulation.

## Where to find the analysis code

| Component | Code file | Generated output |
| --- | --- | --- |
| Synthetic data generation | `code/00_simulate_data.R` | `data/strong_simulated.rds` |
| Adult sample preparation | `code/01_prepare_data.R` | `output/analysis_data.rds` |
| **Table 1: Participant characteristics by TF/TM** | **`code/02_make_table1.R`** | `output/table1.rds` |
| **Figure 1: Faceted age distributions** | **`code/03_make_figure1.R`** | `output/figure1.png` |
| Final HTML and PDF reports | `strong_analysis.Rmd` and `Makefile` | `strong_analysis.html`, `strong_analysis.pdf` |

The analysis includes simulated STRONG participants aged 18 years and older who are classified as transfeminine (TF) or transmasculine (TM). Table 1 summarizes age at index (mean and standard deviation) and demographic characteristics (counts and percentages). Figure 1 presents age distributions separately for the TF and TM subgroups.

## Privacy and interpretation

This public coursework repository is intended to contain **synthetic data only**. Do not upload actual STRONG records, confidential research files, credentials, or personally identifying information. The simulated patterns must not be interpreted as real study findings.
