library(tidyverse)
library(palmerpenguins)


# 一、统计每位同学，成绩高于各科均值的个数
dt <- tibble::tribble(
  ~name, ~chinese, ~english, ~physics, ~sport, ~music,
  "Aice", 85, 56, 56, 54, 78,
  "Bob", 75, 78, 77, 56, 69,
  "Cake", 69, 41, 88, 89, 59,
  "Dave", 90, 66, 74, 82, 60,
  "Eve", 68, 85, 75, 69, 21,
  "Fod", 77, 74, 62, 74, 88,
  "Gimme", 56, 88, 75, 69, 34
)

# 比较每为学生的学科成绩与学科均值的大小，并计数
dt %>%
  mutate(across(-name, ~ (. > mean(.)))) %>%
  rowwise() %>%
  mutate(better_than_mean = sum(c_across(2:6))) %>%
  select(1,7)

# 二、将`tb`一行中最大的数变为1，其余的变为0
tb <- tibble::tribble(
  ~a,  ~b,  ~c,
  2,  4,  3,
  13,  9,  4,
  1,  7,  9,
  11, 13, 13
)

# 新建列储存每行的最大值，进行比较。
tb %>%
  rowwise() %>%
  mutate(max = max(c_across(a:c))) %>%
  mutate(across(a:c,~ as.numeric((.==max)))) %>%
  ungroup() %>%
  select(-4)

# 每行中的每一元素与最大值做整除运算 %/%
tb %>%
  rowwise() %>%
  mutate(max = max(c_across(a:c))) %>% 
  mutate(across(a:c, ~ .%/%max)) %>%
  select(-4)



# 三、找出`db`数据框中，含有H66的记录行
db <- tibble::tribble(
  ~id, ~enc_dx1, ~enc_dx1_name, ~enc_dx2, ~enc_dx2_name, ~enc_dx3, ~enc_dx3_name,
  1L,    "H66",     "example",    "E55",     "example",       NA,            NA,
  2L,    "J95",        "text",    "K55",        "text",       NA,            NA,
  3L,    "M00",        "here",    "H66",        "here",       NA,            NA,
  4L,    "H66",    "and here",    "K75",    "and here",    "H66",    "and here",
  5L,    "R00",   "also here",    "K67",   "also here",       NA,            NA
)
db  %>% filter(
  if_any(contains("enc"), ~ . == "H66")
)


# 四、- 计算不同种类的企鹅宝宝，其各体征数据的均值（注意缺失值）
penguins %>%
  group_by(species) %>%
  summarise(
    across(bill_length_mm:body_mass_g,
           function(x){mean(x, na.rm=TRUE)}))

# 对df中的整数型列进行均值运算(去掉year)
penguins %>%
  group_by(species) %>%
  summarise(across(where(is.numeric) & !year, ~mean(., na.rm=TRUE)))


#五、统计在不同岛屿，观察到企鹅的数量以及有多少种类

# 根据岛屿、物种进行分组，传入tally
penguins %>%
  group_by(island,species) %>%
  tally()

# 根据岛屿分组，计算个体总数和物种总数
penguins %>%
  group_by(island) %>%
  summarise(
    n = n(),
    across(species, n_distinct))
