# Scientific R Visualization

**Reproducible R workflows for scientific data analysis and publication-quality visualization**

This repository is being developed as a collection of reusable R workflows for analysing and visualizing biological and environmental research data. The aim is to produce clear, reproducible and publication-ready outputs while maintaining transparent data-processing and analysis steps.

The workflows are particularly relevant to experimental research involving treatment comparisons, temporal responses, elemental concentrations, biological measurements and environmental datasets.

## Purpose

Scientific figures should communicate results clearly while allowing the underlying analysis to be reproduced. This repository provides structured R workflows that can be adapted to different experimental datasets.

The main objectives are to:

- organize raw and processed data systematically
- perform reproducible data cleaning and transformation
- calculate descriptive statistics and derived variables
- compare experimental treatments
- visualize temporal and treatment-related patterns
- generate publication-quality scientific figures
- export figures in formats suitable for manuscripts and presentations
- document analysis decisions clearly

## Planned Workflows

The repository will include workflows for:

- data import and quality checking
- data cleaning and restructuring
- summary statistics
- percentage change calculations
- percentage removal calculations
- treatment comparisons
- bar plots
- grouped bar plots
- boxplots
- scatter plots
- time-series visualization
- concentration and accumulation plots
- multi-panel scientific figures
- publication-quality figure formatting
- high-resolution figure export

## Repository Structure

```text
scientific-r-visualization/
│
├── R/
│   ├── data_cleaning.R
│   ├── summary_statistics.R
│   ├── treatment_comparison.R
│   ├── percentage_change.R
│   ├── barplots.R
│   ├── boxplots.R
│   ├── time_series.R
│   └── figure_export.R
│
├── example-data/
│   └── example_dataset.csv
│
├── figures/
│   └── example outputs
│
├── .gitignore
├── LICENSE
└── README.md
```

The structure will expand as additional reproducible workflows are added.

## R Environment

The workflows are primarily developed in **R**.

Frequently used packages include:

- `ggplot2` — scientific visualization
- `dplyr` — data manipulation
- `tidyr` — data restructuring
- `readr` — data import
- `scales` — axis and label formatting

Additional packages may be introduced when required for specific analyses.

## Example Workflow

A typical analysis follows this structure:

```text
Raw data
   ↓
Data quality check
   ↓
Data cleaning
   ↓
Data transformation
   ↓
Summary calculations
   ↓
Statistical or descriptive analysis
   ↓
Scientific visualization
   ↓
Publication-quality figure export
```

This workflow is intended to keep the connection between the original dataset, analytical decisions and final figure transparent.

## Reproducibility

Reproducibility is a central principle of this repository.

Where possible, scripts will:

- use clearly defined input files
- avoid manual modification of values during analysis
- document important transformations
- use consistent variable names and units
- separate data processing from visualization
- save figures using reproducible export settings
- include explanatory comments where analytical decisions require clarification

The aim is that another researcher can understand how an output was generated and reproduce the analysis using the corresponding data and script.

## Data Policy

This is a public repository.

**Unpublished, confidential or collaborator-owned research data will not be uploaded without appropriate permission.**

Where original datasets cannot be shared, synthetic or example datasets may be provided to demonstrate the workflow while preserving the structure of the analysis.

Public release of project-specific research data will follow publication requirements, institutional policies and agreements with collaborators.

## Research Context

These workflows are being developed in the context of research in:

- plant–microbe interactions
- phytoremediation and bioremediation
- environmental microbiology
- fungal biology
- metal uptake and accumulation
- aquatic moss systems
- fungal genomics and bioinformatics

The repository is intended to support reproducible quantitative analysis across these and related areas of biological and environmental research.

## Development Status

This repository is under active development.

Scripts, example datasets and figure templates will be added progressively as the workflows are tested and documented.

## License

This repository is distributed under the **MIT License**.

See the `LICENSE` file for details.

## Author

**Abrar Hussain Mian**  
Doctoral Researcher  
Ecology and Genetics Research Unit  
University of Oulu, Finland

Research interests: **Plant–Microbe Interactions | Phytoremediation | Fungal Biology | Environmental Microbiology | Fungal Genomics | Bioinformatics**

### Research Profiles

- [University of Oulu Researcher Profile](https://www.oulu.fi/en/researchers/abrar-hussain-mian)
- [ORCID](https://orcid.org/0000-0002-7337-5415)
- [LinkedIn](https://www.linkedin.com/in/abrar-hussain-mian-682915309/)

### Contact

**Email:** abrar.mian@oulu.fi

---

*This repository supports the development and sharing of transparent, reproducible and publication-oriented scientific analysis workflows in R.*
