# README: Virginia Tree Equity Data (2019–2023)

## General Information

**Title of Dataset:** Virginia Tree Equity — Urban Forest Inequality Analysis (2019–2023)

**Date of Data Collection:** Tree canopy imagery from National Agriculture Imagery Program (NAIP), 2019–2023; Demographics from American Community Survey (ACS) 2017–2021

**Geographic Location:** Virginia, United States

**Related Publication:** Washington Post, "The most tree-friendly cities in the U.S. See where yours compares" (April 23, 2025). https://www.washingtonpost.com/climate-environment/interactive/2025/tree-friendly-cities-urban-forests/

---

## Data Files

This dataset contains one CSV file:

| File Name | Description | Observations | Variables |
|-----------|-------------|--------------|-----------|
| `VA_tree_equity_place.csv` | Place-level data on tree canopy coverage, heat vulnerability, and demographic characteristics across Virginia communities | 292 | 15 |

---

## Data Description

### File: `VA_tree_equity_place.csv`

**Description:** Place-level data for Virginia cities, towns, and census-designated places, focusing on metrics relevant to analyzing urban tree equity. Includes tree canopy coverage, Tree Equity Scores (a composite measure incorporating environmental and social factors), heat vulnerability indicators, and demographic variables aligned with environmental justice frameworks.

**Variables:**

| Variable | Variable Name | Unit | Values                                                                                                                                                          |
|----------|---------------|------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `place` | Place Name | text | City, town, or census-designated place names                                                                                                                    |
| `county` | County | text | Virginia county or independent city                                                                                                                             |
| `region` | Virginia Region | text | Central Virginia, Hampton Roads, Lynchburg Region, Northern Virginia, Richmond Metro, Roanoke-New River, Shenandoah Valley, Southside Virginia, Southwest Virginia |
| `urban_type` | Urban Classification | text | Urban Core, Suburban, Exurban, Rural Town                                                                                                                       |
| `population` | Population | numeric | ≥ 0 (ACS estimate)                                                                                                                                              |
| `pop_density` | Population Density | numeric | people per km²                                                                                                                                                  |
| `tree_equity_score` | Tree Equity Score | numeric | 0–100 (higher = more equitable)                                                                                                                                 |
| `tree_canopy_pct` | Tree Canopy Percentage | numeric | 0–1 (proportion of land covered by trees)                                                                                                                       |
| `heat_severity_F` | Heat Vulnerable | numeric | Above/below urban area average temperature                                                                                                                      |
| `health_burden` | Health Burden Index | numeric | 0–1 (higher = worse health outcomes)                                                                                                                            |
| `prop_poverty` | Poverty Rate | numeric | 0–1 (proportion in poverty)                                                                                                                                     |
| `prop_people_of_color` | People of Color Rate | numeric | 0–1 (proportion identifying as non-white)                                                                                                                       |
| `unemployment_rate` | Unemployment Rate | numeric | 0–1 (proportion unemployed)                                                                                                                                     |
| `prop_children` | Child Population Rate | numeric | 0–1 (proportion under age 18)                                                                                                                                   |
| `prop_seniors` | Senior Population Rate | numeric | 0–1 (proportion age 65+)                                                                                                                                        |

**Variable Definitions:**

- **Place:** Census-designated place (CDP), incorporated city, or town within Virginia's urban areas
- **County:** Virginia county or independent city containing the place; some places span multiple counties
- **Region:** Geographic region based on Virginia tourism/planning classifications; useful for grouped comparisons
- **Urban Classification:** Density-based classification derived from population density thresholds (Urban Core > 2000/km², Suburban 500–2000/km², Exurban 100–500/km², Rural Town < 100/km²)
- **Tree Equity Score:** Composite index developed by American Forests combining tree canopy coverage with demographic and environmental justice factors; higher scores indicate more equitable tree distribution relative to community need
- **Tree Canopy Percentage:** Proportion of land area covered by tree canopy
- **Heat Vulnerable:** Temperature difference from urban area average (°F); positive values indicate hotter areas experiencing urban heat island effects
- **Health Burden Index:** Normalized composite of health risk factors; higher values indicate greater health burden in the community
- **Poverty Rate:** Proportion of population living below the federal poverty line (ACS 2017–2021)
- **People of Color Rate:** Proportion of population identifying as any race/ethnicity other than non-Hispanic white alone
- **Unemployment Rate:** Proportion of labor force that is unemployed (ACS 2017–2021)
- **Child Population Rate:** Proportion of total population under age 18; relevant for heat vulnerability and outdoor recreation access
- **Senior Population Rate:** Proportion of total population age 65 and older; relevant for heat vulnerability and health outcomes

**Missing Data:** Some places have zero values for demographic variables due to small population or data suppression in source data. The place "Adwolf" has population = 0 and should be treated as an outlier.

---

## Methodological Information

### Data Processing

1. National Tree Equity Score data filtered to Virginia urban areas only
2. Block-group level data aggregated to place level using population-weighted means
3. Virginia regions assigned based on county location using official planning classifications
4. Urban classification derived from population density thresholds

### Tree Equity Score Methodology

The Tree Equity Score combines multiple factors to identify communities with the greatest need for tree investment:

- **Tree Canopy Gap:** Difference between existing canopy and science-based canopy goals
- **Priority Index:** Composite of demographic factors including income, race/ethnicity, age, health, and heat exposure
- **Final Score:** Higher scores (closer to 100) indicate more equitable tree distribution; lower scores indicate communities that would benefit most from tree planting initiatives

---

## Data Sources

| Source | URL |
|--------|-----|
| American Forests Tree Equity Score | https://www.treeequityscore.org/ |
| Tree Equity Score Methodology | https://www.treeequityscore.org/methodology/ |
| U.S. Census American Community Survey | https://www.census.gov/programs-surveys/acs |
