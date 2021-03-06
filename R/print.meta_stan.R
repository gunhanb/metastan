#' Print meta_stan object
#'
#' Takes an \code{meta_stan} object which is obtained by function \code{meta_stan} and print
#' the model and data information such as model type used in the model.
#'
#'
#' @param x A \code{meta_stan} object.
#' @param digits An integer indicating the number of decimal places.
#' @param ... Further arguments passed to or from other methods.
#' @return The return value is invisible \code{NULL}
#' @export
print.meta_stan <- function(x, digits = 2, ...) {
  if (!is.element("meta_stan", class(x)))
    stop("Argument 'x' must be an object of class \"meta_stan\".")
  cat("Meta-analysis using MetaStan \n\n")
  cat("Maximum Rhat:", signif(x$Rhat.max, digits=3),"\n")
  cat("Minimum Effective Sample Size:", signif(x$N_EFF.min, digits=digits),"\n\n")

  cat("mu prior: Normal")
  cat("(")
  cat(x$stanDat$mu_prior[1])
  cat(",")
  cat(x$stanDat$mu_prior[2])
  cat(")")
  cat("\n")
  cat("theta prior: Normal")
  cat("(")
  cat(x$stanDat$theta_prior[1])
  cat(",")
  cat(round(x$stanDat$theta_prior[2], 2))
  cat(")")
  cat("\n")

  if (x$stanDat$mreg){
    cat("beta prior: Normal")
    cat("(")
    cat(x$stanDat$beta_prior[1])
    cat(",")
    cat(x$stanDat$beta_prior[2])
    cat(")")
    cat("\n")
  }
  if (x$stanDat$re){
    cat("tau prior:")
    cat(x$tau_prior_dist)
    cat("(")
    cat(x$stanDat$tau_prior)
    cat(")")
    cat("\n\n")
  }

  cat("Treatment effect (theta) estimates\n")
  print(round(x$fit_sum['theta', -c(2, 3, 5, 7, 9, 10)], digits))
  cat("\n")

  if (x$stanDat$mreg){
    cat("Beta coeffients\n")
    print(round(x$fit_sum['beta[1,1]', -c(2, 3, 5, 7, 9, 10)], digits))
    cat("\n")
  }

  if (x$stanDat$re){
    cat("Heterogeneity stdev (tau)\n")
    if (x$interval.type == "shortest"){
      mcmc = coda::mcmc.list(rstan::As.mcmc.list(x$fit, pars = c("tau[1]")))
      tau_int = HDInterval::hdi(mcmc, credMass = 0.95)
      temp = matrix(round(c(x$fit_sum['tau[1]', 1], tau_int[1],
                            x$fit_sum['tau[1]', "50%"], tau_int[2]), digits), ncol = 4)
      colnames(temp) = c("Mean", "Lower", "50%", "Upper")
      print(temp)

    } else {

      print(round(x$fit_sum['tau[1]', -c(2, 3, 5, 7, 9, 10)], digits))

    }
  }


  return(invisible())
}
