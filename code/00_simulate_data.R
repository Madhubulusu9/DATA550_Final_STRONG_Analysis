# ============================================================
# Simulate STRONG-like data for DATA 550
# Synthetic dataset size: 300 observations
# Target structure: 24 variables matching STRONG2_trans_only
# ============================================================

set.seed(550)

# Number of observations in synthetic dataset
n <- 300


# ------------------------------------------------------------
# COLUMN 1: studyid
# Type in real STRONG data: Character
# Synthetic participant ID
# ------------------------------------------------------------
studyid <- sprintf("SYN%06d", 1:n)


# ------------------------------------------------------------
# COLUMN 2: matchkey
# Type in real STRONG data: Character
# Synthetic matching key
# ------------------------------------------------------------
matchkey <- sprintf("MK%06d", 1:n)


# ------------------------------------------------------------
# COLUMN 3: site
# Type in real STRONG data: Character
# Study site
# ------------------------------------------------------------
site <- sample(
  c("KPGA", "KPMA", "KPNC", "KPSC"),
  size = n,
  replace = TRUE,
  prob = c(833, 1853, 17114, 11177)
)


# ------------------------------------------------------------
# COLUMN 4: transgender
# Type in real STRONG data: Numeric
# Transgender case indicator
# All observations are cases in this dataset
# ------------------------------------------------------------
transgender <- rep(1, n)


# ------------------------------------------------------------
# COLUMN 5: subgroup
# Type in real STRONG data: Character
# TF/TM subgroup
# ------------------------------------------------------------
subgroup <- sample(
  c("TF", "TM"),
  size = n,
  replace = TRUE,
  prob = c(12655, 18322)
)


# ------------------------------------------------------------
# COLUMN 6: TF
# Type in real STRONG data: Numeric
# TF indicator: 1 = TF, 0 = not TF
# ------------------------------------------------------------
TF <- ifelse(subgroup == "TF", 1, 0)


# ------------------------------------------------------------
# COLUMN 7: TM
# Type in real STRONG data: Numeric
# TM indicator: 1 = TM, 0 = not TM
# ------------------------------------------------------------
TM <- ifelse(subgroup == "TM", 1, 0)


# ------------------------------------------------------------
# COLUMN 8: index_date
# Type in real STRONG data: Date
# Synthetic index date
# ------------------------------------------------------------
index_date <- as.Date("2006-01-01") +
  sample(0:6208, n, replace = TRUE)


# ------------------------------------------------------------
# COLUMN 9: birth_date
# Type in real STRONG data: Date
# Created below after age_at_index is simulated
# ------------------------------------------------------------


# ------------------------------------------------------------
# COLUMN 10: age_at_index
# Type in real STRONG data: Numeric
# Age at index date
# ------------------------------------------------------------
age_at_index <- round(rnorm(n, mean = 26.11, sd = 12.86))

# Keep simulated ages within observed range
age_at_index <- pmin(pmax(age_at_index, 0), 91)


# Create COLUMN 9: birth_date using age and index date
birth_date <- index_date - round(age_at_index * 365.25)


# ------------------------------------------------------------
# COLUMN 11: sex_admin
# Type in real STRONG data: Character
# Administrative sex
# ------------------------------------------------------------
sex_admin <- sample(
  c("F", "M"),
  size = n,
  replace = TRUE,
  prob = c(18155, 12524)
)

# Include rare categories so later analysis code can handle them
sex_admin[1] <- "O"
sex_admin[2] <- "U"
sex_admin[3] <- NA


# ------------------------------------------------------------
# COLUMN 12: sex_natal
# Type in real STRONG data: Character
# Natal sex
# ------------------------------------------------------------
sex_natal <- ifelse(subgroup == "TF", "M", "F")


# ------------------------------------------------------------
# COLUMN 13: raceeth
# Type in real STRONG data: Character
# Race/ethnicity category
# ------------------------------------------------------------
raceeth <- sample(
  c("Asian", "Black", "Hispanic", "Not reported", "Other", "White"),
  size = n,
  replace = TRUE,
  prob = c(2524, 2243, 6876, 1822, 1008, 16504)
)


# ------------------------------------------------------------
# COLUMN 14: cohort_source
# Type in real STRONG data: Character
# STRONG cohort source
# ------------------------------------------------------------
cohort_source <- sample(
  c("STRONG1.5", "STRONG2"),
  size = n,
  replace = TRUE,
  prob = c(15561, 15416)
)


# ------------------------------------------------------------
# COLUMN 15: source
# Type in real STRONG data: Character
# Source used to identify observations
# ------------------------------------------------------------
source <- sample(
  c("DX", "DX + KWD", "DX + KWD + SOGI", "KWD", "KWD + SOGI"),
  size = n,
  replace = TRUE,
  prob = c(78, 10907, 17479, 1003, 1510)
)


