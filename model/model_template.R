runLaaaModelSummary <- function(model.frame) {
  return (summary(lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.frame)))
}

runNullModel <- function(model.frame) {
  return (lm(Y ~ covariates, data=model.frame))
}

runLaaaModel <- function(model.frame) {
  return (lm(Y ~ covariates + allele_dose + afr_dose + allele_afr_dose, data=model.frame))
}

runAlleleModelSummary <- function(model.frame) {
  return (summary(lm(Y ~ covariates + allele_dose, data=model.frame)))
}