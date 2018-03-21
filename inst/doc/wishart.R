## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "##"
)

## ----results-------------------------------------------------------------
A %*% B 
crossprod(C) %*% crossprod(D) # note: we do not expect C = D^-1, we expect this! 
crossprod(D) %*% A
crossprod(C) %*% B

## ----density-------------------------------------------------------------
library('CholWishart')
dWishart(diag(3), df = 5, 5*diag(3))

dInvWishart(diag(3), df = 5, .2*diag(3))


## ----threedensities------------------------------------------------------
set.seed(20180311)
A <- rWishart(n = 3, df = 3, Sigma = diag(3))
dWishart(A, df = 3, Sigma = diag(3))


## ----lmvgamma------------------------------------------------------------
lmvgamma(1:4,1) # note how they agree when p = 1
lgamma(1:4)

