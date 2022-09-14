#! /usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
  stop("At least two arguments must be supplied - RDS file and output CSV", call.=FALSE)
}
      
# e.g. '/group/ctbrowngrp2/tereiter/github/2020-ibd/outputs/optimal_rf_seed/iHMP_optimal_rf_seed1.RDS')

model <- readRDS(args[1])

hashes <- attributes(model$variable.importance)
write.csv(hashes, args[2])
