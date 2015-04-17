
## test_that (Muthu) unit test - Programming Assignment 1, Part 2, complete.R

library("testthat")
context("create a special object (list with 2 sets of get&set functions")

source("test-cacheSolve-df.R")
test_that("match the example output for cacheSolve function", {
    ## check get() function & getinverse() function
    m <-makeCacheMatrix(matrix(c(1:4),nrow=2,ncol=2))
    
    expect_equal(m$get(), cm1[["m"]])
    expect_equal(m$getinverse(),cm1[["i"]])
    
    i <- cacheSolve(m)
    
    expect_equal(m$get(), cm2[["m"]])
    expect_equal(i,cm2[["i"]])
    
    ## check set() function 
    m$set(matrix(c(1:4),nrow=2,ncol=2))
    expect_equal(m$get(), cm3[["m"]])
    expect_equal(m$getinverse(),cm3[["i"]])
        
    i <- cacheSolve(m)
    
    expect_equal(m$get(), cm2[["m"]])
    expect_equal(i,cm2[["i"]])
    
    expect_message(i <- cacheSolve(m),"getting cached data\\n")
    
    expect_equal(m$get(), cm2[["m"]])
    expect_equal(i,cm2[["i"]])
    
    
})
