library(tidyverse)
library(palmerpenguins)

# 丢弃缺失值
penguins <- penguins %>% 
  drop_na()


# 自定义函数，用文字描述总数。
n_fun <- function(x) {
  data.frame(y = 62,
             label = length(x),
             color = ifelse(length(x) > 100, "red", "black")
  )
}

# 采用三种方式(stat、geom和layer)绘制图表

penguins %>% 
  ggplot(aes(x = species, y = bill_length_mm)) +
  geom_violin() +
  geom_jitter() +
  stat_summary(
    fun.data = n_fun,
    geom = "text"
  )

penguins %>% 
  ggplot(aes(x = species, y = bill_length_mm)) +
  geom_violin() +
  geom_jitter() +
  geom_text(
    fun.data = n_fun,
    stat = "summary"
  )

# layer中需要补全五大绘图要素，并用param参数传入函数
penguins %>% 
  ggplot(aes(x = species, y = bill_length_mm)) +
  geom_violin() +
  geom_jitter() +
  layer(
    position = "identity",
    param = list(fun.data = n_fun),
    stat = "summary",
    geom = "text"
  )
