# read in the excel file
library(readxl)

file_path <- '~/Projects/Jay/Copy of Female Size-comparisons 2012 raw data (1).xlsx'
data_df <- read_excel(file_path, range='B8:E180', sheet="female length")
names(data_df) <- c('SR', 'DM', 'LSA', 'CP')

# melt to long format 
library(reshape2)
data_long_df = na.omit(melt(data_df))

# boxplot
library(ggplot2)
p <- ggplot(data_long_df, aes(x=variable, y=value)) + 
#   geom_violin(scale='count')
  geom_violin()
p + geom_boxplot(width=0.1)
