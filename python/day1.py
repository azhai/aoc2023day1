import re
import regex as re2

INPUT_FILE_PATH = "input.txt"
DIGIT_WORDS = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
RE_P1 = r"\d"
RE_P2 = r"\d|" + "|".join(DIGIT_WORDS)

def main(input_file):
    # Part 1
    print(sum([get_calibration_value_p1(line) \
            for line in parse_input_file(input_file)]))
    # Part 2
    print(sum([get_calibration_value_p2(line) \
            for line in parse_input_file(input_file)]))

def get_calibration_value_p1(line):
    matches = re.findall(RE_P1, line)
    first_digit = matches[0]
    last_digit = matches[-1]
    return int(first_digit + last_digit)

def get_calibration_value_p2(line):
    def get_digit_from_digit_or_word_digit(target):
        # returns (index + 1) if target in DIGIT_WORDS, else returns target
        return str(DIGIT_WORDS.index(target) + 1) if target in DIGIT_WORDS else target

    matches = re2.findall(RE_P2, line, overlapped=True)
    first_digit = matches[0]
    last_digit = matches[-1]

    first_digit = get_digit_from_digit_or_word_digit(first_digit)
    last_digit = get_digit_from_digit_or_word_digit(last_digit)

    return int(first_digit + last_digit)

def parse_input_file(input_file):
    with open(input_file, "r") as f:
        for line in f.read().split("\n"):
            line = line.strip()
            if line:
                yield line

if __name__ == "__main__":
    """
    Usage: python3 main.py [file...]
    """
    import sys
    if len(sys.argv) > 1:
        for input_file in sys.argv[1:]:
            main(input_file)
    else:
        main(INPUT_FILE_PATH)
