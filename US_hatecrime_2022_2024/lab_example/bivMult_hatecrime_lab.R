#############################################################################
# STAT 1014: Bivariate and Multivariate Summaries
# Lab: Antisemitism in America
# 
# This script accompanies the lab on analyzing anti-Jewish hate crime data
# Source: FBI Crime Data Explorer, U.S. Census Bureau, SPLC, ADL
#############################################################################

#============================================================================
# SECTION 1: Setup and Data Import
#============================================================================

# Set your working directory (change this to your folder path)
setwd("~/Documents/stat_1014_dataset/hate_crime/processed_data")

# Table A: State-level data (51 observations, 25 variables)
dat <- read.table("fbi_hate_crimes_state_2023.csv", 
                  sep = ",", header = TRUE, stringsAsFactors = FALSE)

# Table B: Monthly trends data (12 observations, 10 variables)
monthly <- read.table("fbi_hate_crimes_monthly_2022_2024.csv", 
                      sep = ",", header = TRUE, stringsAsFactors = FALSE)

# Verify data imported correctly
dim(dat)       # Should be 51 rows, 25 columns
dim(monthly)   # Should be 12 rows, 10 columns
names(dat)
head(dat)

#============================================================================
# SECTION 2: Calculate Per-Capita Rates
#============================================================================

# Why per-capita rates matter:
# Raw counts are misleading because states have different populations
# Rate per 100,000 = (incidents / population) * 100,000

# Calculate 2023 anti-Jewish rate per 100,000
dat$anti_jewish_rate_2023 <- (dat$anti_jewish_2023 / dat$total_pop_2023) * 100000

# Calculate 2022 anti-Jewish rate per 100,000
dat$anti_jewish_rate_2022 <- (dat$anti_jewish_2022 / dat$total_pop_2022) * 100000

# Handling Missing Data (NA values)
# Check which states have missing 2022 data
dat$state[is.na(dat$anti_jewish_2022)]

# Always use na.rm = TRUE for calculations
sum(dat$anti_jewish_2022, na.rm = TRUE)
mean(dat$anti_jewish_2022, na.rm = TRUE)

# Q3: Calculate change from 2022 to 2023
dat$change_rate <- dat$anti_jewish_rate_2023 - dat$anti_jewish_rate_2022

# Q4: Find largest increase and decrease
dat$state[which.max(dat$change_rate)]  # Largest increase
dat$state[which.min(dat$change_rate)]  # Largest decrease

# Q5: Compare California and Wyoming
dat[dat$state %in% c("CALIFORNIA", "WYOMING"), 
    c("state", "anti_jewish_2023", "total_pop_2023", "anti_jewish_rate_2023")]

#============================================================================
# SECTION 3: Testing Article Claims — Holocaust Education
#============================================================================

# Q6: Count states in each Holocaust education category
table(dat$holocaust_education)
# Expected: Mandatory=29, Recommended=7, No Mandate=15 (matches article)

# Q7: Mean anti-Jewish rate by Holocaust education mandate
aggregate(anti_jewish_rate_2023 ~ holocaust_education, data = dat, FUN = mean)

# Q9: Boxplot of rates by Holocaust education
boxplot(anti_jewish_rate_2023 ~ holocaust_education, data = dat,
        xlab = "Holocaust Education Policy",
        ylab = "Anti-Jewish Hate Crimes per 100k (2023)",
        main = "Anti-Jewish Hate Crime Rates by Education Policy",
        col = c("lightblue", "lightgreen", "lightyellow"))

# Q10: Mean anti-Jewish rate by region
aggregate(anti_jewish_rate_2023 ~ region, data = dat, FUN = mean)

# Q11: Mean anti-Jewish rate by political lean
aggregate(anti_jewish_rate_2023 ~ political_lean, data = dat, FUN = mean)

#============================================================================
# SECTION 4: Measurement Validity — hate_crime_law Variable
#============================================================================

# Q13: Count states in each hate_crime_law category
table(dat$hate_crime_law)
# Comprehensive: 20, Standard: 23, No Law: 4 (AR, IN, SC, WY)

# Q14: Mean anti-Jewish rate by law strength
aggregate(anti_jewish_rate_2023 ~ hate_crime_law, data = dat, FUN = mean)
# Key insight: Comprehensive laws show HIGHER rates (measurement sensitivity!)

# Q16: Cross-tabulate law strength and Holocaust education
table(dat$hate_crime_law, dat$holocaust_education)

#============================================================================
# SECTION 5: Correlation Analysis — The Confounding Variable
#============================================================================

# Q17: Scatterplot - Jewish population vs anti-Jewish rate
plot(dat$prop_jewish, dat$anti_jewish_rate_2023,
     xlab = "Proportion Jewish Population",
     ylab = "Anti-Jewish Hate Crimes per 100k (2023)",
     main = "Jewish Population vs. Anti-Jewish Hate Crime Rate",
     pch = 19, col = "darkblue")

