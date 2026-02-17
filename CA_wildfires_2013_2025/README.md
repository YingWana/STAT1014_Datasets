# README: California Wildfire Data (2001–2024)

## General Information

**Title of Dataset:** California Wildfires: Climate, Risk, and Human Impact (2001–2024)

**Date of Data Collection:** 2001–2024

**Geographic Location:** California, United States (statewide and county-level)

**Related Publications:** TIME Magazine. (2025, January). "California Wildfires: What Conditions Led to the Blazes." https://time.com/7205622/california-wildfires-climate-change-conditions/

---

## Data Files

| File Name | Description | Observations | Variables |
|-----------|-------------|--------------|----------|
| `CA_wildfires_county_2013_2025.xlsx` | Main data file with 2 sheets |  |  |
| └ Sheet: `county_2019_2023` | County-level cross-sectional data | 58 | 17 |
| └ Sheet: `statewide_2001_2024` | Statewide annual time-series data | 24 | 7 |
| `CA_wildfires_county_2013_2025_dictionary.xlsx` | Data dictionary file with 2 sheets |  |  |
| └ Sheet: `county_2019_2023` | Dictionary for county data | 17 | 5 |
| └ Sheet: `statewide_2001_2024` | Dictionary for statewide data | 7 | 5 |

---

## Data Description

### Sheet 1: `statewide_2001_2024`

**Description:** Statewide annual data on wildfire incidents, climate indicators, environmental impacts, and drought conditions for California from 2001 to 2024.

**Variables:**

| Variable | Description | Unit | Values |
|----------|-------------|------|--------|
| `year` | Calendar year | integer | 2001–2024 |
| `fire_count` | Number of fires statewide (≥10 acres) | integer | 210–640 |
| `acres_burned` | Total acres burned statewide | float | 2,969–73,235 |
| `avg_temp_f` | State average temperature | °F | 56.19–60.32 |
| `tree_loss_acres` | Tree cover loss from all causes | acres | 32,833–454,400 |
| `carbon_emissions` | CO₂ emissions from all tree cover loss | megagrams (Mg) | 29,721,780–233,154,558 |
| `drought_level` | Drought severity category | text | Abnormally Dry, Moderate, Severe, Extreme, Exceptional |

**Missing Data:** None

**Important Note on Tree Loss and Carbon Emissions:**
The `tree_loss_acres` and `carbon_emissions` variables represent **all tree cover loss in California**, not just wildfire-related loss.

---

### Sheet 2: `county_2019_2023`

**Description:** County-level aggregated data on wildfire incidents, fire causes, home damage, demographic characteristics, and Wildland-Urban Interface (WUI) exposure for all 58 California counties (2019–2023).

**Variables:**

| Variable | Description | Unit | Values |
|----------|-------------|------|--------|
| `county` | County name | text | 58 California counties |
| `region` | California Census 2020 region | text | 10 regions (see below) |
| `population` | Total resident population | integer | 1,695–9,848,406 |
| `median_income` | Median annual household income | USD | $53,498–$159,674 |
| `gini_index` | Income inequality measure | float | 0.40–0.53 (0=equality, 1=inequality) |
| `prop_65_older` | Proportion of population aged 65+ | float | 0.11–0.34 |
| `drought_level` | Drought severity category | text | Abnormally Dry, Moderate, Severe |
| `acres_burned` | Total acres burned by wildfires | float | 0–251,679 |
| `prop_area_burned` | Proportion of county area burned | float | 0–0.154 |
| `fires_human` | Number of human-caused fires | integer | 0–29 |
| `fires_natural` | Number of lightning-caused fires | integer | 0–41 |
| `fires_other` | Number of other/unknown cause fires | integer | 0–411 |
| `homes_damaged` | Residential structures damaged/destroyed | integer | 0–2,834 |
| `acres_wui` | Wildland-Urban Interface area | acres | 847–1,431,433 |
| `prop_wui` | Proportion of county in WUI | float | 0.006–0.798 |
| `carbon_emissions` | CO₂ emissions from all tree cover loss | megagrams (Mg) | 0–106,637,553 |
| `tree_loss_acres` | Tree cover loss from all causes | acres | 0–182,369 |

**Region Values:**
- Central Coast
- Inland Empire
- Los Angeles County
- North Coast
- Northern San Joaquin Valley
- Orange County
- San Diego-Imperial
- San Francisco Bay Area
- Southern San Joaquin Valley
- Superior California

**Missing Data:**
- San Francisco County shows 0 for `acres_burned`, `homes_damaged`, and fire counts
- Note: Only fires ≥10 acres are recorded; San Francisco's urban density prevents fires from reaching this threshold

---

## Methodological Information

### Data Processing

1. Wildfire incident counts and acres burned extracted from CAL FIRE historical incident database
2. Fire cause attribution (human, natural, other) from CAL FIRE incident reports
3. Structure damage counts from CAL FIRE Damage Inspection (DINS) reports
4. Temperature data from NOAA National Centers for Environmental Information
5. Drought classifications from U.S. Drought Monitor weekly assessments
6. Tree cover loss and carbon emissions from Global Forest Watch
7. Population, income, and demographic variables from U.S. Census ACS 5-Year Estimates
8. Wildland-Urban Interface boundaries from USDA Forest Service SILVIS Lab


### Key Definitions

- **Wildland-Urban Interface (WUI):** Areas where human development meets or intermingles with wildland vegetation, creating elevated fire risk for structures
- **Megagram (Mg):** Equal to 1 metric ton (1,000 kg); used for carbon emissions reporting
- **Hectare (ha):** Equal to 2.47 acres; standard international unit for land area

---

## Data Sources

| Source | Description | URL |
|--------|-------------|-----|
| CAL FIRE | Historical Wildfire Incidents by CA Census Tract | https://www.fire.ca.gov/incidents |
| NOAA NCEI | Historical Temperature by CA County | https://www.ncei.noaa.gov/access/monitoring/climate-at-a-glance/ |
| U.S. Drought Monitor | Historical Drought by CA County | https://droughtmonitor.unl.edu/DmData/DataDownload.aspx |
| CAL FIRE DINS | Wildfire Housing Damage in California | https://data.ca.gov/dataset/cal-fire-damage-inspection-dins-data |
| Global Forest Watch | Tree Cover Loss and Carbon Emissions | https://www.globalforestwatch.org/dashboards/country/USA/5 |
| U.S. Census Bureau | American Community Survey 5-Year Estimates | https://data.census.gov |
| CAL FIRE | Wildland-Urban Interface | https://data.ca.gov/dataset/wildland-urban-interface |

---



