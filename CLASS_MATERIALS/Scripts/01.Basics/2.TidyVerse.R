# First thing you need to do is to set the working directory 
# And load necessary libraries

library(tidyverse)
library(magrittr)


#******************************************************
# PART1 - ESTABLISHING AND POLISHING THE DATA
#******************************************************

# Read in the data and establish allele fequency variables
# Creating allele frequency column for each population

allele_freqs_raw <- read.csv('All_by_locus.csv', header=T, sep=',')
head (allele_freqs_raw)

## Notice that the first four variable ames in the dataset are
# [1] "Chr"                
# [2] "BP"                 
# [3] "Dataset"            
# [4] "Case" 
## The following variables each correspond to an individual stickleback fish from
## one of three populations
# da02_xxx
# mi17_xxx
# mi23_xxx

# Making a 'tibble' which is a tidy table with a little extra in the header
allele_freqs <- tbl_df(allele_freqs_raw)
print (allele_freqs)

# Now we're going to do some calculations with variables using the function 'mutate'

allele_freqs <- mutate(allele_freqs,
      Da02_fw_allele_freq = (rowSums(allele_freqs[,5:54])/(50*2)),
      Mi17_fw_allele_freq = (rowSums(allele_freqs[,55:104])/(50*2)),
      Mi23_fw_allele_freq = (rowSums(allele_freqs[,105:135])/(31*2)),
      Chr_new = as.factor(gsub("scaffold_[0-9]+", "scaffold", Chr))) 

# now let's look at what happened to the *loaded* dataset 'allele_freqs'

head(allele_freqs)

# these two functions might be more useful
names(allele_freqs)
glimpse(allele_freqs)

# what if you wanted to just get a sense of one variable?

head(allele_freqs$Chr_new)
tail(allele_freqs$Chr_new)

# Filtering data to remove scaffolds and only include cases 1-2-3

allele_freqs_filter <- allele_freqs %>%
  filter(Case == 1 | Case == 2 |Case == 3)
  glimpse(allele_freqs_filter)
  
# What if you wanted to write this new filtered dataset to a file?
  
write.csv(allele_freqs_filter, 'allele_freqs_output.csv', row.names = F)

  
#******************************************************
# PART 2 - SUMMARY STATISTICS ON FRESHWATER ALLELE FREQUENCIES IN MARINE POPS
#******************************************************

# Making summary statistics of the allele frequency by population and chromosome
  
# By chromosome
  allele_freq_summary_chr <- 
  allele_freqs_filter %>%
  group_by(allele_freqs_filter$Chr_new) %>%
  summarise_at(c("Da02_fw_allele_freq", "Mi17_fw_allele_freq", "Mi23_fw_allele_freq"), 
               .funs = c(Median = "median", Mean="mean", SD="sd")) %>%
  write.csv('allele_freq_summary_chr.csv', row.names = F)

# By case
allele_freq_summary_case <- 
  allele_freqs_filter %>%
  group_by(allele_freqs_filter$Case) %>%
  summarise_at(c("Da02_fw_allele_freq", "Mi17_fw_allele_freq", "Mi23_fw_allele_freq"), 
               .funs = c(Median = "median", Mean="mean", SD="sd")) %>%
  write.csv('allele_freq_summary_case.csv', row.names = F)

# By FW population
allele_freq_summary_fwpop <- 
  allele_freqs_filter %>%
  group_by(allele_freqs_filter$Dataset) %>%
  summarise_at(c("Da02_fw_allele_freq", "Mi17_fw_allele_freq", "Mi23_fw_allele_freq"), 
               .funs = c(Median = "median", Mean="mean", SD="sd")) %>%
  write.csv('allele_freq_summary_fwpop.csv', row.names = F)


# By FW population and chromosome
allele_freq_summary_chr_and_fwpop <- 
  allele_freqs_filter %>%
  group_by(allele_freqs_filter$Chr_new, allele_freqs_filter$Dataset) %>%
  summarise_at(c("Da02_fw_allele_freq", "Mi17_fw_allele_freq", "Mi23_fw_allele_freq"), 
               .funs = c(Median = "median", Mean="mean", SD="sd")) %>%
  write.csv('allele_freq_summary_chr_and_fwpop.csv', row.names = F)


          
#******************************************************
# PART 3 - SUMMARY STATISTICS PLOTS OF FRESHWATER ALLELE FREQUENCIES IN MARINE POPS
#******************************************************

##Allele frequency statistic plots pooled across marine populations that match statistics table
# All FW datasets - Da02
# All datasets - Mi23
ggplot(data = allele_freqs_filter) + 
  geom_boxplot(mapping = aes(x = Chr_new, y = Mi23_fw_allele_freq)) +
  theme(axis.text.x = element_text(colour="grey20",size=8,angle=90,hjust=.5,vjust=.5,face="plain"),
        axis.text.y = element_text(colour="grey20",size=8,angle=0,hjust=1,vjust=0,face="plain"),  
        axis.title.x = element_text(colour="grey20",size=12,angle=0,hjust=.5,vjust=0,face="plain"),
        axis.title.y = element_text(colour="grey20",size=12,angle=90,hjust=.5,vjust=.5,face="plain")) +
  xlab("Linkage Group and Scaffolds") +
  ylab("Freshwater Allele Frequency") +
  ggtitle("Freshwater Allele Frequencies Across Linkage Groups") +
  ggsave("Mi23_AF_Boxplots_All_FW_pop_datasets.pdf", width = 6, height = 8, units = "in")

# Split by datasets
# All datasets - Mi23
ggplot(data = allele_freqs_filter) + 
  geom_boxplot(mapping = aes(x = Chr_new, y = Mi23_fw_allele_freq)) +
  theme(axis.text.x = element_text(colour="grey20",size=8,angle=90,hjust=.5,vjust=.5,face="plain"),
        axis.text.y = element_text(colour="grey20",size=8,angle=0,hjust=1,vjust=0,face="plain"),  
        axis.title.x = element_text(colour="grey20",size=12,angle=0,hjust=.5,vjust=0,face="plain"),
        axis.title.y = element_text(colour="grey20",size=12,angle=90,hjust=.5,vjust=.5,face="plain")) +
  facet_wrap(~Dataset, nrow = 3) +
  xlab("Linkage Group and Scaffolds") +
  ylab("Freshwater Allele Frequency") +
  ggtitle("Freshwater Allele Frequencies Across Linkage Groups") +
  ggsave("Mi23_AF_Boxplots_Split_by_FW_pop_datasets.pdf", width = 6, height = 8, units = "in")



