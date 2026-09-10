# ==============================================================================
# 03_treatment_visualization.R
# ==============================================================================
# Purpose:
# Create a clear, publication-oriented treatment time-course figure from the
# synthetic example dataset.
#
# Author:
# Abrar Hussain Mian
# University of Oulu, Finland
#
# Important:
# The dataset used here is synthetic and is included only to demonstrate a
# reproducible visualization workflow. No unpublished experimental data are used.
# ==============================================================================


# 1. Load required packages ----------------------------------------------------

library(readr)
library(dplyr)
library(ggplot2)


# 2. Import example dataset ----------------------------------------------------

data <- read_csv("example-data/example_dataset.csv")


# 3. Check required variables -------------------------------------------------

required_columns <- c(
  "sample_id",
  "treatment",
  "time_h",
  "concentration_mg_l",
  "replicate"
)

missing_columns <- setdiff(required_columns, names(data))

if (length(missing_columns) > 0) {
  stop(
    "Missing required columns: ",
    paste(missing_columns, collapse = ", ")
  )
}


# 4. Prepare treatment order --------------------------------------------------

data <- data |>
  mutate(
    treatment = factor(
      treatment,
      levels = c("Control", "Treatment_A", "Treatment_B")
    )
  )


# 5. Calculate plotting summaries ---------------------------------------------

plot_summary <- data |>
  group_by(treatment, time_h) |>
  summarise(
    n = n(),
    mean_concentration = mean(concentration_mg_l, na.rm = TRUE),
    sd_concentration = sd(concentration_mg_l, na.rm = TRUE),
    .groups = "drop"
  )

print(plot_summary)


# 6. Create treatment time-course figure --------------------------------------

p <- ggplot(
  plot_summary,
  aes(
    x = time_h,
    y = mean_concentration,
    group = treatment,
    color = treatment
  )
) +
  geom_point(
    data = data,
    aes(
      x = time_h,
      y = concentration_mg_l,
      color = treatment
    ),
    inherit.aes = FALSE,
    alpha = 0.35,
    size = 2
  ) +
  geom_line(linewidth = 0.8) +
  geom_point(size = 2.8) +
  geom_errorbar(
    aes(
      ymin = pmax(mean_concentration - sd_concentration, 0),
      ymax = mean_concentration + sd_concentration
    ),
    width = 0.8,
    linewidth = 0.6
  ) +
  scale_x_continuous(
    breaks = sort(unique(data$time_h))
  ) +
  scale_y_continuous(
    limits = c(0, NA),
    expand = expansion(mult = c(0, 0.05))
  ) +
  labs(
    x = "Time (h)",
    y = "Concentration (mg L^-1)",
    color = "Treatment",
    caption = "Synthetic example data. Points show individual observations; symbols and error bars show mean +/- SD."
  ) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.title = element_text(size = 11),
    legend.text = element_text(size = 10),
    plot.caption = element_text(size = 9, hjust = 0),
    legend.position = "right"
  )


# 7. Display figure ------------------------------------------------------------

print(p)


# 8. Export publication-quality files -----------------------------------------

dir.create("figures", showWarnings = FALSE, recursive = TRUE)

ggsave(
  filename = "figures/treatment_timecourse.png",
  plot = p,
  width = 170,
  height = 120,
  units = "mm",
  dpi = 600
)

ggsave(
  filename = "figures/treatment_timecourse.pdf",
  plot = p,
  width = 170,
  height = 120,
  units = "mm"
)


# 9. Completion message --------------------------------------------------------

cat("Figure created successfully.\n")
cat("Saved to figures/treatment_timecourse.png and .pdf\n")


# ==============================================================================
# End of script
# ==============================================================================
