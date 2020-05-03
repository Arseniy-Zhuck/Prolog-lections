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

let inlist list el = List.exists (fun elem -> el=elem) list

let prog list =
    let num = System.Convert.ToInt32(System.Console.ReadLine())
    (num,inlist list num)

[<EntryPoint>]
let main argv = 
    let l = read_data
    let Ans = prog l
    System.Console.Write(Ans)
    let z = System.Console.ReadKey()
    0 // return an integer exit code
