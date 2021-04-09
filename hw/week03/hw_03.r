library(tidyverse)

dt <- tibble::tribble(
  ~id, ~num,
  1, 6,
  2, 5,
  3, 4,
  4, 3,
  5, 2,
  6, 2,
  7, 1
)

color = c('#668B24','#C3C4BF','#E15241','#D4C479','#0E8AAC',
          '#A4D291','#CF5D05')

img <- png::readPNG('lego_example.png')

ggplot(dt) +
  ggpubr::background_image(img) +
  geom_col(aes(x=id,y=num),fill=color,width=1) + 
  xlim(-1,9) + 
  ylim(-2,7) + 
  theme(panel.background=element_rect(colour = "#BCB5AD"),
        axis.text.x = element_blank(),
        axis.text.y = element_blank()) +
  labs(x = NULL, y = NULL)