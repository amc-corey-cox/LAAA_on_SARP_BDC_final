library(tidyverse)
library(readxl)

# old_phenos <- "~/Documents/Ortega/input_admixture_mapping/May_1_2020_S12CSGA.txt" %>% read_tsv() %>% select(-starts_with("X"))
raw_phenos <- "~/Documents/Ortega/input_admixture_mapping/Complete SARP CSGA 3-4-21 cut.xlsx" %>% read_excel()

# local.anc.tfile <- "/home/corey/Documents/Ortega/input_admixture_mapping/anc.tfam"

phenos <- raw_phenos %>%
  select(`ID SARP1-2 preferred`, `analysis_set (sarp1-2/csga = 1, SARP3 = 2)`, SARP_CSGA_genetics1_FID, TopMed_ID, `Study group`,
         SITE, `Clinical Center`, `ALL COHORT Based on COMBINED Analysis`, `ASTHMA (2=yes, 1 = no)`, `RACE ( AA=1,CC=2,HS=3,Oth=4)`,
         `SARP ethnic group`, SEX, `AGE>=12`, `AGE (csga-SARP12 default. Yellow SARP3)`, `HT (csga-SARP12 default. Yellow SARP3)`,
         `BMI(csga-SARP12 default. Yellow SARP3)`, `ALL bFEV1`, `ALL bFVC`, `FEV1-FVC ratio (SARP3/yellow derived)`, `ALL MaxFEV1`,
         `ALL MaxFVC`, `ALL MaxRatio`, `ALL MaxREV...137`, `ALL pdifffev1 (SARP1-2 CSGA only)`, `ALL MaxREV...243`, `puffs to max`) %>%
  mutate(group = `Study group`,
         Clinical.Center = `Clinical Center`,
         ASTHMA..2.yes..1...no. = `ASTHMA (2=yes, 1 = no)`,
         sarp12_csga_age = `AGE (csga-SARP12 default. Yellow SARP3)`,
         sarp12_csga_HTcm = `HT (csga-SARP12 default. Yellow SARP3)`,
         sarp12_csga_bmi = `BMI(csga-SARP12 default. Yellow SARP3)`,
         Percent.difference.in.FEV1.after.2.puffs.albuterol..q.17g...Spir = `ALL pdifffev1 (SARP1-2 CSGA only)`,
         sarp12_csga_bFEV1 = `ALL bFEV1`,
         sarp12_csga_bFVC = `ALL bFVC`,
         Maximum.FEV1..liters..Spirometry...maxBD = `ALL MaxFEV1`,
         Maximum.FVC..liters..Spirometry...maxBD = `ALL MaxFVC`,
         maxREVbeth = `ALL MaxREV...137`,
         puffs.to.max = `puffs to max`) %>%
  mutate(id = `ID SARP1-2 preferred`,
         center = `Clinical Center`,
         asthma = `ASTHMA (2=yes, 1 = no)`,
         height = `HT (csga-SARP12 default. Yellow SARP3)`,
         bmi = `BMI(csga-SARP12 default. Yellow SARP3)`,
         `2_puffs_albuterol_FEV1_percBD` = `ALL pdifffev1 (SARP1-2 CSGA only)`, # Ask Victor
         FEV1 = `ALL bFEV1`,
         FVC = `ALL bFVC`,
         FEV1_FVC_ratio = `FEV1-FVC ratio (SARP3/yellow derived)`,
         maxFEV1 = `ALL MaxFEV1`,
         maxFVC = `ALL MaxFVC`,
         maxFEV1_reversal = `ALL MaxREV...137`)

# phenos %>% filter(`ALL MaxREV...137` != `ALL MaxREV...243`) ## `ALL MaxREV` in two location, both are equal.

phenos%>% write_tsv("~/Documents/Ortega/input_admixture_mapping/Complete_SARP_CSGA_3-4-21_cut.adjusted.20200308.tsv")
