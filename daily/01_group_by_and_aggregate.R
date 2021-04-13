library(tidyverse)

attach(mtcars)

# 整合数据(aggregate)
options(digits=3)
(aggdata <- aggregate(mtcars, by=list(cyl,gear), FUN=mean, na.rm=TRUE))



# 整合数据(group_by)
mtcars %>%
  group_by(cyl,gear) %>%
  summarise(across(everything(), ~ round(mean(.),2)))

            