# For each day of the week, staff members planning to come in on that day rank each available desk (all 30, unless there are only x number of people coming in, in which case they only need to rank the top x desks). 
library(matchingR)
library(Rcpp)

# Monday - Assume 12 staff come in
# Import preferences (or create a random matrix, in this instance)
monpref <- matrix(replicate(12, 
  sample(1:30, 12)), ncol = 12)

# Next, we'd try to run "assignments <- toptrading(pref = monpref)"
# But, if there are fewer than 30 people coming in, the toptrading() function will need to be modified as it assumes n desks = n staff
# So, we create a function!

desk_fx <- function(pref){
# create an output seating assignment list
  assignments <- matrix(nrow = ncol(pref), #number of cols in "pref" input is equal to the                                               number of staff/desks which need to be assigned
                        ncol = 1)
  
  # now let's fill in this matrix
  # for each staff member = for each column
  for(staff in 1:ncol(pref)) {
    # pull their list of preferences
    staffpref <- pref[ , staff]
    
    # next, we loop through their preferences
    # for each desk...
    for (desk in 1:length(staffpref)) {
      # if the desk has already been taken (is in assignment matrix), go to the next one
      if (staffpref[desk] %in% assignments[]) {next}
      # otherwise, if it's free, put it in the matrix!
      else {assignments[staff] <- staffpref[desk]
      break
      }
    }
  }
print(assignments)
} 

mon_assign <- desk_fx(monpref)

# Tuesday - Assume 24 come in
tuepref <- matrix(replicate(24, 
                            sample(1:30, 24)), ncol = 24)
tue_assign <- desk_fx(tuepref)

# Wednesday - Assume 24 come in
wedpref <- matrix(replicate(24, 
                            sample(1:30, 24)), ncol = 24)
wed_assign <- desk_fx(wedpref)

# Thursday - Assume 12 come in
thurpref <- matrix(replicate(12, 
                            sample(1:30, 12)), ncol = 12)
thur_assign <- desk_fx(thurpref)

# Friday - Assume 4 come in
fripref <- matrix(replicate(4, 
                            sample(1:30, 4)), ncol = 4)
fri_assign <- desk_fx(fripref)

# The problem with this option: Doing each day's assignment independently may result in people having to change desks from day to day. Some folks may prefer having the same desk every day over having a certain desk.
# Also, I don't know if this is necessarily maximumally efficient/stable.