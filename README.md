# Julia Introduction
Julia is a programming language created to "fix" the inefficiencies of Python.
It is multi-paradigm in nature, much like Python is. Julia is a a high-level
dynamic programming language, much like Python. Julia is a high-performance
language, unlike Python. Julia really shines in the fields of data science,
numerical analysis, machine learning, and computational mathematics. It has
many other usages as well.

Many people refer to Julia as the "niece" of Python, having fully embraced the
`numpy` library that Python utilizes externally. Much of the functionality of
Python's `numpy` library is directly embedded in the Julia language, giving it
significant advantages in the fields of data science, numerical analysis,
and computational mathematics.

## Try Julia
Would you like to try out Julia without committing to a pesky download? [Visit
here!](https://julialang.org/learning/tryjulia/) Have you been sold on Julia,
and do you want to integrate Julia into your system? [Visit their download page
here!](https://julialang.org/downloads/) Alternatively, there are Docker images
available of Julia if that's how you roll.


## Using Julia
With a proper installation of Julia, one can execute `.jl` files with the
`julia` command in a similar manner as to how one would exectue `.py` files
with the `python` command. If one has the file `test.jl` in their current
directory, running `$ julia test.jl` will execute said file. However, there is
*much* more to the `julia` command than just simply *executing* a file...


### The Julia REPL
When one installs Julia onto their system, they should have access to the Julia
REPL. Many of you may be familiar with Python's REPL: it's just like that! So
long as Julia has been properly installed in your Path, one can simply run
`julia` in the command line to get put right into a Julia REPL. Opening up the
REPL should lead to a prompt that looks like:

```
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.5.3 (2020-11-09)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia>
```

As a reminder, the REPL stands for "Read, Evaluate, Print, Loop." The Julia
REPL does just that! Feel free to open the REPL and experiment with some of
Julia's functionality in an interactive and non-committal environment.

### Opening a Julia file in "Interactive Mode"
Earlier we learned about using the `julia [FILE]` to execute a single Julia
file. What if we want to execute the file *but then keep interacting with what
was loaded?* In comes Julia's "Interactive Mode!" Simply by adding a `-i` flag
immediately after `julia`, one can load the contents of a file and then be
placed right into the Julia REPL.

Suppose one has a file named `test.jl` that contains a function definition.
Suppose that someone wants to *try* this function out with a few different
inputs, while not necessarily modifying the `test.jl` file to do so. Julia's
"Interactive Mode" comes to the rescue! Running `julia -i test.jl`, one will
load the entire contents of `test.jl` before being placed into the Julia REPL.
At this point, one can execute `myFunc` with a few different inputs in an
interactive and non-committal environment. Perfect for testing!

We will use this interactive mode for a couple demonstrations later.


## Typing
Julia has dynamic typing: it's types are checked at run-time. One can allow
Julia to interpret types automatically (much like Python's duck typing), or one
can directly declare the types associated with a variable through a semblance
of strong typing. Both of the following are valid syntax for declaring the
variable `x` and `y` in Julia (so long as it is in a function or struct, Julia
has some weird rules about globals not being able to be statically typed, for
now).

```julia
x = 1
y::Integer = 1
```

The first of the two declarations declares a variable `x` that is the integer 1. This can be
reassigned to another data type at a later time though. The second declaration
declares a variable `y` that *must be* an Integer type.

Please see [the function `testIntegerTypes()` in `src/types.jl`](src/types.jl).


## Function Definitions
Function definitions in Julia start with the `function` keyword, and end with,
well, `end`. In fact, *most* control structures in Julia end with the `end`
keyword. Following the `function` keyword is the name of the function. The
function will then be succeeded by parenthesis, much like Python. One can
define named parameters in the parenthesis: yet another similarity to Python.
With yet another similarity to Python, default parameters can be defined.
Similar to Python's "type hinting," one can also declare the types of the
parameters in a Julia function.

```julia
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
```

The above has been placed into [`src/functions.jl`](src/functions.jl) for your
convenience. Load it up in interactive mode with `$ julia -i src/functions.jl`
and follow along with the following demonstrations of the functions above.

```julia
julia> myFunc1()
Hello from my first function!

julia> myFunc2(1)
Hello from my second function!
I was given the parameter 1.

julia> myFunc2("Some value")
Hello from my second function!
I was given the parameter Some value.

julia> myFunc3(1)
ERROR: MethodError: no method matching myFunc3(::Int64)
Closest candidates are:
  myFunc3(::String) at /home/jaxtonw/Documents/USU/Sp21/SDW/ProgrammingLanguages/src/functions.jl:10
Stacktrace:
 [1] top-level scope at REPL[4]:1

julia> myFunc3("a string")
Hello from my third function!
I was given the *string* a string.

julia> myFunc4("Troy")
Hello from my fourth function!
I was given the *string* Troy.

julia> myFunc4()
Hello from my fourth function!
I was given the *string* Abed.
```

## Structs
Julia isn't really an Object Oriented language per-se. However, it can be
utilized in capacities *much* like other Object Oriented languages. One can
define a `struct` with data members and methods on it. By default, a `struct`
is *immutable*: it cannot change after being created. However, there is a way
to make a `mutable struct`, with exactly that syntax.

We can define two classes, a `struct` that is an ImmutableVehicle, and a
`mutable struct` that is a MutableVehicle.

```julia
struct ImmutableVehicle
    make::String
    model::String
    numWheels::Integer
end

mutable struct MutableVehicle
    make::String
    model::String
    numWheels::Integer
end
```

For your convenience, the above is defined in
[`src/structs.jl`](src/structs.jl) and can be loaded into Julia's interactive
mode to understand the difference between a mutable and immutable struct.
Please note, for structs, a default constructor is provided for all the
non-defined data types, in the order they are defined. So, to create an
ImmutableVehicle with `make="Toyota"`, `model="Tacoma"`, and `numWheels=4`, one
can construct the object with `ImmutableVehicle("Toyota", "Tacoma", 4)`. More
information regarding `struct` con`struct`ors can be found
[here](https://docs.julialang.org/en/v1/manual/constructors/).

In interactive mode, we can find the following key differences between a
mutable struct and an immutable struct with the `MutableVehicle` and
`ImmutableVehicle` classes.

```
julia> vehicle1 = ImmutableVehicle("Toyota", "Tacoma", 4)
ImmutableVehicle("Toyota", "Tacoma", 4)

julia> vehicle2 = MutableVehicle("Toyota", "Tacoma", 4)
MutableVehicle("Toyota", "Tacoma", 4)

julia> vehicle1.make
"Toyota"

julia> vehicle1.numWheels
4

julia> vehicle1.numWheels = 5
ERROR: setfield! immutable struct of type ImmutableVehicle cannot be changed
Stacktrace:
 [1] setproperty!(::ImmutableVehicle, ::Symbol, ::Int64) at ./Base.jl:34
 [2] top-level scope at REPL[4]:1

julia> vehicle2.numWheels
4

julia> vehicle2.numWheels = 5
5
```

Please note, this example barely comes close to scratching the *surface* of
structs in Julia. Julia is considered to be a ["Multiple
Dispatch"](https://en.wikipedia.org/wiki/Multiple_dispatch) language, and has
many *many* more features regarding structs that we do not have the time to
introduce you to in a basic introduction to Julia. We didn't even cover
methods; what a bummer!


## Arrays, Vectors, and Matrices
Will show off matrices and the *handy* Matrix operations. I'll add some more notes on this later, we're doing this demonstration live!

```
julia> [1 2; 3 4]
2×2 Array{Int64,2}:
 1  2
 3  4

julia> [1 2; 3 4] * [5, 5]

julia> zeros(5)
5-element Array{Float64,1}:
 0.0
 0.0
 0.0
 0.0
 0.0

julia> ones(Integer, 5)
5-element Array{Integer,1}:
 1
 1
 1
 1
 1

julia> ones(5)
5-element Array{Float64,1}:
 1.0
 1.0
 1.0
 1.0
 1.0

julia> ones(5, 5)
5×5 Array{Float64,2}:
 1.0  1.0  1.0  1.0  1.0
 1.0  1.0  1.0  1.0  1.0
 1.0  1.0  1.0  1.0  1.0
 1.0  1.0  1.0  1.0  1.0
 1.0  1.0  1.0  1.0  1.0

julia> A = [1 0; 0 1]
2×2 Array{Int64,2}:
 1  0
 0  1


julia> b = [1 1]
1×2 Array{Int64,2}:
 1  1

julia> x = b/A
1×2 Array{Float64,2}:
 1.0  1.0

julia> A = [2 1; 1 2]
2×2 Array{Int64,2}:
 2  1
 1  2

julia> x = b/A
1×2 Array{Float64,2}:
 0.333333  0.333333
```

## Computational Mathematics Examples
Due to my own previous experience in the field of computational mathematics, I've put together some short examples of Python and Julia code that relate to computational mathematics. Compare the two languages and their performance!


### Machine Epsilon
The first is an example of a [machine epsilon](https://en.wikipedia.org/wiki/Machine_epsilon) calculation with 32 bit and 64 bit floating point values.

In Python, the `numpy` library was required to control the 32 bit floating point value in the `maceps32` routine. The 64 bit floating point value is Python's default on a 64-bit installation, thus the `numpy` library was not necessary for `maceps64`. See [`src/maceps.py`](src/maceps.py) to find the definitions of both machine epsilon routines in Python. Load this file in interactive mode with `$ python -i src/maceps.py`, and see the return values of the functions by calling `maceps32()` and `maceps64()` in the REPL.

In Julia, the language gives you full control over types: no additional imports were necessary to create the 32 bit and 64 bit routines! See [`src/maceps.jl`](src/maceps.jl) to find the definitions of 4 machine epsilon routines in Julia. Load this file in interactive mode with `$ julia -i src/maceps.jl`, and see the return values of the *core* machine epsilon routines by calling `maceps32()` and `maceps64()` in the REPL. There's also two addition routines defined, `maceps32Print()` and `maceps64Print()` that can be used to view the machine epsilon computation as it is happening.


### Bisection Method
The second example lined up is utilizing the [bisection method](https://en.wikipedia.org/wiki/Bisection_method) for root finding. Both of these routines have timers attached to them to view the performance differences between Python and Julia.

In the following examples, we aim to find the x-value such that `xcosh(x) + x^3 - pi = 0`.

To see the Python code of the bisection method, go to [`src/bisection.py`](src/bisection.py). This can be run directly with `$ python src/bisection.py` to see the results of computing the bisection method with a lowerbound at `x=0`, and an upperbound at `x=2`.

To see the Julia code of the bisection method, go to [`src/bisection.jl`](src/bisection.jl). This can be run through Julia's interactive mode with `$ julia -i src/bisection.jl`, and running the method `testBisection()` will execute the bisection method on the function noted above, with a lowerbound at `x=0` and an upperbound at `x=2`.  


## Conclusion
Throughout this, we hope you have found Julia to be a very user friendly language,
one that is quite similar to other popular programming languages out there. If
you are interested in the fields of data science, numerical analysis, or
computational mathematics, hopefully you can start to see why Julia is becoming
more and more popular in these fields. If you aren't necessarily involved in
these fields, there are many other ways you can incorporate Julia into your
development cycle. Julia is still a growing language, only having achieved it's
first semi-public development releases in 2012, and it's "1.0" release in 2018.
We hope you embrace the language, and contribute to it's continued growth!


## Resources and Other Helpful Links

[Julia on
Wikipedia](https://en.wikipedia.org/wiki/Julia_(programming_language))

["Why We Created
Julia"](https://julialang.org/blog/2012/02/why-we-created-julia/)

[Announcing the release of Julia
1.0](https://julialang.org/blog/2018/08/one-point-zero/)

[Arrays and Matrices in Julia](https://docs.julialang.org/en/v1/manual/arrays/)

[Julia Types](https://docs.julialang.org/en/v1/manual/types/)

[Julia Functions](https://docs.julialang.org/en/v1/manual/functions/)
