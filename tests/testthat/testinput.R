
context("Testing input integrity")


test_that("trying wrong type of input", {


  expect_error(rCholWishart(1, df = 5, Sigma = "A"))
  expect_error(rCholWishart(1, df = "A", Sigma = diag(5)))
  expect_error(rCholWishart("A", df = 5, Sigma = diag(5)))
  expect_error(rCholWishart(.4, df = 5, Sigma = diag(5)))

  expect_error(rInvCholWishart(1, df = 5, Sigma = "A"))
  expect_error(rInvCholWishart(1, df = "A", Sigma = diag(5)))
  expect_error(rInvCholWishart("A", df = 4, Sigma = diag(5)))
  expect_error(rInvCholWishart(.4, df = 4, Sigma = diag(5)))

  expect_error(rInvWishart(1, df = 5, Sigma = "A"))
  expect_error(rInvWishart(1, df = "A", Sigma = diag(5)))
  expect_error(rInvWishart("A", df = 4, Sigma = diag(5)))
  expect_error(rInvWishart(.4, df = 4, Sigma = diag(5)))

  expect_error(dInvWishart(1, df = 5, Sigma = "A"))
  expect_error(dInvWishart(1, df = "A", Sigma = diag(5)))
  expect_error(dInvWishart("A", df = 4, Sigma = diag(5)))
  expect_error(dInvWishart(.4, df = 4, Sigma = diag(5)))

  expect_error(dWishart(1, df = 5, Sigma = "A"))
  expect_error(dWishart(1, df = "A", Sigma = diag(5)))
  expect_error(dWishart("A", df = 4, Sigma = diag(5)))
  expect_error(dWishart(.4, df = 4, Sigma = diag(5)))

  expect_error(dInvWishart(matrix(1,nrow=3, ncol=4), df = 10,
                           Sigma = matrix(c(1,0,0,0,1,0,0,0,1,1,1,1),nrow=3)),
               "conformable")
  expect_error(dWishart(matrix(1,nrow=3, ncol=4), df = 10,
                           Sigma = matrix(c(1,0,0,0,1,0,0,0,1,1,1,1),nrow=3)),
               "conformable")

  expect_error(dInvWishart(matrix(1,nrow=3, ncol=3), df = 10,
                           Sigma = matrix(c(1,0,0,0,1,0,0,0,1,1,1,1),nrow=3)))
  expect_error(dWishart(matrix(1,nrow=3, ncol=3), df = 10,
                        Sigma = matrix(c(1,0,0,0,1,0,0,0,1,1,1,1),nrow=3)))

  sigma = diag(3)
  sigma[3,1] <- 1
  expect_error(dInvWishart(diag(3), df = 10, Sigma = sigma))
  expect_error(dWishart(diag(3), df = 10, Sigma = sigma))

  expect_error(dInvWishart(sigma, df = 10, Sigma = diag(3)),
               "symmetric")
  expect_error(dWishart(sigma, df = 10, Sigma = diag(3)),
               "symmetric")

  expect_error(rCholWishart(1, 10, matrix(c(3, 1, 1, 1, 1, 3), nrow = 2)),
               "square")
  expect_error(rInvCholWishart(1, 10, matrix(c(3, 1, 1, 1, 1, 3), nrow = 2)),
               "square")

  expect_error(lmvgamma("A",1))
  expect_error(lmvgamma(1,"A"))

  expect_error(mvdigamma("A",1))
  expect_error(mvdigamma(1,"A"))
}
)

test_that("Bad numeric input:",{

  expect_error(rCholWishart(1, 10, matrix(c(1,1,1,0), nrow = 2)))
  expect_error(rInvWishart(1, 10, matrix(c(1,1,1,0), nrow = 2)))
  expect_error(rInvCholWishart(1, 10, matrix(c(1,1,1,0), nrow =
                                               2)))
  expect_error(rPseudoWishart(1, 1, matrix(c(1,1,1,0), nrow = 2)))

  expect_error(dWishart(diag(2), 10, matrix(c(1,1,1,0), nrow = 2)))
  expect_error(dInvWishart(diag(2), 10, matrix(c(1,1,1,0), nrow = 2)))

  expect_error(dWishart(matrix(c(1,1,1,0), nrow = 2), 10, diag(2)))
  expect_error(dInvWishart(matrix(c(1,1,1,0), nrow = 2),10,diag(2)))



})