# Q18: Correlation coefficient
cor(dat$prop_jewish, dat$anti_jewish_rate_2023, use = "complete.obs")
# Expected: r ≈ 0.78 (strong positive correlation)

#============================================================================
# SECTION 6: The Opportunity Gap Framework — Youth Analysis
#============================================================================

# Q20: Scatterplot - Youth population vs anti-Jewish rate
plot(dat$prop_age_15_24, dat$anti_jewish_rate_2023,
     xlab = "Proportion Age 15-24",
     ylab = "Anti-Jewish Hate Crimes per 100k (2023)",
     main = "Youth Population vs. Anti-Jewish Hate Crime Rate",
     pch = 19, col = "darkred")

# Q21: Correlation - Youth vs hate crimes
cor(dat$prop_age_15_24, dat$anti_jewish_rate_2023, use = "complete.obs")
# Expected: r ≈ -0.28 (weak negative — seems to contradict article!)

# Q23: THE HIDDEN RELATIONSHIP - Youth vs Jewish population
cor(dat$prop_age_15_24, dat$prop_jewish, use = "complete.obs")
# Expected: r ≈ -0.31 (negative!)
# INSIGHT: High-youth states have LOW Jewish populations
# This is the "Opportunity Gap" — hate crimes need targets

#============================================================================
# SECTION 7: Simpson's Paradox — Controlling for Confounders
#============================================================================

# Create Jewish population categories
dat$jewish_level <- cut(dat$prop_jewish, 
                        breaks = c(0, 0.005, 0.015, 1),
                        labels = c("Low", "Medium", "High"))

# Q27: Mean rates by Holocaust education WITHIN Jewish population levels
aggregate(anti_jewish_rate_2023 ~ holocaust_education + jewish_level, 
          data = dat, FUN = mean)
# Key insight: Within each Jewish level, education differences shrink/reverse

#============================================================================
# SECTION 8: Time-Series Analysis — The October 7 Effect (Table B)
#============================================================================

# Q29: View monthly data
monthly

# Q30: Calculate Pre-War vs Post-War averages
pre_war_mean <- mean(monthly$anti_jewish_2023[1:9])   # Jan-Sept
post_war_mean <- mean(monthly$anti_jewish_2023[10:12]) # Oct-Dec

cat("Pre-war average (Jan-Sept):", round(pre_war_mean, 1), "\n")
cat("Post-war average (Oct-Dec):", round(post_war_mean, 1), "\n")
cat("Percentage increase:", round((post_war_mean - pre_war_mean) / pre_war_mean * 100, 1), "%\n")
# Expected: ~203% increase

# Q32: Visualize the structural break
months_num <- 1:12

plot(months_num, monthly$anti_jewish_2023, type = "b", 
     xlab = "Month", ylab = "Anti-Jewish Incidents",
     main = "Monthly Anti-Jewish Hate Crimes in 2023",
     pch = 19, col = "darkblue", lwd = 2,
     xaxt = "n", ylim = c(0, 400))
axis(1, at = 1:12, labels = monthly$incident_month)

# Add vertical line at October (the structural break)
abline(v = 10, col = "red", lty = 2, lwd = 2)
text(10.3, 350, "Oct 7", col = "red")

# Add horizontal lines for pre/post averages
abline(h = pre_war_mean, col = "blue", lty = 3)
abline(h = post_war_mean, col = "orange", lty = 3)
legend("topleft", c("Pre-Oct Average", "Post-Oct Average"), 
       col = c("blue", "orange"), lty = 3)

#============================================================================
# SECTION 9: Verifying Article Statistics
#============================================================================

# Q34: Calculate percentage of hate crimes that were anti-Jewish
total_anti_jewish <- sum(dat$anti_jewish_2023, na.rm = TRUE)
total_hate_crime <- sum(dat$hate_crime_2023, na.rm = TRUE)
pct <- total_anti_jewish / total_hate_crime * 100

cat("Anti-Jewish incidents:", total_anti_jewish, "\n")
cat("Total hate crimes:", total_hate_crime, "\n")
cat("Percentage:", round(pct, 1), "%\n")
# Expected: ~16.5% (confirms article's claim of ~15%)

#============================================================================
# ADDITIONAL EXPLORATION (Optional)
#============================================================================

# Full correlation matrix for key continuous variables
key_vars <- dat[, c("anti_jewish_rate_2023", "prop_jewish", "prop_age_15_24", 
                    "median_income", "gini_index", "hate_groups_per_million",
                    "prop_bs_grad")]
round(cor(key_vars, use = "complete.obs"), 3)

# Top 5 states by anti-Jewish rate (2023)
head(dat[order(-dat$anti_jewish_rate_2023), 
         c("state", "anti_jewish_rate_2023", "prop_jewish", "holocaust_education")], 5)

# States with zero anti-Jewish incidents in 2023
dat$state[dat$anti_jewish_2023 == 0 | is.na(dat$anti_jewish_2023)]

