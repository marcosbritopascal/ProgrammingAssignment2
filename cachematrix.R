## Put comments here that give an overall description of what your
## functions do :  
##                  makeCacheMatrix : Save the content of parameter X in another environment, note that for this case, we are calculating the SOLVE for the matrix.
##                  cacheSolve      : Return a message "getting cached data" if the matrix exists previously and display the values.

## Write a short comment describing this function
## Save the content of parameter X in another environment, note that for this case, we are calculating the SOLVE for the matrix.      


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setSolve <- function(solve) m <<- solve
  getSolve <- function() m
  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)
}

## Write a short comment describing this function
## Return a message "getting cached data" if the matrix exists previously and display the values.

cacheSolve <- function(x, ...) {
  m <- x$getSolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setSolve(m)
  m
}