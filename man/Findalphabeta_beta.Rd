% Generated by roxygen2 (4.0.2): do not edit by hand
\name{Findalphabeta_beta}
\alias{Findalphabeta_beta}
\title{Quantile difference when tuning Beta distribution hyper-parameters}
\usage{
Findalphabeta_beta(pars, p95)
}
\arguments{
\item{pars}{the two shape parameters of the Beta distribution}

\item{p95}{the desired 95 percentile}
}
\value{
A numeric which is a measure of the discrepancy between the desired and real 95 percentile.
}
\description{
This function returns the normalised difference between specified and required 95 percentiles of the Beta distribution. This function can then be passed to an optimisation routine to find required parameter values.
}
\examples{
require(actuar)
initpars <- c(2,6)
hyp  = optim(par=c(2,6),Findalphabeta_beta, p95=0.12)
hyp_shape1 <- hyp$par[1]
hyp_shape2 <- hyp$par[2]
# Now simulate from a Beta with these parameters and verify quantiles
X <- rbeta(shape1 = hyp_shape1, shape2 = hyp_shape2,n=10000)
print(quantile(X,0.95))
}
\keyword{Beta}
\keyword{distribution,}
\keyword{elicitation}
\keyword{prior}

