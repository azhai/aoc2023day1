module Day01

    __init__() = main()
    firstlast(s::AbstractString) = length(s) > 0 ? s[1] * s[end] : "0"
    getnumbers(s::AbstractString) = String([x for x in s if isdigit(x)])

    # Read the input from a file:
    function readInput(path::AbstractString) :: AbstractString
        s = open(path, "r") do file
            read(file, String)
        end
        return s
    end

    function repl(s::AbstractString) :: AbstractString
        s = replace(s,
            "twone" => "twoone",
            "oneight" => "oneeight",
            "threeight" => "threeeight",
            "fiveight" => "fiveeight",
            "sevenine" => "sevennine",
            "eightwo" => "eighttwo",
            "eighthree" => "eightthree")
        return replace(s,
            "one" => "1",
            "two" => "2",
            "three" => "3",
            "four" => "4",
            "five" => "5",
            "six" => "6",
            "seven" => "7",
            "eight" => "8",
            "nine" => "9")
    end

    function solve(lines::Vector{SubString{String}}; part2::Bool = false) :: Int
        modifier = part2 ? repl : identity
        return [parse(Int, firstlast(getnumbers(modifier(line)))) for line in lines] |> sum
    end

    function solveall(filename::AbstractString) :: Nothing
        lines = split(rstrip(readInput(filename)), "\n")
        println(solve(lines))
        println(solve(lines; part2 = true))
    end

    function main(args = ARGS) :: Cint
        if length(args) > 0
            filename = args[1]
        else
            filename = joinpath(@__DIR__, "../input.txt")
        end
        solveall(filename)
        return 0
    end

end # module
