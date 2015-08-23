## Put comments here that give an overall description of what your
## functions do


## There are 2 functions here:
## 1. makeCacheMatrix is used to store and return the value of matrix and its inverse, but doesn't calculate the inverse matrix itself.
##    Also it returns set functions for matrix and its inverse.

## 2. cacheSolve returns the inverse matrix defined in makeCasheMatrix. 
##    This is made from cache (if the value of inverse matrix exists) 
##               or is calculated it and stored in cache.


## Write a short comment describing this function

## makeCacheMatrix returns a list of 4 functions: 
## setting and getting the input matrix, setting and getting inverse matrix                    

makeCacheMatrix <- function(x = matrix()) {

        s <- NULL                                
        set <- function(y) {                       ## set function changes the matrix stored in the main function
                x <<- y                            ## assigns value y to x where x is a matrix from main function
                s <<- NULL                         ## assigns NUULL value to the object s from main function makeCacheMatrix  
        }
        get <- function() x                        ## function that returns the matrix x stored in makeCacheMatrix
        setsolve <- function(solve) s <<- solve    ## store the value of inverse matrix in s in makecacheMatrix function
        getsolve <- function() s                   ## returns the value of inverse matrix s in the main function
        list(set = set, get = get,                 ## makecacheMatrics returns a list of 4 functions 
             setsolve = setsolve,                  
             getsolve = getsolve)                  
        
}


## Write a short comment describing this functiona <-

## cashSolver returns the inverse matrix for the matrix stored in makeCacheMatrix.
## If the inverse matrix is calculated already, then data from the cache will be used.
## Else the inverse matrix will be calculated and stored in cashe.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        s <- x$getsolve()                          ## gets the data from cache
        if(!is.null(s)) {                          ## checks if the inverse matrix is calculated earlier and is it in cache
                message("getting cached data")     ## if yes, then prints a message that data from cache are used
                return(s)                          ##         and takes the inverse matrix from cache withuout calculation
        }
        data <- x$get()                            ## if no,  then data gets the matrix by calling get function 
        s <- solve(data, ...)                      ##         inverse matrix is calculated for data and is stored in s
        x$setsolve(s)                              ##         inverse matrxix s is stored in cache
        s                                          ##         return inverse matrix
        
}
