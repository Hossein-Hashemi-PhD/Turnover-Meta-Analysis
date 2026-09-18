# Salesperson Turnover Meta-Analysis

This repository contains the R code used to process, harmonize, and analyze data for a meta-analysis of salesperson turnover.

The project integrates evidence across primary studies that report salesperson turnover, turnover intentions, and related attitudinal, behavioral, organizational, and contextual variables. The analysis pipeline was developed to transform heterogeneous study-level coding into standardized datasets suitable for meta-analysis, moderator analysis, and meta-analytic structural equation modeling.

The original analytical pipeline and working R code were developed in 2020. The code in this repository has subsequently been cleaned, organized, and documented for public sharing while preserving the original analytical logic.

## Analysis Workflow

The analysis proceeds through several stages:

1. Import study-level coded Excel files.
2. Clean and standardize variable names and coding inconsistencies.
3. Identify variables reported across multiple studies.
4. Handle missing reliability estimates using construct-specific information.
5. Create pairwise datasets for variables reported together within studies.
6. Harmonize related variable labels into broader construct categories.
7. Estimate meta-analytic relationships among constructs.
8. Conduct moderator and meta-regression analyses.
9. Construct the meta-analytic correlation matrix.
10. Estimate meta-analytic structural equation models.

The repository will be updated as individual components of the analysis pipeline are organized and documented.

## Data Structure

The original coding process produced one Excel workbook for each primary study.

Each workbook contains two main sheets:

1. **Study-level moderators**  
   Includes study characteristics and coded moderator variables.

2. **Correlation and measurement information**  
   Includes the correlation matrix for variables reported in the study, along with available means, standard deviations, and reliability estimates.

The coded study files were manually reviewed before the analysis pipeline was run.

## Data Availability

The underlying study-level coded data are not included in this repository.

This repository is intended to document and share the analytical code and workflow. The original coding sheets, extracted correlations, moderator data, and study-level datasets remain private.

## Repository Structure

The repository contains R scripts for:

- data import and cleaning
- variable and construct harmonization
- reliability handling
- construction of pairwise meta-analytic datasets
- meta-analysis
- moderator and meta-regression analysis
- construction of meta-analytic correlation matrices
- meta-analytic structural equation modeling

Reusable analytical functions are stored separately from the main workflow scripts.

The repository structure and file-level documentation will be expanded as the code is organized.

## Methods

The analysis includes procedures for:

- psychometric correction of correlations
- random-effects meta-analysis
- heterogeneity assessment
- moderator analysis
- meta-regression
- construction of meta-analytic correlation matrices
- meta-analytic structural equation modeling

Different procedures are used where appropriate for continuous outcomes and actual turnover outcomes.

## Analysis Outputs

The analysis pipeline produces:

- meta-analytic effect-size estimates
- confidence and credibility intervals
- heterogeneity statistics
- moderator and meta-regression results
- meta-analytic correlation matrices
- structural models based on meta-analytic correlations

Substantive study results are not reported in this repository.

## Software

The analyses were conducted in R.

Package dependencies, version information, and instructions for reproducing the analytical workflow will be added as the repository is finalized.

## Project History

The analytical pipeline and original R code for this project were developed in 2020, before the widespread availability of generative-AI coding assistants.


## Citation

Citation information will be added upon publication of the associated research.
