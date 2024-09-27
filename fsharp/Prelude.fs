[<Microsoft.FSharp.Core.AutoOpen>]
module Prelude

open System

let inline isDigit c = Char.IsDigit c
let inline a2i (c:char) = int c - int '0'
let inline teen (x:char, y:char) = 10 * (a2i x) + (a2i y)

let inline both f g x = (f x, g x)
let inline first (s:string) (i:string) = s.IndexOf(i)
let inline last (s:string) (i:string) = s.LastIndexOf(i)