test_that("Out of bounds numeric input: ", {


  expect_error(rCholWishart(1, 10, matrix(c(3, 1, 1, 1, 1, 3), nrow = 2)))
  expect_error(rPseudoWishart(1, 2, matrix(c(3, 1, 1, 1, 1, 3), nrow = 2)))
  expect_error(rInvWishart(1, 10, matrix(c(3, 1, 1, 1, 1, 3), nrow = 2)))
  expect_error(rInvCholWishart(1, 10, matrix(c(3, 1, 1, 1, 1, 3), nrow =
                                               2)))

  expect_error(lmvgamma(-1, 5))
  expect_error(lmvgamma(1, -5))

  expect_error(mvgamma(-1, 5))
  expect_error(mvgamma(1, -5))

  expect_error(mvdigamma(-1, 5))
  expect_error(mvdigamma(1, -5))


  expect_error(rCholWishart(1, 10, -diag(5)))
  expect_error(rInvCholWishart(1, 10, -diag(5)))
  expect_error(rInvWishart(1, 10, -diag(5)))

  expect_error(rCholWishart(1, 4, diag(5)))
  expect_error(rInvCholWishart(1, 4, diag(5)))
  expect_error(rInvWishart(1, 4, diag(5)))

  expect_error(rCholWishart(-1, 10, diag(5)))
  expect_error(rInvCholWishart(-1, 10, diag(5)))
  expect_error(rInvWishart(-1, 10, diag(5)))


  expect_error(rCholWishart(1, 10, matrix(c(1, 1, 1, 1), nrow = 2)))
  expect_error(rInvCholWishart(1, 10, matrix(c(1, 1, 1, 1), nrow = 2)))
  expect_error(rInvWishart(1, 10, matrix(c(1, 1, 1, 1), nrow = 2)))
  }
)

test_that("Bad shape numeric input: ", {
  x = matrix(c(1,0,0,0,0,1),nrow = 2)
  expect_error(dWishart(x, 4, x))
  expect_error(dWishart(x,4,diag(3)))
  expect_error(dWishart(x,4, diag(2)))
  expect_error(dInvWishart(x, 4, x))
  expect_error(dInvWishart(x,4,diag(3)))
  expect_error(dInvWishart(x,4, diag(2)))
  A <- diag(5)
  A[1,2] <- 1
  expect_error(rCholWishart(1,6, A), "scal")
  expect_error(rInvCholWishart(1,6, A), "scal")
  expect_error(rInvWishart(1,6, A), "scal")

}
)

test_that("Imaginary matrix:", {

  Z <- sqrt(matrix(-1:2 + 0i, 2)); Z <- t(Conj(Z)) %*% Z
  # example from R help files

  expect_error(rCholWishart(1, 10, Z))
  expect_error(rInvCholWishart(1, 10, Z))
  expect_error(rInvWishart(-1, 10, Z))
  expect_error(rPseudoWishart(1, 1, Z))
  expect_error(dWishart(diag(2),4, Z))
  expect_error(dInvWishart(diag(2), 4, Z))
  expect_error(dWishart(Z,4, diag(2)))
  expect_error(dInvWishart(Z, 4, diag(2)))
  expect_error(lmvgamma(Z,1))
  expect_error(lmvgamma(1:4,Z))
  expect_error(mvgamma(Z,1))
  expect_error(mvgamma(1:4,Z))
  expect_error(mvdigamma(Z,1))
  expect_error(mvdigamma(1:4,Z))


})

test_that("df incompatible:",{
  set.seed(20190114)
  A <- rWishart(1, 10, diag(5))[,,1]
  
  expect_error(rCholWishart(1, 2, A))
  expect_error(rInvWishart(1, 2, A))
  expect_error(rInvCholWishart(1, 2, A))
  expect_warning(rPseudoWishart(1, 6, A))
  expect_error(rPseudoWishart(1, 2.5, A))
  expect_warning(rGenInvWishart(1, 6, A))
  expect_error(rGenInvWishart(1, 2.5, A))
  expect_error(rPseudoWishart(1, 0, A))
  expect_error(rGenInvWishart(1, 0, A))
})
