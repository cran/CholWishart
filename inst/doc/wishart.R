## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "##"
)

## ----chol, cache = TRUE--------------------------------------------------
library('CholWishart')
set.seed(20180220)
A <- stats::rWishart(1,10,5*diag(4))[,,1]
set.seed(20180220)
B <- rInvWishart(1,10,.2*diag(4))[,,1]
set.seed(20180220)
C <- rCholWishart(1,10,5*diag(4))[,,1]
set.seed(20180220)
D <- rInvCholWishart(1,10,.2*diag(4))[,,1]

## ----results-------------------------------------------------------------
A %*% B 
crossprod(C) %*% crossprod(D) # note: we do not expect C = D^-1, we expect this! 
crossprod(D) %*% A
crossprod(C) %*% B

