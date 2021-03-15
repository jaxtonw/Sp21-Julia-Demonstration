function myFunc1()
    println("Hello from my first function!")
end

function myFunc2(name)
    println("Hello from my second function!")
    println("I was given the parameter $(name).")
end

function myFunc3(name::String)
    println("Hello from my third function!")
    println("I was given the *string* $(name).")
end

function myFunc4(name::String = "Abed")
    println("Hello from my fourth function!")
    println("I was given the *string* $(name).")
end
