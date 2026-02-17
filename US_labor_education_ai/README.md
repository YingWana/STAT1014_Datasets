# README: U.S. Labor Market and Higher Education Enrollment Data (2020–2034)

## General Information

**Title of Dataset:** U.S. Labor Market Projections and AI Exposure in Higher Education (2020–2034)

**Date of Data Collection:** 2020–2025 (enrollment); 2024–2034 (employment projections)

**Geographic Location:** United States (national-level)

**Related Publications:** Washington Post. (2026, January 31). "Trade workers gain labor market edge as college grads lose ground." https://www.washingtonpost.com/business/2026/01/31/labor-market-gap-trade-workers-white-collar/

---

## Data Files

| File Name | Description | Observations | Variables |
|-----------|-------------|----------|-----|
| `us_labor_education_ai.xlsx` | Main data file with 2 sheets | | |
| └ Sheet: `Employment_Project_2024_2034` | BLS occupation-level employment projections | 712 | 14 |
| └ Sheet: `Enrollment_2020_2025.csv` | CIP4 enrollment + AI exposure | 652 | 15 |
| `us_labor_education_ai_dictionary.xlsx` | Data dictionary file with 2 sheets |  | |
| └ Sheet: `Employment_Project_2024_2034` | Dictionary for employment data | 14 | 5 |
| └ Sheet: `Enrollment_2020_2025.csv` | Dictionary for enrollment data | 15 | 5 |

---

## Data Description

### Sheet 1: `Employment_Project_2024_2034`

**Description:** Occupation-level employment projections from the U.S. Bureau of Labor Statistics (BLS), merged with automation/AI risk scores from the LMI Institute. Includes employment counts, wage data, education requirements, and collar-type classification.

**Variables:**

| Variable | Description | Unit | Values |
|----------|-------------|------|--------|
| `occupation_title` | Official BLS occupation title | text | BLS occupation titles |
| `occupation_code` | Standard Occupational Classification code | text | SOC codes (e.g., 11-1011) |
| `soc_major_code` | First two digits of SOC code | text | 2-digit major group (11–53) |
| `occupation_group` | Major occupational group name | text | 22 major occupation groups |
| `employment_2024` | Total employment | thousands | 0.2–3,936.7 |
| `employment_2034` | Projected total employment | thousands | 0.2–4,029.2 |
| `emp_change_pct` | Projected employment change 2024–2034 | percent | -36.1 to 49.9 |
| `median_wage_2024` | Median annual wage | dollars | $30,160–$239,200 |
| `education_required` | Typical education for entry | category | 8 education levels |
| `education_level` | Ordinal education scale | numeric | 1–8 |
| `automation_risk_score` | AI/automation risk score | numeric | 1.0–10.0 |
| `ai_risk_category` | Categorized AI risk level | category | Low, Medium, High |
| `collar_type` | Occupation type classification | text | White-collar, Blue-collar |
| `growth_category` | Categorized employment growth | text | Declining, Stable, Growing |

**Variable Definitions:**

- **Education Level Scale:** 1=No formal credential, 2=High school, 3=Some college, 4=Postsecondary nondegree, 5=Associate's, 6=Bachelor's, 7=Master's, 8=Doctoral/Professional
- **Education Required Values:** No formal educational credential, High school diploma or equivalent, Some college no degree, Postsecondary nondegree award, Associate's degree, Bachelor's degree, Master's degree, Doctoral or professional degree
- **Collar Type:** White-collar (SOC 11–29), Blue-collar (SOC 31–53)
- **Growth Category:** Declining (<-5%), Stable (-5% to 5%), Growing (>5%)
- **AI Risk Category:** Low (1–3), Medium (4–6), High (7–10)

**Missing Data:** None

---

### Sheet 2: `Enrollment_2020_2025.csv`

**Description:** Undergraduate enrollment trends by 4-digit CIP (Classification of Instructional Programs) major, merged with AI exposure percentages from U.S. Treasury Department research. Tracks enrollment from 2020–2025 to analyze whether students are shifting away from AI-exposed fields.

**Variables:**

| Variable | Description | Unit | Values |
|----------|-------------|------|--------|
| `cip2` | Broad field code (2-digit CIP) | numeric | 1–54 |
| `cip2_title` | Broad field name | text | CIP broad field names |
| `cip4` | Specific major code (4-digit CIP) | numeric | 10000–540100 |
| `cip4_title` | Specific major name | text | CIP major names |
| `award_institution` | Award institution type | text | Undergraduate 4-year, 2-year, PAB |
| `pct_ai_exposed` | AI exposure percentage | percent | 6–64% |
| `stem_flag` | STEM field indicator | text | Yes, No |
| `exposure_category` | Categorized AI exposure level | category | Low, Medium, High |
| `enroll_2020` | Student enrollment Fall 2020 | numeric | 106–1,722,799 |
| `enroll_2021` | Student enrollment Fall 2021 | numeric | 106–1,532,808 |
| `enroll_2022` | Student enrollment Fall 2022 | numeric | 107–1,369,158 |
| `enroll_2023` | Student enrollment Fall 2023 | numeric | 105–1,396,164 |
| `enroll_2024` | Student enrollment Fall 2024 | numeric | 113–1,394,605 |
| `enroll_2025` | Student enrollment Fall 2025 | numeric | 105–1,403,617 |
| `enroll_change_pct` | Enrollment change 2022–2025 | percent | -83.18 to 233.27 |

**Variable Definitions:**

- **AI Exposure Category:** Low (<25%), Medium (25–45%), High (>45%)
- **PAB:** Primarily Associate's granting Baccalaureate institutions
- **Enrollment 2022:** Used as pre-ChatGPT baseline for comparison
- **enroll_change_pct:** Calculated as ((2025-2022)/2022)×100

**Missing Data:** None

---

## Methodological Information

### Data Processing

**Sheet 1 (Employment Projections):**
1. Employment and wage data extracted from the BLS National Employment Matrix
2. Automation risk scores merged from the LMI Institute Automation Exposure Index (2019 OES job types)
3. Collar type classified by SOC major code (11–29 = White-collar, 31–53 = Blue-collar)
4. Growth categories derived from projected employment change percentages

**Sheet 2 (Enrollment Data):**
1. Enrollment counts extracted from National Student Clearinghouse CTEE Spring 2020–2025
2. AI exposure percentages merged from U.S. Department of the Treasury Office of Economic Policy analysis
3. STEM flags assigned based on CIP classification
4. Exposure categories created from AI exposure percentages

---

## Data Sources

| Source | Description | URL |
|--------|-------------|-----|
| Bureau of Labor Statistics | Occupational Employment and Wage Statistics | https://www.bls.gov/oes/tables.htm |
| National Student Clearinghouse | CTEE Spring 2020–2025 | https://nscresearchcenter.org/current-term-enrollment-estimates/ |
| U.S. Department of the Treasury | Office of Economic Policy - AI Exposure | https://home.treasury.gov/system/files/136/AI-Combined-PDF.pdf |
| LMI Institute | Automation Exposure Index | https://www.lmiontheweb.org/automation-exposure-score/ |
---
