#commit 3 added comments to script1.R
# call this script from the command line with the following syntax:
# R --no-save < script1.R --args seed=23978 out=out1.pdf
# If arguments are not given, the default behavior is:
# seed - if not supplied, a new seed will be created using the current time and the process ID
# out - if not supplied the pdf generated will be saved to the file out1.pdf

library(tidyverse)
library(cowplot)
#commit 1 allow for change of name
# get arguments
tmp <- commandArgs(TRUE)
# make a named list of arguments
lst <- strsplit(tmp, '=', fixed = TRUE) %>%
  lapply(`[`, 2)
names(lst) <- strsplit(tmp, '=', fixed = TRUE) %>%
  sapply(`[`, 1)
# fill in defaults if not given
if(is.null(lst$out))
  lst$out <- 'out1.pdf'
#commit 2 allow for change of seed
if(!is.null(lst$seed))
  set.seed(as.numeric(lst$seed))
set.seed(297834) # pick your own seed
dat <-  data_frame(pred = rnorm(100), resp = pred + rnorm(100))
ggplot(dat, aes(pred, resp)) +
  geom_point() 
pdf(lst$out)
dev.off()

