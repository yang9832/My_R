library(tidyverse)
library(reshape2)
mydata <- tribble(
  ~ID,~Time,~X1,~X2,
  1,1,5,6,
  1,2,3,5,
  2,1,6,1,
  2,2,2,4
)

# 融合数据框(melt)
(md <- melt(mydata,id=c("ID","Time")))


# 重铸(dcast)

dcast(md,ID+Time~variable) # 恢复数据框

# 使用均值重铸数据框
dcast(md, Time ~ variable, mean)
dcast(md, ID ~ variable, mean)
dcast(md, ID ~ Time, mean)

# 仅重塑数据框
dcast(md, ID~variable + Time)
dcast(md, Time + variable~ ID)
dcast(md, ID + variable ~ Time)
