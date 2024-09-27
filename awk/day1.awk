BEGIN {
    total_p1 = total_p2 = 0
    pattern = "(zero|one|two|three|four|five|six|seven|eight|nine)"

    numbers["zero"] = 0
    numbers["one"] = 1
    numbers["two"] = 2
    numbers["three"] = 3
    numbers["four"] = 4
    numbers["five"] = 5
    numbers["six"] = 6
    numbers["seven"] = 7
    numbers["eight"] = 8
    numbers["nine"] = 9
}

{
    total_p1 += calibrate($0)
    total_p2 += calibrate_text($0)
}

END {
    print total_p1
    print total_p2
}

function calibrate(line) {
    head = tail = 0
    if (i = match(line, /[[:digit:]]/)) {
        head = substr(line, i, 1)
        remain = substr(line, i)
        if (j = match(remain, /([[:digit:]])[^[:digit:]]*$/)) {
            tail = substr(remain, j, 1)
        }
    }
    return head * 10 + tail
}

function calibrate_text(line) {
    head = tail = j = 0

    m = match(line, /[[:digit:]]/)
    n = match(line, pattern, matches)
    if (m + n > 0) {
        if (m > 0 && m < n) {
            head = substr(line, m, 1)
            remain = substr(line, m)
        } else if (n > 0) {
            head = numbers[matches[1]]
            remain = substr(line, n)
        }

        i = match(remain, /([[:digit:]])[^[:digit:]]*$/)
        for (k = length(remain) - 3; k > i; k--) {
            if (j = match(substr(remain, k), pattern, matches)) {
                break
            }
        }

        if (i + j > 0) {
            if (i > 0 && j == 0) {
                tail = substr(remain, i, 1)
            } else if (j > 0) {
                tail = numbers[matches[1]]
            }
        }
    }

    return head * 10 + tail
}
