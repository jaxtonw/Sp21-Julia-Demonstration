import math

# Constants
PI = math.pi

def absErr(value, valueApprox):
    '''
    The following code will compute the absolute error between value and valueApprox
    '''
    val = value - valueApprox
    return abs(val)

def bisectionMethod(function, lowerbound, upperbound, maxIter=100, tol=10e-10, returnIter=False):
    if upperbound < lowerbound:
        temp = upperbound
        upperbound = lowerbound
        lowerbound = temp

    lb = function(lowerbound)
    ub = function(upperbound)

    if not (lb * ub < 0):
        return None
    iter = 0
    error = 1
    midpoint = 0
    while tol < error and iter < maxIter:
        midpoint = (lowerbound + upperbound) / 2
        mp = function(midpoint)
        iter += 1
        if mp * ub < 0:
            lowerbound = midpoint
            error = absErr(lowerbound, upperbound)
        elif mp * lb < 0:
            upperbound = midpoint
            error = absErr(lowerbound, upperbound)
        else:
            if returnIter:
                return midpoint, iter
            return midpoint

    if returnIter:
        return midpoint, iter
    return midpoint


if __name__ == "__main__":
    # Demonstrates what Bisection method can do

    # Using some identities, this is equivelant to xcosh(x) + x^3 - \pi = 0
    def func(x):
        return (((x * math.exp(x)) + (x * math.exp(-x))) / 2) + pow(x, 3) - PI

    import time

    start = time.time()
    num = bisectionMethod(func, 0, 2)
    print(f"Elapsed time: {time.time() - start} seconds")
    print("When given the function, xcosh(x) + x^3 - \pi = 0, and the first guess of a lowerbound = 0 and upperbound = 2,\n"
          "the bisection method produced the approximation for the root to be: " + str(num))
