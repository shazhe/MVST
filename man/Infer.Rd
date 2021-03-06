% Generated by roxygen2 (4.0.2): do not edit by hand
\docType{methods}
\name{Infer}
\alias{Infer}
\alias{Infer,Graph_2nodes-method}
\title{Infer}
\usage{
Infer(Graph, ...)

\S4method{Infer}{Graph_2nodes}(Graph, SW = 0, Comb = NULL)
}
\arguments{
\item{Graph}{object of class \code{Graph_2nodes}.}

\item{SW}{if 1, the Shermany Woodbury is used for inference over linear combinations, see vignette for details. This option cannot be
set if linear combinations are not specified.}

\item{Comb}{an \code{m} \eqn{\times} \code{n} matrix where each row is a binary vector indicating which of the \code{n} states constitute the linear combination.}
}
\value{
List with fields \code{Graph} (the original graph) and \code{Post_GMRF}. The latter is an object of class \code{GMRF} with mean and precision
given by the update. If a set of linear combinations is desired, then the list also contains a field \code{Comb_results}, a list with entries \code{mu}
and \code{cov}, the mean and covariance over the linear combinations respectively.
}
\description{
Infer is a generic function which carries out inference for a given model. For now only a pure Gaussian model is considered; however
one has various options with which to carry out the Gaussian update in order to maximise use of resources, for example on linear combinations of
the state-space rather than the whole space/
}
\examples{
\dontrun{
require(Matrix)
data(icesat)
data(surf_fe)

## First create observation object
icesat_obs <- Obs(df=icesat,
                 abs_lim = 5,
                 avr_method = "median",
                 box_size=100,
                 name="icesat")

## Now create GMRF defined over some FE basis
Mesh <- initFEbasis(p=surf_fe$p,
                    t=surf_fe$t,
                    M=surf_fe$M,
                    K=surf_fe$K)

mu <- matrix(0,nrow(Mesh),1)
Q <- sparseMatrix(i=1:nrow(surf_fe$p), j = 1:nrow(surf_fe$p), x = 1)

my_GMRF <- GMRF(mu = mu, Q = Q,name="SURF",t_axis = 0:6)
SURF <-GMRF_basis(G = my_GMRF, Basis = Mesh)

L1 <- link(SURF,icesat_obs)
e <- link_list(list(L1))
v <- block_list(list(O = icesat_obs, G = SURF))
G <- new("Graph",e=e,v=v)
G_reduced <- compress(G)
Results <- Infer(G_reduced)
}
}
\keyword{Gaussian}
\keyword{Graph,}
\keyword{inference,}
\keyword{update}

