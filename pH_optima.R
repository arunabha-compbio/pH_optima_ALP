# Load required libraries
library(ggplot2)

# ----- Data Entry -----
ph       <- c(8.6, 9.0, 9.4, 10.0)
activity <- c(0.038, 0.040, 0.054, 0.050)

df <- data.frame(ph, activity)

# ----- Smooth Spline for the Curve -----
spline_fit <- spline(df$ph, df$activity, n = 500)
spline_df  <- data.frame(ph = spline_fit$x, activity = spline_fit$y)

# Find the peak (optimum pH)
optimum_idx  <- which.max(spline_df$activity)
optimum_ph   <- spline_df$ph[optimum_idx]
optimum_act  <- spline_df$activity[optimum_idx]

# ----- Plot -----
ggplot() +
  # Smoothed curve
  geom_line(data = spline_df,
            aes(x = ph, y = activity),
            color = "#E05A2B", linewidth = 1.2) +
  
  # Actual data points
  geom_point(data = df,
             aes(x = ph, y = activity),
             color = "#2B4BA8", size = 4, shape = 21,
             fill = "#5B8DEF", stroke = 1.2) +
  
  # Highlight optimum point ON the curve
  geom_point(aes(x = optimum_ph, y = optimum_act),
             color = "#E05A2B", size = 4, shape = 18) +
  
  # Annotate optimum pH
  annotate("text",
           x = optimum_ph + 0.05, y = optimum_act + 0.0008,
           label = paste0("pH-opt ≈ ", round(optimum_ph, 1)),
           hjust = 0, color = "grey25", size = 4.2, fontface = "italic") +
  
  # Axis labels and title
  labs(
    title    = "Effect of pH on Enzyme Activity",
    subtitle = "Optimum pH determined by cubic spline interpolation",
    x        = "pH",
    y        = "Enzyme Activity (O.D / min)"
  ) +
  
  # Custom x-axis breaks
  scale_x_continuous(breaks = c(8.6, 9.0, 9.4, 10.0),
                     limits = c(8.3, 11.0)) +
  
  # Y-axis now starts close to data range for better visual spread
  scale_y_continuous(limits = c(0.030, 0.062),
                     breaks = seq(0.030, 0.062, by = 0.004)) +
  
  theme_classic(base_size = 13) +
  theme(
    plot.title         = element_text(face = "bold", hjust = 0.5),
    plot.subtitle      = element_text(hjust = 0.5, color = "grey50", size = 10),
    axis.title         = element_text(face = "bold"),
    panel.grid.major.y = element_line(color = "grey90")
  )