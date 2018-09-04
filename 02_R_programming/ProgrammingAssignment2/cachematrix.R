## - makeCacheMatrix() creates a special "matrix" object 
##   which includes a cache for storing the inverse matrix 
## - cacheSolve() returns the inverse matrix of a "cacheMatrix". 
##   If the inverse matrix has already been calulated and is in the cache, 
##   the cached value is returned. 

## makeCacheMatrix() :
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the value of the inverse matrix
## 4) get the value of the inverse matrix
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inverseMatrix) inverse <<- inverseMatrix
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve() :
## check if the "cacheMatrix" object x contains the inverse matrix.
## If yes, returns the cached value.
## If no, calculates the inverse and returns it (after having put in cache).
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
