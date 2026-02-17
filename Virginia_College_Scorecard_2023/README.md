# README: Virginia College Scorecard Data (2024)

## General Information

**Title of Dataset:** Virginia College Scorecard – Higher Education Inequality Analysis (2024)

**Date of Data Collection:** Academic Year 2022–2023 

**Geographic Location:** Virginia, United States

**Related Publications:** Washington Post Opinion, "How Higher Education Failed America's Poor" (July 20, 2025). https://www.washingtonpost.com/opinions/2025/07/20/college-degree-value-poor-inequality/

---

## Data Files

This dataset contains one CSV file:

| File Name                             | Description | Observations | Variables |
|---------------------------------------|-------------|--------------|-----------|
| `Virginia_College_Scorecard_2023.csv` | Institution-level data on costs, completion, and earnings by income group | 94 | 14 |

---

## Data Description

### File: `Virginia_College_Scorecard_2024.csv`

**Description:** Institution-level data for Virginia colleges and universities, focusing on metrics relevant to analyzing higher education inequality. Includes net prices by family income tier (aligned with Pell Grant eligibility thresholds), completion rates by income group, and post-graduation earnings and debt outcomes.

**Variables:**

| Variable | Variable Name | Unit | Values |
|----------|---------------|------|--------|
| `institution` | Institution Name | text | Institution names |
| `inst_type` | Institution Type | text | 2-year, 4-year |
| `control` | Institution Control | text | Public, Private nonprofit, Private for-profit |
| `enrollment` | Undergraduate Enrollment | numeric | ≥ 0 |
| `prop_pell` | Pell Grant Rate | numeric | 0–1 (proportion) |
| `prop_firstgen` | First-Generation Rate | numeric | 0–1 (proportion) |
| `net_price_pell_eligible` | Net Price for Pell-Eligible Families | numeric | $ (USD) |
| `net_price_middle` | Net Price for Middle-Income Families | numeric | $ (USD) |
| `net_price_high` | Net Price for High-Income Families | numeric | $ (USD) |
| `completion_pell` | Completion Rate (Pell Recipients) | numeric | 0–1 (proportion) |
| `completion_wealthy` | Completion Rate (No Pell, No Loans) | numeric | 0–1 (proportion) |
| `completion_gap` | Completion Gap (Wealthy − Pell) | numeric | proportion (can be negative) |
| `earnings_10yr` | Median Earnings 10 Years After Entry | numeric | $ (USD) |
| `debt_median` | Median Federal Debt at Graduation | numeric | $ (USD) |

**Variable Definitions:**

- **Institution Type:** 2-year institutions include community colleges and technical schools; 4-year institutions include universities and colleges granting bachelor's degrees or higher
- **Control:** Public (state-funded), Private nonprofit (501(c)(3) organizations), Private for-profit (proprietary institutions)
- **Pell Grant Rate:** Proportion of undergraduate students receiving federal Pell Grants, a proxy for low-income student enrollment
- **First-Generation Rate:** Proportion of students whose parents did not attend college
- **Net Price for Pell-Eligible Families:** Average of net prices for families with income $0–$30K and $30K–$48K; this combined bracket aligns with the Max Pell Grant eligibility threshold (~$54,600 AGI for family of 4 at 175% federal poverty guideline per FSA Handbook 2025–26)
- **Net Price for Middle-Income Families:** Net price for families with income $48K–$75K
- **Net Price for High-Income Families:** Net price for families with income above $110K
- **Completion Rate (Pell Recipients):** 8-year completion rate for students who received Pell Grants
- **Completion Rate (No Pell, No Loans):** 8-year completion rate for students who received neither Pell Grants nor federal loans (proxy for wealthy students)
- **Completion Gap:** Difference between wealthy and Pell completion rates; positive values indicate wealthy students complete at higher rates
- **Median Earnings:** Median earnings of federal financial aid recipients 10 years after first enrollment
- **Median Debt:** Median cumulative federal loan debt of students who completed their program

**Missing Data:** Some institutions have missing values, primarily in `net_price_high` and `debt_median`. Rural community colleges often lack high-income net price data due to insufficient students in that income bracket.

---

## Methodological Information

### Data Processing

1. All operating Virginia institutions queried from College Scorecard API
2. Net price for Pell-eligible families computed as average of $0–$30K and $30K–$48K income brackets
3. Completion gap derived as difference between wealthy and Pell completion rates
4. Proportions retained in 0–1 scale (not converted to percentages)
5. Dollar amounts rounded to nearest whole dollar

### Pell Grant Eligibility Alignment

The `net_price_pell_eligible` variable combines two income brackets ($0–$30K and $30K–$48K) based on federal Pell Grant eligibility thresholds:

- **Max Pell (175% poverty):** ~$54,600 AGI for family of 4 (non-single parent)
- **Max Pell (225% poverty):** ~$70,200 AGI for family of 4 (single parent)

Source: Federal Student Aid Handbook 2025–26, Chapter 3: Student Aid Index (SAI) and Pell Grant Eligibility

---

## Data Sources

| Source | URL |
|--------|-----|
| U.S. Department of Education College Scorecard | https://collegescorecard.ed.gov/ |
| College Scorecard Data Documentation | https://collegescorecard.ed.gov/assets/InstitutionDataDocumentation.pdf |
| Federal Student Aid Handbook 2025–26 | https://fsapartners.ed.gov/knowledge-center/fsa-handbook/2025-2026/application-and-verification-guide/ch3-student-aid-index-sai-and-pell-grant-eligibility |