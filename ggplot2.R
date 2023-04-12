# Creating first markdown doc

# to add code snippets, use the green C in the top right of this window

# changed to standard script for quickness sake

# bringing in imports and csv to dataframe
library(readr)
library(ggplot2)
tips <- read_csv('tips.csv')


# just outputs a grey box
ggplot(tips)

# adding in x and y gets the axis set up for each but still no data
# aes means aesthetics
ggplot(tips, aes(x = total_bill, y = tip))

# qplot?
# qplot is deprecated but lets me make a quick visual
qplot(total_bill,
      tip,
      data = tips,
      color = sex,
      size = 20)

# ok, now back to real plotting
ggplot(tips, aes(x = total_bill,
                 y = tip,
                 color = sex,
                 size = 20)) + geom_point()

# QUICK BREAK
# refreshing myself on finding the mean
library(dplyr)

tips %>% 
  summarise(mean(tip))

# can I find mean tip by gender?
tips %>% 
  group_by(sex) %>% 
  summarise(mean(tip))

# mean by sex and time?
# need to add both to same group by and not use two group bys or else it overrides
tips %>% 
  group_by(sex, time) %>% 
  # group_by(time) %>% 
  summarise(mean(tip))

# k, back to plotting
ggplot(tips, aes(x = total_bill,
                 y = tip,
                 color = time)) + geom_point()
