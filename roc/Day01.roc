interface Day01
    exposes [
        part1,
        part2,
    ]
    imports [
        parser.String.{ anyCodeunit, digit, parseStr, string },
        parser.Core.{ flatten, many, map, oneOf },
    ]

#isDigit : U8 -> Bool
#isDigit = \c ->
#    c >= '0' && c <= '9'

mapCharList = \line ->
    List.walk line [] (\state, elem ->
        when elem is
            Digit n -> state |> List.append n
            Other -> state
        )

part1 = \content ->
    solvePart1 content puzzleParser1

solvePart1 = \input, parser ->
    result = input
        |> Str.split "\n"
        |> List.dropIf Str.isEmpty
        |> List.walkTry 0 (\sum, line ->
            when parseStr parser line is
                Err e -> Err e
                Ok [] -> Ok sum
                Ok values -> addLine1 sum values
            )
    dbg result
    when result is
        Err _ -> "error"
        Ok total -> total |> Num.toStr

addLine1 = \sum, values ->
    first = List.first values |> Result.withDefault 0
    last = List.last values |> Result.withDefault 0
    Ok (sum + first * 10 + last)

puzzleParser1 =
    many (oneOf [
        digit |> map \d -> Digit d,
        anyCodeunit |> map \_ -> Other,
    ])
    |> map \line -> Ok (mapCharList line)
    |> flatten

exampleData1 =
    """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    """

expect solvePart1 exampleData1 puzzleParser1 == "142"

part2 = \content ->
    solvePart2 content forwardParser2 backwardParser2

solvePart2 = \input, parser, revParser ->
    result = input
        |> Str.split "\n"
        |> List.dropIf Str.isEmpty
        |> List.walkTry 0 (\sum, line ->
            when parseStr parser line is
                Err e -> Err e
                Ok [] -> Ok sum
                Ok values ->
                    remain = parseStr revParser (revLine line)
                    addLine2 sum values remain
            )
    dbg result
    when result is
        Err _ -> "error"
        Ok total -> total |> Num.toStr

revLine = \line ->
    line |> Str.toUtf8 |> List.reverse
        |> Str.fromUtf8 |> Result.withDefault ""

addLine2 = \sum, values, remain ->
    first = List.first values |> Result.withDefault 0
    last = remain |> Result.withDefault [0]
        |> List.first |> Result.withDefault 0
    Ok (sum + first * 10 + last)

forwardParser2 =
    many (oneOf [
        digit |> map \d -> Digit d,
        string "one" |> map \_ -> Digit 1,
        string "two" |> map \_ -> Digit 2,
        string "three" |> map \_ -> Digit 3,
        string "four" |> map \_ -> Digit 4,
        string "five" |> map \_ -> Digit 5,
        string "six" |> map \_ -> Digit 6,
        string "seven" |> map \_ -> Digit 7,
        string "eight" |> map \_ -> Digit 8,
        string "nine" |> map \_ -> Digit 9,
        anyCodeunit |> map \_ -> Other,
    ])
    |> map \line -> Ok (mapCharList line)
    |> flatten

backwardParser2 =
    many (oneOf [
        digit |> map \d -> Digit d,
        string "eno" |> map \_ -> Digit 1,
        string "owt" |> map \_ -> Digit 2,
        string "eerht" |> map \_ -> Digit 3,
        string "ruof" |> map \_ -> Digit 4,
        string "evif" |> map \_ -> Digit 5,
        string "xis" |> map \_ -> Digit 6,
        string "neves" |> map \_ -> Digit 7,
        string "thgie" |> map \_ -> Digit 8,
        string "enin" |> map \_ -> Digit 9,
        anyCodeunit |> map \_ -> Other,
    ])
    |> map \line -> Ok (mapCharList line)
    |> flatten

exampleData2 =
    """
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    73333pqr333333stsixteen
    """

expect solvePart2 exampleData2 forwardParser2 backwardParser2 == "281"