# Compare 2022 vs 2023 totals (Table B verification)
cat("\n2022 Total Anti-Jewish:", sum(monthly$anti_jewish_2022), "\n")
cat("2023 Total Anti-Jewish:", sum(monthly$anti_jewish_2023), "\n")
cat("2024 Total Anti-Jewish:", sum(monthly$anti_jewish_2024), "\n")
cat("2022→2024 % Change:", 
    round((sum(monthly$anti_jewish_2024) - sum(monthly$anti_jewish_2022)) / 
            sum(monthly$anti_jewish_2022) * 100, 1), "%\n")
# Expected: ~61% (close to article's 63% claim)

#############################################################################

#############################################################################
# CHALLENGE SECTION: The Reporting Paradox
# Simpson's Paradox with Hate Groups and Urbanization
#############################################################################

#============================================================================
# Setup: Calculate Total Hate Crime Rate
#============================================================================

# Create hate crime rate per 1,000,000 (ALL hate crimes, not just anti-Jewish)
dat$hate_crime_rate_2023 <- (dat$hate_crime_2023 / dat$total_pop_2023) * 1000000

#============================================================================
# Q_C1: The "Naive" Plot — Overall Correlation
#============================================================================

# Scatterplot of hate groups vs total hate crime rate
plot(dat$hate_groups_per_million, dat$hate_crime_rate_2023,
     pch = 19, col = "gray50",
     xlab = "Hate Groups per Million Residents",
     ylab = "Total Hate Crimes per 100k (2023)",
     main = "Do Hate Groups Predict Hate Crimes?")

# Overall correlation
cor(dat$hate_groups_per_million, dat$hate_crime_rate_2023, use = "complete.obs")
# Expected: Weak correlation — counterintuitive!

#============================================================================
# Q_C3: The "Sherlock Holmes" Moment — Color by Urbanization
#============================================================================

# Create color coding by urbanization
dat$urban_color <- ifelse(dat$urbanization == "Highly Urban", "blue",
                          ifelse(dat$urbanization == "Moderate", "purple", "red"))

# Colored scatterplot
plot(dat$hate_groups_per_million, dat$hate_crime_rate_2023,
     pch = 19, col = dat$urban_color, cex = 1.2,
     xlab = "Hate Groups per Million Residents",
     ylab = "Total Hate Crimes per Million Residents (2023)",
     main = "The Reporting Paradox: Urban vs Rural")

legend("topleft", 
       legend = c("Highly Urban", "Moderate", "Rural"), 
       col = c("blue", "purple", "red"), 
       pch = 19, cex = 0.9)

#============================================================================
# Q_C5: Stratified Correlations — Within Each Urbanization Level
#============================================================================

# Highly Urban states
urban_cor <- cor(dat$hate_groups_per_million[dat$urbanization == "Highly Urban"], 
                 dat$hate_crime_rate_2023[dat$urbanization == "Highly Urban"], 
                 use = "complete.obs")

# Moderate urbanization states
moderate_cor <- cor(dat$hate_groups_per_million[dat$urbanization == "Moderate"], 
                    dat$hate_crime_rate_2023[dat$urbanization == "Moderate"], 
                    use = "complete.obs")

# Rural states
rural_cor <- cor(dat$hate_groups_per_million[dat$urbanization == "Rural"], 
                 dat$hate_crime_rate_2023[dat$urbanization == "Rural"], 
                 use = "complete.obs")

# Print all correlations
cat("=== Simpson's Paradox: Hate Groups vs Total Hate Crime Rates ===\n\n")
cat("Overall correlation:       ", round(cor(dat$hate_groups_per_million, 
                                             dat$hate_crime_rate_2023, 
                                             use = "complete.obs"), 3), "\n")
cat("Highly Urban correlation:  ", round(urban_cor, 3), "\n")
cat("Moderate correlation:      ", round(moderate_cor, 3), "\n")
cat("Rural correlation:         ", round(rural_cor, 3), "\n")

#============================================================================
# Additional Exploration: Cross-tabulation of Urbanization × Law Strength
#============================================================================

# Shows the connection between urbanization and reporting infrastructure
table(dat$urbanization, dat$hate_crime_law)

#============================================================================
# Summary Statistics by Urbanization
#============================================================================

# Mean hate groups per million by urbanization
cat("\n=== Hate Groups per Million by Urbanization ===\n")
aggregate(hate_groups_per_million ~ urbanization, data = dat, FUN = mean)

# Mean hate crime rate by urbanization
cat("\n=== Total Hate Crime Rate by Urbanization ===\n")
aggregate(hate_crime_rate_2023 ~ urbanization, data = dat, FUN = mean)

# Count of states by urbanization
cat("\n=== Number of States by Urbanization ===\n")
table(dat$urbanization)

#============================================================================
# END OF SCRIPT
#============================================================================
