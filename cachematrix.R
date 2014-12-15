## Put comments here that give an overall description of what your
## functions do

# Create a "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
            x <<- y
            m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}


# Check cache for inverse 
# If inverse is in matrix return it, otherwise solve
cacheSolve <- function(x, ...) {
    ## check for cached solution
    
    ## Return a matrix that is the inverse of 'x'
    solve(x)   
}