library(tidyverse)

read_csv("data/GLB.Ts+dSST.csv", skip=1,na="***") %>%
  select(year = Year, t_diff = `J-D`) %>%
  ggplot(aes(x = year, y = t_diff)) + 
  geom_line(color = "gray", size =0.5) +
  geom_point(fill = "white", color = "red", shape = 21) +
  geom_smooth(se = FALSE, color = "black",size = 0.5, span = 0.50) +
  scale_x_continuous(breaks=seq(1880,2023,20), expand = c(0,0))+
  scale_y_continuous(limits = c(-0.5,1.5), expand = c(0,0))+
  labs(
    x="YEAR",
    y="Temperature anomaly(C)",
    title = "GLOBAL LAND-OCEAN TEMPEATURE INDEX",
    subtitles = "Data Source: NASA's GISS"
  ) +
  theme_light() +
  theme(axis.ticks = element_blank(),
        plot.title.position = "plot",
        plot.title=element_text(margin = margin(b=15), color="red", face = "bold"),
        plot.subtitle = element_text(size =8)
        )

ggsave("figures/tempearature_index_plot.png",width = 6, height = 4)


