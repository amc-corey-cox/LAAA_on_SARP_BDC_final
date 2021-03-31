# Model from SARP-reruns ... admixture mapping
# maxFVC..ml. ~ Age_Enroll + sex + center + height_cm + BMI + RFMIX_genome-wide_African_ancestry

runLaaaModelSummary <- function(model.frame) {
  # return (summary(lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.frame)))
  return (summary(lm(maxFVC ~ age + sex + center + height_cm + BMI + allele_dose + afr_dose + allele_afr_dose, data=model.frame)))
}

runNullModel <- function(model.frame) {
  # return (lm(Y ~ covariates, data=model.frame))
  return (lm(maxFVC ~ age + sex + center + height_cm + BMI, data=model.frame))
}

runLaaaModel <- function(model.frame) {
  # return (lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.frame))
  return (lm(maxFVC ~ age + sex + center + height_cm + BMI + allele_dose + afr_dose + allele_afr_dose, data=model.frame))
}

runAlleleModelSummary <- function(model.frame) {
  # return (summary(lm(Y ~ covariates + allele_dose, data=model.frame)))
  return (summary(lm(maxFVC ~ age + sex + center + height_cm + BMI + allele_dose, data=model.frame)))
}