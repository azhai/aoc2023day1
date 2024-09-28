app "aoc2023day01"
    packages {
        pf:
        "https://github.com/roc-lang/basic-cli/releases/download/0.15.0/SlwdbJ-3GR7uBWQo6zlmYWNYOxnvo8r6YABXD-45UOw.tar.br",
        parser:
        "https://github.com/lukewilliamboswell/roc-parser/releases/download/0.7.2/1usTzOOACTpnkarBX0ED3gFESzR4ROdAlt1Llf4WFzo.tar.br",
    }
    imports [
        pf.Arg,
        pf.Stdout,
        Day01,
    ]
    provides [main] to pf

main =
    args = Arg.list! {}
    file =
        when args |> List.get 1 is
            Ok name -> name
            Err _ -> "../input.txt"
    Stdout.line! "\(Day01.part1 file)\n\(Day01.part2 file)"
