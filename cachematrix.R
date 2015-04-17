## this file contains the two functions to complete the Programming Assignmnet 2 
## for R Programming course rprog-013 by Muthu Kesavan
##  Objective: Use Lexical Scoping to cache inverse matrices
## there are testthat test cases available to check the functionality


## this function creates a special object which contains
## - 2 functions (get & set) of the original matrix
## - 2 functions (get & set) of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) inverse <<- inv
    getinverse <- function() inverse
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This function uses closures created in makeCacheMatrix
## to extend the 'solve' function with cache
## it accepts only the 'special matrix' created by makeCacheMatrix
## it returns the cached inverse if available
## otherwise it computes the inverse using lib function 'solve'
## before returning the inverse, it is stored in the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    data <- x$get()
    inverse <- solve(data, ...)
    x$setinverse(inverse)
    inverse
}
