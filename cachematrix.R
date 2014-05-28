## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#' Returns function list for use by cacheSolve to return the inverse of a matrix.
#' If the inverse is cached, it is returned.
#' The list contains functions to
#' set the value of the matrix
#' get the value of the matrix
#' set the value of the inverted matrix
#' get the value of the inverted matrix
#' @param x matrix for which an inverse is sought
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
  

## Write a short comment describing this function
#' Returns the inverse of the matrix in the list object created by 
#' makeCacheMatrix.
#' It first checks to see if the inverse of the matrix has already been 
#' calculated. If so, it gets the inverse from the cache and skips the 
#' computation. Otherwise, it calculates the inverse of the data and sets 
#' the value of the inverse in the cache via the setinverse function.
#' @param x makeCacheMatrix object
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
