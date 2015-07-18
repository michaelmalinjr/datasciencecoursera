


makeCacheMatrix: This function creates a special "matrix" 
object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        m = NULL
        get <- function() {x} # Returns x
        list(get = get) 
              
  }

m <- matrix(c(1:4), 2,2) # Creates 2x2 matrix
x <- makeCacheMatrix(m)  
x$get()

cacheSolve: This function computes the inverse of the 
special "matrix" returned by makeCacheMatrix above. 
If the inverse has already been calculated (and the matrix has not changed),
then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        data <- x$get()
        if(!is.null(m)) { # If m is not NULL displays message
                message("-- Getting cached data")
        }else{
                message("NULL")
                return(m)
        }
        m <- solve(data, ...)
        print(m)
        
}

cacheSolve(x)


























