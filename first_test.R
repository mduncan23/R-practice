2 + 2

my_number <- 2 + 2

my_number * 2
for(i in 0:3) print(i)

################
coffees <- c(2,1,2,3,1,2,0,2,3,1)
coffees * 1.2

adjusted_coffees <- coffees * 1.2


# create dataframe
coffee_data <- data.frame(coffees, adjusted_coffees)
coffee_data

# selecting unadjusted column
coffee_data['coffees']

# finding the min of the dataframe
min(coffee_data)

# first row of data
coffee_data[1,]

# first column of data
coffee_data[1]
# second col 
coffee_data[2]

# get it back as a collection instead of one col of dataframe
coffee_data$coffees

##############
# getting info on functions...
ls("package:base")
base::builtins()
dplyr::if_else

### Create function
convert_f_to_c <- function(farh_number) {
  celc <- (farh_number - 32) / 1.8
  celc
}
convert_f_to_c(76)

### New function
convert_c_to_f <- function(farc_number) {
  farh <- (farc_number * 1.8) + 32
  farh
}
convert_c_to_f(24.4444)

## Trying nested functions
convert_temp <- function(temp, units) {
  if (units == 'c') {
    convert_c_to_f(temp)
  } else if (units == 'f') {
    convert_f_to_c(temp)
  } else {
    stop('Need to input either "c" or "f".')
  }
}

convert_temp(24, 'c')
convert_temp(75.2, 'f')
convert_temp(10, 'k')
