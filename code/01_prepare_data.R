
# Prepare adult analytic sample from synthetic STRONG data

library(dplyr)

strong_data <- readRDS("data/strong_simulated.rds")

analysis_data <- strong_data |>
  filter(
    !is.na(age_at_index),
    age_at_index >= 18,
    subgroup %in% c("TF", "TM")
  )

# Save the prepared dataset
dir.create("output", showWarnings = FALSE)

saveRDS(
  analysis_data,
  "output/analysis_data.rds"
)
