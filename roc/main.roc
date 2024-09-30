app "aoc2023day01"
    packages {
        pf:
        "https://github.com/roc-lang/basic-cli/releases/download/0.15.0/SlwdbJ-3GR7uBWQo6zlmYWNYOxnvo8r6YABXD-45UOw.tar.br",
        parser:
        "https://github.com/lukewilliamboswell/roc-parser/releases/download/0.7.2/1usTzOOACTpnkarBX0ED3gFESzR4ROdAlt1Llf4WFzo.tar.br",
    }
    imports [
        pf.Arg,
        pf.File,
        pf.Stderr,
        pf.Stdout,
        Day01,
    ]
    provides [main] to pf


main : Task {} _
main = run |> Task.onErr \err ->
    Stderr.line! "Error: $(Inspect.toStr err)"

run : Task {} _
run =
    file = readArgs!
    when readInput! file is
        data if Str.trim data != "" ->
            Stdout.line! "$(Day01.part1 data)\n$(Day01.part2 data)"
        _ -> Stdout.line! "0"

readArgs =
    when Arg.list! {} is
        [_, filename, ..] -> Task.ok filename
        _ -> Task.ok "input.txt"

readInput = \filename ->
    File.readUtf8 filename |> Task.onErr \_ -> Task.ok ""
