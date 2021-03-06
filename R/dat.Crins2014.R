#' Pediatric liver transplant example data
#'
#' Numbers of cases and events (PTLDs or deaths)
#' in experimental and control groups of six studies.
#'
#' @format A data frame with following columns
#' \describe{
#'   \item{publication}{publication identifier (first author and publication year)}
#'   \item{year}{publication year}
#'   \item{randomized}{randomization status (y/n)}
#'   \item{control.type}{type of control group ("concurrent" or "historical")}
#'   \item{comparison}{type of comparison ("IL-2RA only", "delayed CNI", or "no/low steroids")}
#'   \item{followup}{t	 follow-up time in months}
#'   \item{exp.AR.events}{number of AR events in experimental group}
#'   \item{exp.PTLD.events}{number of PTLD events in experimental group}
#'   \item{exp.deaths}{number of deaths in experimental group}
#'   \item{exp.total}{number of patients in experimental group}
#'   \item{exp.SRR.events}{number of SRR events in experimental group}
#'   \item{cont.AR.events}{number of AR events in control group}
#'   \item{cont.SRR.events}{number of SRR events in control group}
#'   \item{cont.PTLD.events}{number of PTLD events in control group}
#'   \item{cont.deaths}{number of deaths in control group}
#'   \item{cont.total}{number of patients in control group}
#'   \item{r2}{number of AR events in experimental group}
#'   \item{n1}{number of patients in control group}
#'   \item{n2}{number of patients in experimental group}
#'   \item{r1}{number of AR events in control group}
#'  }
#' @source N.D. Crins, C. Roever, A.D. Goralczyk, T. Friede. Interleukin-2
#' receptor antagonists for pediatric liver transplant recipients:
#' A systematic review and meta-analysis of controlled studies. Pediatric
#' Transplantation, 18(8):839-850, 2014.
"dat.Crins2014"
