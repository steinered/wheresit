# The first 30 staff members rank each available desk (yep, all 30).
library(matchingR)

## Creating a matrix of random selection to simulate, although it's possible in real life that preferences would congregate around specific areas/features
deskpref <- matrix(
  replicate(30,
            sample(1:30)), 
  ncol = 30)

# Using the "toptrading()" function from the matchingR package, assign those 30 members a desk.

assignments <- toptrading(pref = deskpref)

# bonus, check stability
toptrading.checkStability(pref = deskpref, matching = assignments)

# The subsequent 8 staff members can then fill in wherever there is availability (as earlier staff reveal which days they don't intend to be in office).
 
# The problem with this option: Some of the initial 30 staff members may prefer to share a desk over getting their own desk, if the shared desk better aligns with their preferences. Overall, this option does not consider days in office.
