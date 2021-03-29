# Model from SARP-reruns ... admixture mapping
# log(max_Reversibility.beth.) ~ Age_Enroll + sex + center + height_cm + Baseline_preDrug_FEV1..mL. + RFMIX_genome-wide_African_ancestry

runLaaaModelSummary <- function(model.data.frame) {
  # return (summary(lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.data.frame)))
  # tidyr's drop_na is cleaner than this but tidyr is not in the Docker image.
  model.data.frame <- dplyr::filter(model.data.frame, ! is.na(max_fev1_reversal) & ! is.na(base_FEV1))
  return (summary(lm(log(max_fev1_reversal + 1) ~ age + sex + center + height_cm + base_FEV1 + allele_dose + afr_dose + allele_afr_dose, data=model.data.frame)))
}

runNullModel <- function(model.data.frame) {
  # return (lm(Y ~ covariates, data=model.data.frame))
  model.data.frame <- dplyr::filter(model.data.frame, ! is.na(max_fev1_reversal) & ! is.na(base_FEV1))
  return (lm(log(max_fev1_reversal + 1) ~ age + sex + center + height_cm + base_FEV1, data=model.data.frame))
}

runLaaaModel <- function(model.data.frame) {
  # return (lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.data.frame))
  model.data.frame <- dplyr::filter(model.data.frame, ! is.na(max_fev1_reversal) & ! is.na(base_FEV1))
  return (lm(log(max_fev1_reversal + 1) ~ age + sex + center + height_cm + base_FEV1 + allele_dose + afr_dose + allele_afr_dose, data=model.data.frame))
}

runAlleleModelSummary <- function(model.data.frame) {
  # return (summary(lm(Y ~ covariates + allele_dose, data=model.data.frame)))
  model.data.frame <- dplyr::filter(model.data.frame, ! is.na(max_fev1_reversal) & ! is.na(base_FEV1))
  return (summary(lm(log(max_fev1_reversal + 1) ~ age + sex + center + height_cm + base_FEV1 + allele_dose, data=model.data.frame)))
}