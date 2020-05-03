// Learn more about F# at http://fsharp.net
// See the 'F# Tutorial' project for more help.

let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    read_list n

let sum x y = x+y

let max x y =
    if x>y then x
    else y

let min x y =
    if x<y then x
    else y

let pr x y =x*y

let rec op_list l (f:int->int->int) : int= 
    match l with
    |head::[] -> head
    |head::t -> f head (op_list t f) 
    |[] -> 0

let prog list = 
    (op_list list sum,op_list list pr,op_list list min,op_list list max)

[<EntryPoint>]
let main argv = 
    
    let l = read_data
    let Ans = prog l
    System.Console.Write(Ans)
    let z = System.Console.ReadKey()
    0 // return an integer exit code
