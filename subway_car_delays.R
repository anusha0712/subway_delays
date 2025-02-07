library(ggplot2)
library(readr)
library(ggpattern)
library(magick)

setwd("/Users/anushasubramanian/Desktop/Columbia/Spring 2025/Algorithms/subway_delays/")

subway_data <- data.frame(
  year = c(2020, 2021, 2022, 2023, 2024),
  delays = c(25, 45, 43, 44, 100),
  image = c("subway_2020.png", "subway_2021.png", "subway_2022.png", "subway_2023.png", "subway_2024.png")
)

ggplot(subway_data) +
  aes(x = delays, y = factor(year)) +
  geom_col_pattern(
    aes(pattern_filename = image),
    pattern = 'image',
    pattern_fill = "white",
    fill = 'white',
    pattern_type = 'expand',
    pattern_aspect_ratio = 1.18,
  ) +
  scale_pattern_filename_discrete(choices = subway_data$image) +
  geom_text(aes(label = paste0(delays, " delays")), hjust = -0.2) +
  coord_cartesian(xlim = c(0, 120)) +
  theme_minimal() +
  theme(text = element_text(size = 13),
        axis.text.x = element_text(size = 12, hjust = 1), 
        axis.text.y = element_text(size = 13, hjust = 1)) +
  labs(title = "Subway Car Delays Surge 127%",
       subtitle = "MTA data shows that unplanned subway car related incidents, causing delays of \n50 or more trains, have hit a record high in 2024",
       x = NULL,
       y = NULL,
       caption = "\nSubway car related incidents are those involving broken doors, seats, windows, lights, brakes and\nother problems caused by defective trains, such as power or air conditioning failures (MTA handbook).            Data source: MTA Open Data") +
  theme(legend.position = "none",
        panel.grid.major = element_blank(),
        plot.caption = element_text(size = 10, hjust = 0, vjust = -1),
        plot.margin = margin(10, 10, 20, 10)) +
  geom_text(aes(x = 90.8, y = "2023", 
                label = "- Train experienced 17 such\n  delays, making it the largest\n   recorded total by a single subway\n line in the past 5 years."), 
            size = 3, hjust = 0.1, vjust = 0.9) +
  geom_point(aes(x = 86, y = "2023"), 
           size = 7, shape = 21, fill = "#FCCC0A") +

  geom_text(aes(x = 86, y = "2023", label = "N"), 
          fontface = "bold", size = 4, vjust = 0.5) +

  geom_curve(aes(x = 114, y = "2024", xend = 112, yend = "2023"), 
             curvature = -0.7, arrow = arrow(length = unit(0.02, "npc")))



