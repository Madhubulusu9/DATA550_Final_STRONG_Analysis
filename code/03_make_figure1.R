
# Create Figure 1: Age distribution by transgender subgroup

library(ggplot2)

# Load prepared adult analytic dataset
analysis_data <- readRDS("output/analysis_data.rds")

# Create Figure 1
figure1 <- ggplot(
  analysis_data,
  aes(x = age_at_index, fill = subgroup)
) +
  geom_histogram(
    binwidth = 5,
    color = "white",
    linewidth = 0.5
  ) +
  facet_wrap(~ subgroup, ncol = 2) +
  scale_fill_manual(
    values = c(
      "TF" = "#A267C7",
      "TM" = "#16A6A1"
    )
  ) +
  labs(
    title = "Age Distribution by Transgender Subgroup",
    subtitle = "Adult participants in the synthetic STRONG dataset",
    x = "Age at Index (years)",
    y = "Number of Participants"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    legend.position = "none",
    plot.title = element_text(
      face = "bold",
      size = 16,
      color = "#45305A"
    ),
    plot.subtitle = element_text(
      color = "#666666",
      size = 11
    ),
    strip.background = element_rect(
      fill = "#397A50",
      color = NA
    ),
    strip.text = element_text(
      face = "bold",
      size = 12,
      color = "white"
    ),
    panel.grid.minor = element_blank(),
    panel.spacing = grid::unit(1, "lines")
  )

# Save Figure 1
ggsave(
  filename = "output/figure1.png",
  plot = figure1,
  width = 10,
  height = 5.5,
  dpi = 300
)
