# begin by establishing the "cost" of each desk assignment
# in real life, we would use preferences/priorities to determine "costs"
# but for now, we'll use random matrices

library(lpSolve)

staff_pref <- matrix(replicate(38, #for all 38 staff members
                               sample(1:9)), ncol = 9 #est. "cost" of desk section
)

lp.assign(staff_pref)
