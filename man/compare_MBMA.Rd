% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compare_MBMA.R
\name{compare_MBMA}
\alias{compare_MBMA}
\title{Compare MBMA fits using LOO-IC}
\usage{
compare_MBMA(model_list, digits = 2, ...)
}
\arguments{
\item{model_list}{A vector of \code{MBMA_stan} object.}

\item{digits}{An integer indicating the number of decimal places.}

\item{...}{Further arguments passed to or from other methods.}
}
\description{
Takes a vector of \code{MBMA_stan} fits and give
the model comparison results based on LOO-IC criteria. This
is useful to compare different dose-response models. The function
depends on \code{loo_compare} function from \code{loo} package.
}
\references{
Vehtari, A, A Gelman, and J Gabry (Sept. 2017).
"Practical Bayesian model evaluation using leave one-out
cross-validation and WAIC." In: Statistics and Computing 27.5, pp. 1413–1432.
}
\seealso{
\code{loo::loo_compare}
}
