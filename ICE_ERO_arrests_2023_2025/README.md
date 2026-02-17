# README: ICE ERO Administrative Arrests Data (September 2023–October 2025)

## General Information

**Title of Dataset:** ICE ERO Administrative Arrests by Region and Month (September 2023–October 2025)

**Date of Data Collection:** September 2023–October 2025 (compiled February 2026)

**Geographic Location:** United States (national-level, aggregated by citizenship region)

**Related Publications:** Reuters Investigates "Special Report: USA, Trump, migration, ICE." https://www.reuters.com/investigates/special-report/usa-trump-migration-ice/

---

## Data Files

This dataset contains one CSV file:

| File Name | Description | Observations | Variables |
|-----------|-------------|--------------|-----------|
| `ice_ero_stu_arrests_202309_202510.csv` | Monthly aggregated arrest data by citizenship region | 208 | 17 |

---

## Data Description

### File: `ice_ero_stu_arrests_202309_202510.csv`

**Description:** Monthly aggregated data on ICE Enforcement and Removal Operations (ERO) administrative arrests, disaggregated by region of citizenship. Includes arrest counts by method (custody vs. at-large), case disposition, gender, and age group.

**Variables:**

| Variable | Variable Name | Unit | Values |
|----------|---------------|------|--------|
| `year` | Year | numeric | 2023–2025 |
| `quarter` | Fiscal Quarter | text | Q1, Q2, Q3, Q4 |
| `month` | Month | text | Jan–Dec |
| `administration` | Administration | text | Biden, Trump |
| `region` | Region of Citizenship | text | Africa, Asia, Canada, Central America & Caribbean, Europe, Mexico, Oceania, South America |
| `arrests_total` | Total Arrests | numeric | ≥ 0 |
| `arrests_custody` | Custody Arrests | numeric | ≥ 0 |
| `arrests_atlarge` | At-Large Arrests | numeric | ≥ 0 |
| `case_removals` | Removal Cases | numeric | ≥ 0 |
| `cases_pending` | Pending Cases | numeric | ≥ 0 |
| `case_other` | Other Cases | numeric | ≥ 0 |
| `male` | Male | numeric | ≥ 0 |
| `female` | Female | numeric | ≥ 0 |
| `unknown_gender` | Unknown Gender | numeric | ≥ 0 |
| `age_minor` | Minors (Under 18) | numeric | ≥ 0 |
| `age_adult` | Adults (18–64) | numeric | ≥ 0 |
| `age_elder` | Elders (65+) | numeric | ≥ 0 |

**Variable Definitions:**

- **Fiscal Quarter:** U.S. federal government fiscal year quarters (Q1=Oct–Dec, Q2=Jan–Mar, Q3=Apr–Jun, Q4=Jul–Sep)
- **Administration:** Presidential administration; Trump administration starts February 2025 (January 2025 is assigned to Biden)
- **Custody Arrests:** Arrests made while individual was already in custody (CAP Local/State/Federal Incarceration, Custodial Arrest, Criminal Alien Program)
- **At-Large Arrests:** Arrests made in the community (Non-Custodial Arrest, Located, Probation/Parole, 287(g), Worksite Enforcement, Patrol, Transportation Checks, Task Forces, Inspections, etc.)
- **Removal Cases:** Cases resulting in removal orders (Deportation, Reinstated Final Order, Expedited Removal, Voluntary Departure, etc.)
- **Pending Cases:** Cases under adjudication (Immigration Judge, BIA, Credible Fear Referral, etc.)
- **Age Groups:** Minor (<18), Adult (18–64), Elder (65+) at time of apprehension

**Missing Data:** None. All cells contain complete values.

---
## Methodological Information

### Data Collection

Data were obtained via Freedom of Information Act (FOIA) litigation against U.S. Immigration and Customs Enforcement (ICE). 

### Data Processing

1. Original individual-level arrest records extracted from ICE ERO Administrative Arrests dataset (LESA-STU-FINAL Release)
2. Duplicates removed by keeping the earliest arrest record per unique identifier
3. Citizenship countries mapped to geographic regions
4. Apprehension methods classified as custody or at-large arrests
5. Case categories classified as removals, pending, or other
6. Age calculated from birth year and apprehension year, then grouped
7. Data aggregated to monthly totals by region 
8. Countries with unknown citizenship or Cayman Islands were excluded

---

## Data Sources

| Source | URL | 
|--------|-----|
| Deportation Data Project – ICE Data | https://deportationdata.org/data/ice.html |
| Original File: ERO Admin Arrests (LESA-STU-FINAL Release) | https://deportationdata.org/data/ice.html | 


