# Tidyverse intro
library(ggplot2)
library(dplyr)
library(readr)

tips <- read_csv("tips.csv")
tips[1]

# select one col
select(tips, total_bill)

# select more col
select(tips, total_bill, tip, sex, smoker, day, time, size)

# trying with thingy
tips %>% select(smoker)

# try no thingy
# tips select(smoker) (doesn't work)

# slicing cols
select(tips, total_bill:size)

#slicing by col number (remove first col which is index)
select(tips, -1)

# get col names
colnames(tips)

# first index col is '...1'
tips['...1']

# trying starts with
select(tips, starts_with('s'))

# so select is for cols
# filter() is for rows

# cleaning df and dropping index
df <- select(tips, -1)

# checking new df
df

# slice df to only include rows that contain 'Sun'
filter(df, day == 'Sun')

# slice df to only include rows with tip >5
filter(df, tip > 5)

# slice with an and operand
filter(df, sex == 'Male' & smoker == 'Yes')

# slice with an or operand
filter(df, sex == 'Male' | smoker == 'Yes')

# mutate makes new variables and stuff 
# parenthesis mean a lot in this
mutate(df, gbp_total = (total_bill * .82))

mutate(df,
       gbp_total = total_bill * .82,
       gbp_tips = tip * .82
       )

# only cols for smoker and gbp_tip if tip > 5
df %>%
  mutate(gbp_tip = tip * .82) %>%
  filter(gbp_tip >=5) %>%
  select(smoker, gbp_tip)

# more stuff
df %>% 
  filter(sex == 'Male' & smoker == 'Yes') %>% 
  mutate(gbp_total_bill = total_bill * .82,
         gbp_tip = tip *.82) %>% 
  select(sex, smoker, gbp_total_bill, gbp_tip)


# trying some groupby() and summerise()
df

# trying to count smokers (do not need to groupby first)
# similar to regular value count
df %>% 
  count(smoker)

# count and getting info per group
df %>% 
  group_by(smoker) %>% 
  summarise(mean_tip = mean(tip),
            count = n())

# next thing
df %>% 
  group_by(smoker) %>% 
  summarise(mean_tip = mean(tip),
            count = n()) %>% 
  arrange(desc(mean_tip))
