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

# 创建字符向量，用于传递颜色
color = c('#668B24','#C3C4BF','#E15241','#D4C479','#0E8AAC',
          '#A4D291','#CF5D05')

# 加载图片，作为图表的背景图片
img <- png::readPNG('lego_example.png')

ggplot(dt) +
  ggpubr::background_image(img) + # 将背景图置于第二图层
  geom_col(aes(x=id,y=num),fill=color,width=1) +  # 将条形图置于第三图层
  xlim(-1,9) + 
  ylim(-2,7) + #限制x轴和y轴的范围
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank()) + 
  labs(x = NULL, y = NULL) # 去除x轴和y轴的显示
