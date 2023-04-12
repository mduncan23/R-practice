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
  group_by(sex, time, smoker) %>% 
  # group_by(time) %>% 
  summarise(mean_tip = mean(tip))

# k, back to plotting
ggplot(tips, aes(x = total_bill,
                 y = tip,
                 color = time)) + geom_point()

# adding in shape mapping
ggplot(tips,
       aes(x = total_bill,
           y = tip,
           color = time,
           size = 20,
           shape = smoker)) + geom_point()

# checking unique days, 2 ways?
tips %>% 
  distinct(day)

unique(tips['day'])

# now make subplots!!
ggplot(tips, 
       aes(x = total_bill,
           y= tip,
           color = time, 
           shape = smoker)) +
  geom_point() +
  facet_wrap(~day)

# are there really no lunches on saturday?
tips %>% 
  filter(day == 'Sat') %>% 
  group_by(time) %>% 
  distinct(time)

# lets move on to bar plots

# if I use color, it just sets outlines
ggplot(tips,
       aes(x = day,
           color = sex)) +
  geom_bar()

# I need to use fill to make a true stacked bar
ggplot(tips,
       aes(x = day,
           fill = sex)) +
  geom_bar()

# if I want to specify a color I can do so 
ggplot(tips,
       aes(x = day,
           fill = sex)) +
  geom_bar() +
  scale_fill_manual(values = c('deeppink', 'blue'))

# if I want to make it a side by side bar
ggplot(tips,
       aes(y = day,
           fill = sex)) +
  geom_bar(position = 'dodge') +
  scale_fill_manual(values = c('deeppink', 'blue'))

# or if I want them but with a lil space between them
ggplot(tips,
       aes(x = day,
           fill = sex)) +
  geom_bar(position = 'dodge2') +
  scale_fill_manual(values = c('deeppink', 'blue'))

# If I want to make it proportional for each day
ggplot(tips,
       aes(x = day,
           fill = sex)) +
  geom_bar(position = 'fill') +
  scale_fill_manual(values = c('deeppink', 'blue'))

# now I want to do subplots
ggplot(tips,
       aes(x = day,
           fill = sex)) +
  geom_bar(position = 'dodge') +
  facet_wrap(~time) + 
  scale_fill_manual(values = c('deeppink', 'blue'))

# can also make it confusing by adding element of smoker with outline
ggplot(tips,
       aes(x = day,
           fill = sex,
           alpha = smoker)) +
  geom_bar(position = 'dodge') +
  facet_wrap(~time) + 
  scale_fill_manual(values = c('deeppink', 'blue'))


# now to rename stuff and make the plot prettier
ggplot(tips,
       aes(x = day,
           fill = sex)) +
  geom_bar(position = 'dodge') +
  facet_wrap(~time) +
  scale_fill_manual(values = c('deeppink', 'blue')) +
  labs(title = 'Number of Patrons by Day and Meal',
       subtitle = 'Position by Gender',
       x = 'Day',
       y= 'Count')


# now to put it all together with the pipeline
tips %>% 
  filter(smoker == 'Yes') %>% 
  ggplot(aes(x = day,
             fill = sex)) +
  geom_bar(position = 'dodge') +
  facet_wrap(~time) + 
  scale_fill_manual(values = c('deeppink', 'blue')) +
  labs(title = 'Number of Patrons who Smoke by Day and Meal',
       subtitle = 'Position by Gender',
       x = 'Day',
       y = 'Count')

