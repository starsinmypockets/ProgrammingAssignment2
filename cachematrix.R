## makeCacheMatrix returns a matrix object with getters and setters, 
##      capable of caching its own inverse
##
## cacheSolve, when passed an object created with makeCacheMatrix 
##      will either return the stored inverse value, or calculate it,
##      storing it so it doesn't need to be recalculated in the future.


# Create a "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
            x <<- y
            m <<- NULL
        }
        get <- function() x
        # cache the inverse of the matrix
        setinverse <- function(inv) m <<- inv
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


# Check cache for inverse 
# If inverse is in matrix return it, otherwise solve
cacheSolve <- function(x, ...) {
    # check if the matrix has an inverse cached already
    # if so, return the inversed value
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    # otherwise, get the matrix value...
    data <- x$get()
    
    # calculate the inverse...
    m <- solve(data)
    # store the inverse on the matrix...
    x$setinverse(m)
    # and return the inverse matrix
    message("calculate and return inversed matrix")
    m
}