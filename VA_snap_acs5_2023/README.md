# README: Virginia SNAP Participation Data (2023)

## General Information

**Title of Dataset:** Virginia SNAP Participation — Food Assistance and Economic Hardship Analysis (2023)

**Date of Data Collection:** 2023 (American Community Survey 5-Year Estimates)

**Geographic Location:** Virginia, United States

**Related Publications:** New York Times Opinion, "SNAP, Hunger, and Food Stamps" (June 10, 2025). https://www.nytimes.com/2025/06/10/opinion/snap-hunger-food-stamps.html

---

## Data Files

This dataset contains one CSV file:

| File Name | Description | Observations | Variables |
|-----------|-------------|--------------|-----------|
| `VA_snap_acs5_2023.csv` | County/city-level data on SNAP participation, demographics, work status, and economic hardship | 133 | 18 |

---

## Data Description

### File: `VA_snap_acs5_2023.csv`

**Description:** County and independent city-level data for Virginia, focusing on Supplemental Nutrition Assistance Program (SNAP) participation and metrics relevant to analyzing food insecurity, work requirements policy, and economic vulnerability. Includes household income comparisons, demographic composition of SNAP recipients, work status of recipient families, housing cost burden, and composite economic hardship scores.

**Variables:**

| Variable | Variable Name | Unit | Values                                                                                                                                           |
|----------|---------------|------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| `county` | County | text | County/city names                                                                                                                                |
| `region` | Region | text | Central Virginia, Eastern Shore/Northern Neck, Hampton Roads, Northern Virginia, Roanoke Area, Shenandoah Valley, Southside Virginia, Southwest Virginia |
| `medinc_nonsnap` | Median Income Non-SNAP | numeric | 46,691–181,937 (USD)                                                                                                                             |
| `medinc_snap` | Median Income SNAP | numeric | 13,021–115,379 (USD)                                                                                                                             |
| `income_gap` | Income Gap | numeric | −53,504–117,359 (USD)                                                                                                                            |
| `snap_hh` | SNAP Household Rate | numeric | 0–1 (proportion)                                                                                                                                 |
| `snap_below_pov` | SNAP Below Poverty | numeric | 0–1 (proportion)                                                                                                                                 |
| `snap_white` | SNAP White | numeric | 0–1 (proportion)                                                                                                                                 |
| `snap_black` | SNAP Black | numeric | 0–1 (proportion)                                                                                                                                 |
| `snap_with_children` | SNAP With Children | numeric | 0–1 (proportion)                                                                                                                                 |
| `snap_60plus` | SNAP 60 Plus | numeric | 0–1 (proportion)                                                                                                                                 |
| `snap_disability` | SNAP Disability | numeric | 0–1 (proportion)                                                                                                                                 |
| `snap_1worker` | SNAP 1 Worker | numeric | 0–1 (proportion)                                                                                                                                 |
| `snap_nowork` | SNAP No Work | numeric | 0–1 (proportion)                                                                                                                                 |
| `snap_2plus_workers` | SNAP 2 Plus Workers | numeric | 0–1 (proportion)                                                                                                                                 |
| `median_rent` | Median Rent | numeric | 665–2,317 (USD)                                                                                                                                  |
| `grapi_35` | Rent Burden 35 Percent | numeric | 0–1 (proportion)                                                                                                                                 |
| `economic_score` | Economic Score | numeric | 0–1 (index)                                                                                                                                      |

**Variable Definitions:**

- **County:** County or independent city name in Virginia
- **Region:** Virginia geographic region (8 categories: Northern Virginia, Shenandoah Valley, Southwest Virginia, Central Virginia, Southside Virginia, Hampton Roads, Eastern Shore/Northern Neck, Roanoke Area)
- **Median Income Non-SNAP:** Median household income for households NOT receiving SNAP benefits (2023 inflation-adjusted USD)
- **Median Income SNAP:** Median household income for households receiving SNAP benefits (2023 inflation-adjusted USD)
- **Income Gap:** Income gap between non-SNAP and SNAP households (medinc_nonsnap minus medinc_snap, in USD); negative values indicate SNAP households have higher median income
- **SNAP Household Rate:** Proportion of all households receiving SNAP benefits
- **SNAP Below Poverty:** Proportion of SNAP households below the federal poverty level
- **SNAP White:** Proportion of SNAP households that are White alone
- **SNAP Black:** Proportion of SNAP households that are Black or African American alone
- **SNAP With Children:** Proportion of SNAP households with children under 18 years
- **SNAP 60 Plus:** Proportion of SNAP households with one or more people aged 60 plus years
- **SNAP Disability:** Proportion of SNAP households with one or more people with a disability
- **SNAP 1 Worker:** Proportion of SNAP families with 1 worker in the past 12 months
- **SNAP No Work:** Proportion of SNAP families with no workers in the past 12 months
- **SNAP 2 Plus Workers:** Proportion of SNAP families with 2 or more workers in the past 12 months
- **Median Rent:** Median monthly gross rent in the locality (USD)
- **Rent Burden 35 Percent:** Proportion of renter households paying more than 35 percent of income on rent
- **Economic Score:** Composite economic hardship index (higher equals more hardship)

**Missing Data:** Some localities have missing values in `medinc_snap` and `income_gap` (6 observations). These are primarily rural localities with small SNAP populations where the Census Bureau suppresses estimates for statistical reliability.

---

## Methodological Information

### Data Processing

1. Data queried from U.S. Census Bureau American Community Survey (ACS) 5-Year Estimates API (2023)
2. Subject Table S2201 (Food Stamps/Supplemental Nutrition Assistance Program) used as primary source
3. Income gap derived as difference between non-SNAP and SNAP median incomes
4. Proportions retained in 0–1 scale (not converted to percentages)
5. Virginia regions assigned based on official planning district classifications
6. Dollar amounts rounded to nearest whole dollar

---

## Data Sources

| Source | URL |
|--------|-----|
| U.S. Census Bureau ACS 5-Year Estimates | https://www.census.gov/programs-surveys/acs |
| Census API — Subject Tables | https://api.census.gov/data/2023/acs/acs5/subject/variables.html |
| USDA SNAP Data | https://www.fns.usda.gov/pd/supplemental-nutrition-assistance-program-snap |