# ------------------------------------------------------------
# COLUMN 16: SOGI
# Type in real STRONG data: Numeric
# SOGI indicator
# ------------------------------------------------------------
SOGI <- sample(
  c(0, 1, NA),
  size = n,
  replace = TRUE,
  prob = c(10917, 18989, 1081)
)


# ------------------------------------------------------------
# COLUMN 17: Non_Binary
# Type in real STRONG data: Numeric
# Non-binary indicator
# ------------------------------------------------------------
Non_Binary <- sample(
  c(0, 1, NA),
  size = n,
  replace = TRUE,
  prob = c(24578, 5335, 1081)
)


# ------------------------------------------------------------
# COLUMN 18: SEX_AT_BIRTH
# Type in real STRONG data: Character
# Sex-at-birth code
# ------------------------------------------------------------
SEX_AT_BIRTH <- sample(
  c("", "C", "F", "I", "M", "N", "O", "Q", "U"),
  size = n,
  replace = TRUE,
  prob = c(2, 31, 11696, 12, 7618, 9, 17, 1, 11610)
)


# ------------------------------------------------------------
# COLUMN 19: GENDER_IDENTITY
# Type in real STRONG data: Character
# Gender identity code
# ------------------------------------------------------------
GENDER_IDENTITY <- sample(
  c("FF", "FM", "GQ", "MF", "MM", "ND", "OT", "UN"),
  size = n,
  replace = TRUE,
  prob = c(4057, 3440, 5339, 2929, 4436, 89, 876, 9809)
)


# ------------------------------------------------------------
# COLUMN 20: RACE1
# Type in real STRONG data: Character
# Primary race code
# ------------------------------------------------------------
RACE1 <- sample(
  c("AS", "BA", "HP", "IN", "MU", "OT", "UN", "WH"),
  size = n,
  replace = TRUE,
  prob = c(3041, 2582, 253, 303, 31, 32, 4927, 19806)
)


# ------------------------------------------------------------
# COLUMN 21: RACE2
# Type in real STRONG data: Character
# Secondary race code
# ------------------------------------------------------------
RACE2 <- sample(
  c("AS", "BA", "IN", "OT", "UN", "WH"),
  size = n,
  replace = TRUE,
  prob = c(39, 64, 3, 12, 30122, 735)
)


# ------------------------------------------------------------
# COLUMN 22: HISPANIC
# Type in real STRONG data: Character
# Hispanic origin/ethnicity code
# ------------------------------------------------------------
HISPANIC <- sample(
  c("", "N", "U", "Y"),
  size = n,
  replace = TRUE,
  prob = c(21, 5198, 18901, 6876)
)


# ------------------------------------------------------------
# COLUMN 23: EDUCATION_YEARS
# Type in real STRONG data: Character
# Education information is mostly blank in the real dataset
# ------------------------------------------------------------
EDUCATION_YEARS <- sample(
  c("", "12", "14", "16", "18", "Some college", "Bachelors degree"),
  size = n,
  replace = TRUE,
  prob = c(0.9375, 0.015, 0.010, 0.010, 0.005, 0.0125, 0.010)
)


# ------------------------------------------------------------
# COLUMN 24: date_education_recorded
# Type in real STRONG data: Date
# Education contact date
# ------------------------------------------------------------
date_education_recorded <- as.Date(rep(NA_character_, n))

# Assign a date when education information is recorded
has_edu_date <- EDUCATION_YEARS != ""

date_education_recorded[has_edu_date] <- sample(
  seq(
    as.Date("1999-04-01"),
    as.Date("2023-11-03"),
    by = "day"
  ),
  sum(has_edu_date),
  replace = TRUE
)


# ------------------------------------------------------------
# CREATE FINAL SIMULATED STRONG DATASET
# 300 observations and 24 variables
# Variables are in the same order as the real STRONG dataset
# ------------------------------------------------------------
strong_sim <- data.frame(
  studyid,
  matchkey,
  site,
  transgender,
  subgroup,
  TF,
  TM,
  index_date,
  birth_date,
  age_at_index,
  sex_admin,
  sex_natal,
  raceeth,
  cohort_source,
  source,
  SOGI,
  Non_Binary,
  SEX_AT_BIRTH,
  GENDER_IDENTITY,
  RACE1,
  RACE2,
  HISPANIC,
  EDUCATION_YEARS,
  date_education_recorded,
  stringsAsFactors = FALSE
)


# ------------------------------------------------------------
# SAVE FINAL SIMULATED STRONG DATASET
# ------------------------------------------------------------
saveRDS(
  strong_sim,
  "data/strong_simulated.rds"
)