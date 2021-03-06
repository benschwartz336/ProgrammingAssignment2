## These two functions are a pair of functions that cache
## the inverse of a matrix

## 1. makeCacheMatrix: This functions creates a special "matrix"
## object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
            x <<- y
            inv <<- NULL
  }
      get <- function() 
            x
      setInverse <- function(inverse) 
            inv <<- inverse
      getInverse <- function()
            inv
      list(set = set, get = get, setInverse = setInverse,
        getInverse = getInverse)
}

## 2. cacheSolve: This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has alreadu been
## calculated (and the matrix has not changed), then the cachesolve
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      inv <- x$getInverse()
      if (!is.null(inv)) {
            message("getting cached data")
            return(inv)
  }
      matrix <- x$get()
      inv <- solve(matrix, ...)
      x$setInverse(inv)
      inv
}

## Testing functions

mat <- makeCacheMatrix(matrix(3:6, 2, 2))
mat$get()
mat$getInverse()
cacheSolve(mat)
cacheSolve(mat)


