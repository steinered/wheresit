# input staff schedule/staff list per day of week
twodaysched <- replicate(28, sample(1:5, 2, replace = FALSE))
onedaysched <- replicate(10, sample (1:5, 1))

# abandon ship

stafflist <- c()