% Generated by roxygen2 (4.0.2): do not edit by hand
\docType{methods}
\name{tail}
\alias{tail}
\alias{tail,Basis-method}
\alias{tail,block-method}
\title{Return tail object data frame}
\usage{
tail(x, ...)

\S4method{tail}{block}(x, ...)

\S4method{tail}{Basis}(x, ...)
}
\arguments{
\item{x}{an MVST object}

\item{...}{other parameters passed to \code{base::tail}}
}
\description{
Short for \code{tail(getDf())}. Returns the tail of the object data frame which contains most information on the object, see \code{getDf} for details.
}
\examples{
data(icesat)
icesat_obs <- Obs(df=icesat)
tail(icesat_obs,n=10)
}

