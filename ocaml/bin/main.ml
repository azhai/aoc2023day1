open Base
open Stdio

let map_letters = function
  | "one" -> 1
  | "two" -> 2
  | "three" -> 3
  | "four" -> 4
  | "five" -> 5
  | "six" -> 6
  | "seven" -> 7
  | "eight" -> 8
  | "nine" -> 9
  (* This should already be a number *)
  | x -> Int.of_string x

let get_calibrate line ~regex =
  if String.length line = 0 then 0
  else
    try
      let _ = Str.search_forward regex line 0 in
      let first = Str.matched_string line in
      let _ = Str.search_backward regex line (String.length line - 1) in
      let last = Str.matched_string line in
      (map_letters first * 10) + map_letters last
    with _ -> 0

let sum_numbers = List.fold ~init:0 ~f:( + )
let solve lines ~regex = List.map lines ~f:(get_calibrate ~regex) |> sum_numbers

let () =
  let argv = Sys.get_argv () in
  let filename = if Array.length argv > 1 then argv.(1) else "input.txt" in
  let lines = In_channel.read_lines filename in

  let regex_part1 = Str.regexp "[0-9]" in
  let solve_part1 = solve lines ~regex:regex_part1 in
  print_endline (Int.to_string solve_part1);

  let regex_part2 =
    Str.regexp
      "[0-9]\\|one\\|two\\|three\\|four\\|five\\|six\\|seven\\|eight\\|nine"
  in
  let solve_part2 = solve lines ~regex:regex_part2 in
  print_endline (Int.to_string solve_part2)
