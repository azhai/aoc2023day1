open System.IO

let readInput (filename) =
    let p = Path.Combine(__SOURCE_DIRECTORY__, filename)
    File.ReadLines(p) |> List.ofSeq

[<EntryPoint>]
let main (args:string[]) =
    let filename = if args.Length > 0 then args.[0] else "../input.txt"
    readInput(filename) |> Day01.Solve ||> printf "%d\n%d\n"
    0 // return an integer exit code
