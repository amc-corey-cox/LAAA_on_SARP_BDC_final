############
# Functions
############

getCombinedBeta <- function(betas, std.errs) {
  weights <- 1/((std.errs)^2)
  beta <- (sum(betas*weights))/(sum(weights))
  return (beta)
}

getCombinedStdErr <- function(std.errs) {
  weights <- 1/((std.errs)^2)
  se <- sqrt(1/(sum(weights)))
  return (se)
}

getP <- function(beta, se) {
  return ( formatC((1-pnorm(abs(beta/se)))*2, 3, format="f" ))
}

getORStr <- function(beta, se) {
  return ( paste0(formatC(beta, 3, format="f"), 
                  " [", formatC(beta-1.96*se, 3, format="f"), 
                  "-", formatC(beta+1.96*se, 3, format="f"), "]") )
}

###############
# Run analysis
###############

# EASI additive
wgs.beta <- 0.007
wgs.se <- (0.06-(-0.05))/(1.96*2)
mega.beta <- 0.066
mega.se <- (0.12-0.012)/(1.96*2)
meta.beta <- getCombinedBeta(c(wgs.beta, mega.beta), c(wgs.se, mega.se))
meta.se <- getCombinedStdErr(c(wgs.se, mega.se))
print(getORStr(meta.beta, meta.se))
print(getP(meta.beta, meta.se))

# EASI dominant
wgs.beta <- 0.014
wgs.se <- (0.08-(-0.05))/(1.96*2)
mega.beta <- 0.067
mega.se <- (0.13-0.003)/(1.96*2)
meta.beta <- getCombinedBeta(c(wgs.beta, mega.beta), c(wgs.se, mega.se))
meta.se <- getCombinedStdErr(c(wgs.se, mega.se))
print(getORStr(meta.beta, meta.se))
print(getP(meta.beta, meta.se))

# EASI recessive
wgs.beta <- -0.018
wgs.se <- (0.13-(-0.17))/(1.96*2)
mega.beta <- 0.143
mega.se <- (0.29-(-0.005))/(1.96*2)
meta.beta <- getCombinedBeta(c(wgs.beta, mega.beta), c(wgs.se, mega.se))
meta.se <- getCombinedStdErr(c(wgs.se, mega.se))
print(getORStr(meta.beta, meta.se))
print(getP(meta.beta, meta.se))

# RL additive
wgs.beta <- 0.203
wgs.se <- (0.76-(-0.36))/(1.96*2)
mega.beta <- 0.748
mega.se <- (1.32-0.17)/(1.96*2)
meta.beta <- getCombinedBeta(c(wgs.beta, mega.beta), c(wgs.se, mega.se))
meta.se <- getCombinedStdErr(c(wgs.se, mega.se))
print(getORStr(meta.beta, meta.se))
print(getP(meta.beta, meta.se))

# RL dominant
wgs.beta <- 0.235
wgs.se <- (0.91-(-0.44))/(1.96*2)
mega.beta <- 0.798
mega.se <- (1.48-0.11)/(1.96*2)
meta.beta <- getCombinedBeta(c(wgs.beta, mega.beta), c(wgs.se, mega.se))
meta.se <- getCombinedStdErr(c(wgs.se, mega.se))
print(getORStr(meta.beta, meta.se))
print(getP(meta.beta, meta.se))

# RL recessive
wgs.beta <- 0.305
wgs.se <- (1.84-(-1.23))/(1.96*2)
mega.beta <- 1.418
mega.se <- (2.99-(-0.15))/(1.96*2)
meta.beta <- getCombinedBeta(c(wgs.beta, mega.beta), c(wgs.se, mega.se))
meta.se <- getCombinedStdErr(c(wgs.se, mega.se))
print(getORStr(meta.beta, meta.se))
print(getP(meta.beta, meta.se))


