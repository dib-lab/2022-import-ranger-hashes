#! /usr/bin/env Rscript
x <- readRDS('/group/ctbrowngrp2/tereiter/github/2020-ibd/outputs/optimal_rf_seed/iHMP_optimal_rf_seed1.RDS')
y <- attributes(x$variable.importance)
write.csv(y, 'titus.csv')
