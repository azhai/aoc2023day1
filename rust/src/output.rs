pub fn report<T: std::fmt::Display>(part: &str, res: T, dur: std::time::Duration) {
    println!("{}: {:<10}{:>20?}", part, res, dur);
}
