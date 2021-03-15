function maceps32Print()
    ϵ::Float32 = 1.0

    while ( Float32(1.0) - ϵ) != 1.0
        println("Our computation is not complete! Currently epsilon ϵ is ", ϵ)
        println("In binary, this value is equivelant to ", bitstring(ϵ))
        ϵ = 0.5 * ϵ
    end
    println()
    println("The smallest computable epsilon ϵ is ", ϵ)
    println("In binary, this value is equivelant to ", bitstring(ϵ))
    return nothing
end

function maceps64Print()
    ϵ::Float64 = 1.0

    while ( Float64(1.0) - ϵ) != 1.0
        println("Our computation is not complete! Currently epsilon ϵ is ", ϵ)
        println("In binary, this value is equivelant to ", bitstring(ϵ))
        ϵ = 0.5 * ϵ
    end
    println()
    println("The smallest computable epsilon ϵ is ", ϵ)
    println("In binary, this value is equivelant to ", bitstring(ϵ))
    return nothing
end

function maceps32()
    ϵ::Float32 = 1.0

    while ( Float32(1.0) - ϵ) != 1.0
        ϵ = 0.5 * ϵ
    end

    return ϵ
end

function maceps64()
    ϵ::Float64 = 1.0

    while ( Float64(1.0) - ϵ) != 1.0
        ϵ = 0.5 * ϵ
    end

    return ϵ
end
