library(tidyverse)

attach(mtcars)

# 整合数据(aggregate)
options(digits=3)
#FUN=mean 使用平均函数(mean)进行处理
(aggdata <- aggregate(mtcars, by=list(cyl,gear), FUN=mean, na.rm=TRUE)) 




# 整合数据(group_by)
mtcars %>%
  group_by(cyl,gear) %>%
  summarise(
    across(
      everything(), ~ round(mean(.),2) # round()设置结果的小数位
      )
    )

            