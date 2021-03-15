function absErr(value::Float64, valueApprox::Float64)::Float64
    return abs(value - valueApprox)
end

function bisection(func::Function, lowerbound::Float64, upperbound::Float64, maxIter::Integer = 100, tol::Float64 = 10e-10)::Float64
    # If the user messes up the bounds, we're nice; we'll fix it for them
    if upperbound < lowerbound
        temp = upperbound
        upperbound = lowerbound
        lowerbound = temp
    end

    lb::Float64 = func(lowerbound)
    ub::Float64 = func(upperbound)

    # Both the lowerbound and upperbound when evaluated are on the same side of the x-axis
    if !(lb * ub < 0)
        return nothing
    end

    iter::Integer = 0
    error::Float64 = 1
    midpoint::Float64 = 0

    while tol < error && iter < maxIter
        midpoint = (lowerbound + upperbound) / 2
        mp = func(midpoint)
        iter += 1

        if mp * ub < 0
            lowerbound = midpoint
            error = absErr(lowerbound, upperbound)
        elseif mp * lb < 0
            upperbound = midpoint
            error = absErr(lowerbound, upperbound)
        else
            break
        end
    end
    return midpoint
end

function myFunc(x::Float64)::Float64
    return (((x * exp(x)) +  (x * exp(-x))) / 2) + x * x * x - pi
end

function testBisection()
    @time num::Float64 = bisection(myFunc, 0., 2.)

    println("When given the function, xcosh(x) + x^3 - pi = 0, and the first guess of a lowerbound = 0 and upperbound = 2 the bisection method produced the approximation for the root to be: $(num)")

end
