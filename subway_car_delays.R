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
    pattern_aspect_ratio = 1.2
  ) +
  scale_pattern_filename_discrete(choices = subway_data$image) +
  geom_text(aes(label = delays, fontface = ), hjust = -1) +
  coord_cartesian(xlim = c(0, 120)) +
  theme_minimal() +
  theme(text = element_text(size = 13),
        axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Subway Car Delays Surge 127%",
       subtitle = "MTA data shows that unplanned subway-car related incidents, causing delays of \n50 or more trains, have hit a record high in 2024",
       x = "Year",
       y = "Delays",
       caption = "Data source: MTA Open Data") +
  theme(legend.position = "none") +
  annotate("text", x = 88, y = "2024", label = "experienced 17 such\ndelays - largest recorded\nby a single subway line\nin the past 5 years",
           size = 3, vjust = 2.7, hjust = 0) +
  annotate("point", x = 85, y = "2023", size = 7, shape = 21, fill = "#FCCC0A", ) +  # Simulating the N train icon
  annotate("text", x = 85, y = "2023", label = "N", fontface = "bold", size = 4) +
  geom_curve(aes(x = 110, y = "2024", xend = 110, yend = "2023"), 
             curvature = -0.7, arrow = arrow(length = unit(0.02, "npc")))



