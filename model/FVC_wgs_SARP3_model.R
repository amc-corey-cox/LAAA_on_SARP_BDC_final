# Model from SARP-reruns ... admixture mapping
# Baseline_preDrug_FVC_mL ~ Age_Enroll + sex + group + center + height_cm + BMI + RFMIX_genome-wide_African_ancestry
# center is NA for SARP3

runLaaaModelSummary <- function(model.frame) {
  # return (summary(lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.frame)))
  return (summary(lm(FVC ~ age + sex + height_cm + BMI + allele_dose + afr_dose + allele_afr_dose, data=model.frame)))
}

runNullModel <- function(model.frame) {
  # return (lm(Y ~ covariates, data=model.frame))
  return (lm(FVC ~ age + sex + height_cm + BMI, data=model.frame))
}

runLaaaModel <- function(model.frame) {
  # return (lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.frame))
  return (lm(FVC ~ age + sex + height_cm + BMI + allele_dose + afr_dose + allele_afr_dose, data=model.frame))
}

runAlleleModelSummary <- function(model.frame) {
  # return (summary(lm(Y ~ covariates + allele_dose, data=model.frame)))
  return (summary(lm(FVC ~ age + sex + height_cm + BMI + allele_dose, data=model.frame)))
}