# Model from SARP-reruns ... admixture mapping
# log(max_Reversibility.beth.) ~ Age_Enroll + sex + center + height_cm + Baseline_preDrug_FEV1..mL. + RFMIX_genome-wide_African_ancestry

runLaaaModelSummary <- function(model.frame) {
  # return (summary(lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.frame)))
  return (summary(lm(log(max_fev1_reversal) ~ age + sex + center + height_cm + base_FEV1 + allele_dose + afr_dose + allele_afr_dose, data=model.frame)))
}

runNullModel <- function(model.frame) {
  # return (lm(Y ~ covariates, data=model.frame))
  return (lm(log(max_fev1_reversal) ~ age + sex + center + height_cm + base_FEV1, data=model.frame))
}

runLaaaModel <- function(model.frame) {
  # return (lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.frame))
  return (lm(log(max_fev1_reversal) ~ age + sex + center + height_cm + base_FEV1 + allele_dose + afr_dose + allele_afr_dose, data=model.frame))
}

runAlleleModelSummary <- function(model.frame) {
  # return (summary(lm(Y ~ covariates + allele_dose, data=model.frame)))
  return (summary(lm(log(max_fev1_reversal) ~ age + sex + center + height_cm + base_FEV1 + allele_dose, data=model.frame)))
}