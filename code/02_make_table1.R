
# Create Table 1: Participant characteristics by subgroup

library(dplyr)
library(gtsummary)

# Load prepared adult analytic dataset
analysis_data <- readRDS("output/analysis_data.rds")

# Create Table 1
table1 <- analysis_data |>
  select(
    subgroup,
    age_at_index,
    site,
    raceeth,
    sex_admin
  ) |>
  tbl_summary(
    by = subgroup,
    label = list(
      age_at_index ~ "Age at index, years",
      site ~ "Study site",
      raceeth ~ "Race/ethnicity",
      sex_admin ~ "Administrative sex"
    ),
    statistic = list(
      age_at_index ~ "{mean} ({sd})",
      all_categorical() ~ "{n} ({p}%)"
    ),
    missing = "ifany"
  ) |>
  modify_header(
    label ~ "**Characteristic**"
  ) |>
  bold_labels()

# Save Table 1
saveRDS(
  table1,
  "output/table1.rds"
)
