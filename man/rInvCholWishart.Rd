% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wishart.R
\name{rInvCholWishart}
\alias{rInvCholWishart}
\title{Cholesky Factor of Random Inverse Wishart Distributed Matrices}
\usage{
rInvCholWishart(n, df, Sigma)
}
\arguments{
\item{n}{integer sample size.}

\item{df}{numeric parameter, "degrees of freedom".}

\item{Sigma}{positive definite \eqn{p \times p}{(p * p)} "scale" matrix, the matrix parameter of
the distribution.}
}
\value{
a numeric array, say \code{R}, of dimension \eqn{p \times p \times n}{p * p * n},
where each \code{R[,,i]} is a Cholesky decomposition of a realization of the Wishart distribution
\eqn{W_p(Sigma, df)}. Based on a modification of the existing code for the \code{rWishart} function
}
\description{
Generate n random matrices, distributed according
   to the Cholesky factor of an inverse Wishart distribution with
   parameters \code{Sigma} and \code{df}, \eqn{W_p(Sigma, df)}.

   Note there are different ways of parameterizing the Inverse
   Wishart distribution, so check which one you need.
    Here, if \eqn{X \sim IW_p(\Sigma, \nu)}{X ~ IW_p(Sigma, df)} then
    \eqn{X^{-1} \sim W_p(\Sigma^{-1}, \nu)}{X^{-1} ~ W_p(Sigma^{-1}, df)}.
    Dawid (1981) has a different definition: if
    \eqn{X \sim W_p(\Sigma^{-1}, \nu)}{X ~ W_p(Sigma^{-1}, df)} and
    \eqn{\nu > p - 1}{df > p - 1}, then
    \eqn{X^{-1} = Y \sim IW(\Sigma, \delta)}{X^{-1} = Y ~ IW(Sigma, delta)}, where
    \eqn{\delta = \nu - p + 1}{delta = df - p + 1}.
}
\examples{
# How it is parameterized:
set.seed(20180211)
A <- rCholWishart(1L, 10, 3*diag(5L))[,,1]
A
set.seed(20180211)
B <- rInvCholWishart(1L, 10, 1/3*diag(5L))[,,1]
B
crossprod(A) \%*\% crossprod(B)

set.seed(20180211)
C <- chol(stats::rWishart(1L, 10, 3*diag(5L))[,,1])
C
}
\references{
Anderson, T. W. (2003). \emph{An Introduction to Multivariate Statistical Analysis} (3rd ed.).
Hoboken, N. J.: Wiley Interscience.

Dawid, A. (1981). Some Matrix-Variate Distribution Theory: Notational Considerations and a
Bayesian Application. \emph{Biometrika}, 68(1), 265-274. \doi{10.2307/2335827}

Gupta, A. K.  and D. K. Nagar (1999). \emph{Matrix variate distributions}. Chapman and Hall.

Mardia, K. V., J. T. Kent, and J. M. Bibby (1979) \emph{Multivariate Analysis},
London: Academic Press.
}
\seealso{
\code{\link{rWishart}} and \code{\link{rCholWishart}}
}
