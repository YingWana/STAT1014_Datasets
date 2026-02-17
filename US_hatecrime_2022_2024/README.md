# README: U.S. Hate Crime Data (2022–2024)

## General Information

**Title of Dataset:** U.S. Hate Crime Data: Antisemitism in America (2022–2024)

**Date of Data Collection:** 2022–2024 

**Geographic Location:** United States (state-level and national)

**Related Publications:** TIME Magazine. (2025, June). "The Rise of Antisemitism and Political Violence in the U.S." https://time.com/7287941/rise-of-antisemitism-political-violence-in-united-states/

---

## Data Files

| File Name | Description | Observations | Variables |
|-----------|-------------|--------------|----------|
| `fbi_hate_crimes_state_2022_2024.xlsx` | Main data file with 2 sheets |  |  |
| └ Sheet: `hate_crimes_state_2023` | State-level cross-sectional data | 51 | 17 |
| └ Sheet: `hate_crimes_monthly_22_24` | National monthly time-series data | 12 | 10 |
| `fbi_hate_crimes_state_2022_2024_dictionary.xlsx` | Data dictionary file with 2 sheets |  |  |
| └ Sheet: `hate_crimes_state_2023` | Dictionary for state data | 17 | 5 |
| └ Sheet: `hate_crimes_monthly_22_24` | Dictionary for monthly data | 10 | 5 |

---

## Data Description

### Sheet 1: `hate_crimes_state_2023`

**Description:** State-level data on hate crimes, demographics, policy indicators, and socioeconomic factors for 50 U.S. states and the District of Columbia.

**Variables:**

| Variable | Description | Unit | Values |
|----------|-------------|------|--------|
| `state` | State name | text | 50 states + DC |
| `region` | U.S. Census region | text | Northeast, Midwest, South, West |
| `urbanization` | Population density category | text | Highly Urban, Moderate, Rural |
| `total_pop_2022` | Total population (2022) | integer | 577,929–39,356,104 |
| `total_pop_2023` | Total population (2023) | integer | 579,761–39,242,785 |
| `hate_crime_2023` | Total hate crime incidents (2023) | integer | 10–1,984 |
| `anti_jewish_2022` | Anti-Jewish hate crimes (2022) | integer | 1–355 |
| `anti_jewish_2023` | Anti-Jewish hate crimes (2023) | integer | 1–451 |
| `median_income` | Median household income (2023) | dollars | $54,915–$106,287 |
| `gini_index` | Income inequality measure | float | 0.428–0.515 |
| `prop_age_15_24` | Proportion aged 15–24 | float | 0.113–0.166 |
| `prop_bs_grad` | Proportion with bachelor's degree+ | float | 0.161–0.458 |
| `prop_jewish` | Proportion Jewish population | float | 0–0.038 |
| `hate_groups_per_million` | Hate groups per million residents | float | 1.89–19.00 |
| `holocaust_education` | State Holocaust education mandate | text | Mandatory, Recommended, No Mandate |
| `political_lean` | State political classification | text | Red State, Blue State, Swing State |
| `hate_crime_law` | Hate crime law strength | text | Comprehensive, Standard, No Law |

**Variable Definitions:**

- **Urbanization:** Population density classification based on metropolitan area concentration
- **Gini Index:** Income inequality measure (0 = perfect equality, 1 = perfect inequality)
- **prop_age_15_24:** Proxy for youth population and social media exposure per ADL research showing higher antisemitic attitudes among younger Americans
- **Holocaust Education:** Mandatory (required curriculum), Recommended (encouraged but not required), or No Mandate
- **Political Lean:** Based on 2020 and 2024 presidential election results
- **Hate Crime Law:** Comprehensive (penalty enhancement + mandatory reporting + training), Standard (basic bias crime statute), or No Law (AR, IN, SC, WY)

**Missing Data:**

- `anti_jewish_2022`: 8 states have NA values (DC, LA, MS, MT, NE, ND, SC, WY)
- `anti_jewish_2023`: 1 state has NA values (SD)
- Missing indicates unreported data, not zero incidents

---

### Sheet 2: `hate_crimes_monthly_22_24`

**Description:** National monthly hate crime counts for calendar years 2022, 2023, and 2024.

**Variables:**

| Variable | Description | Unit | Values |
|----------|-------------|------|--------|
| `incident_month` | Calendar month | text | Jan–Dec |
| `hate_crime_2022` | Total hate crimes (2022) | integer | 726–1,188 |
| `hate_crime_2023` | Total hate crimes (2023) | integer | 809–1,308 |
| `hate_crime_2024` | Total hate crimes (2024) | integer | 773–1,148 |
| `anti_religion_2022` | Religion-based hate crimes (2022) | integer | 135–252 |
| `anti_religion_2023` | Religion-based hate crimes (2023) | integer | 138–491 |
| `anti_religion_2024` | Religion-based hate crimes (2024) | integer | 174–318 |
| `anti_jewish_2022` | Anti-Jewish hate crimes (2022) | integer | 78–158 |
| `anti_jewish_2023` | Anti-Jewish hate crimes (2023) | integer | 83–379 |
| `anti_jewish_2024` | Anti-Jewish hate crimes (2024) | integer | 93–237 |

**Missing Data:** None

---

## Methodological Information

### Data Processing

1. Hate crime counts extracted from FBI Crime Data Explorer
2. Population and demographic variables from U.S. Census ACS 5-Year Estimates
3. Religious adherence proportions from ARDA 2020 Religious Congregations Study
4. Hate group counts from SPLC Hate Map (2023)
5. Holocaust education mandates from Echoes & Reflections (as of 2025)
6. Hate crime law classifications from ADL model statute criteria (2022)

### Data Quality Notes

- FBI hate crime data relies on voluntary agency reporting; underreporting is likely
- States with Comprehensive hate crime laws have mandatory reporting, resulting in higher counts
- District of Columbia has unusually high per-capita rates due to small population

---

## Data Sources

| Source | Description | URL |
|--------|-------------|-----|
| FBI Crime Data Explorer | Hate crime incident data | https://cde.ucr.cjis.gov/ |
| U.S. Census Bureau | ACS 5-Year Estimates (population, demographics) | https://data.census.gov |
| Association of Religion Data Archives | Religious Congregations and Membership Study | https://www.thearda.com |
| Southern Poverty Law Center | Hate Map (2023) | https://www.splcenter.org/hate-map |
| Echoes & Reflections | Holocaust education mandates | https://echoesandreflections.org |
| Anti-Defamation League | Hate Crime Statutes | https://www.adl.org/sites/default/files/pdfs/2022-05/Hate%20Crime%20Statutes%20-%20updated%202022.pdf |
| U.S. Department of Justice | Hate crime laws and policies | https://www.justice.gov/hatecrimes/laws-and-policies |

---
