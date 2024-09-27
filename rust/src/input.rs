use std::fs;

pub fn get_input() -> String {
    let file_path = "input.txt";
    let contents = fs::read_to_string(file_path).expect("Could not open file!");
    return contents;
}
