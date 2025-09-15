install.packages("gtsummary")

library(tidyverse)
library(gtsummary)

trial
d<-trial %>% 
  select(trt, age,grade,response)


# 1. Summarise data 
tbl_summary(d,by=trt)


d %>% 
  tbl_strata(
    strata=grade,
    ~.x %>%  
      tbl_summary())


#2. summarise 
d %>% 
  tbl_strata(
    strata=grade,
    ~.x %>%  
      tbl_summary(by=trt))

#3. summarise statical test
d %>% 
  tbl_summary(by = trt) %>% 
  add_p() %>%  #add p value to the table 
  add_q() %>%  #add q value to the table
  add_overall() %>% #add overall value to the table
  add_n() %>% #add N value to the table
  add_ci() %>% #add Confidence value to the table
  add_stat_label(
    label = all_continuous() ~ "Median (IQR)")


#3. summarise statical test andd adds difference functions
fancy_table<-  d %>% 
  tbl_summary(by = trt) %>% 
  add_difference() %>%  #add p value to the table 
  add_q() %>%  #add q value to the table
  add_overall() %>% #add overall value to the table
  add_n() %>% #add N value to the table
  add_ci() %>% #add Confidence value to the table
  add_stat_label(
    label = all_continuous() ~ "Median (IQR)")




#3. summarise statical test andd adds difference functionsd %>% 
tbl_summary(
    by = trt,                                # stratify by treatment
    statistic = age ~ "{mean} {sd}",          # summarize age with mean and sd
    label = grade ~ "New Name - Tumor Grade", # relabel grade variable
    digits = all_continuous() ~ 1,            # 1 decimal for continuous
    #missing = "no",                          # missing handling (commented out)
    missing_text = "Missing Values",          # how missing is displayed
    type = list(
      response ~ "categorical",               # response shown as categorical
      death ~ "categorical"                   # death shown as categorical
    ),
    sort = everything() ~ "frequency",        # sort categorical by frequency
    percent = "cell",                         # % calculated within cell
    include = -ttdeath                        # exclude ttdeath from summary
  ) %>% 
  add_p(pvalue_fun = ~ style_pvalue(.x, digits = 3))  # add p-values, formatted

  
install.packages("flextable")  
library(flextable)
fancy_table %>% 
  as_flex_table() %>% 
  save_as_image(path="fancy_table.png")


fancy_table %>% 
  as_flex_table() %>% 
  save_as_docx(path="fancy_table.docx")
