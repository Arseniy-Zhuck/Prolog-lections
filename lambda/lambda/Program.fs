// Learn more about F# at http://fsharp.net
// See the 'F# Tutorial' project for more help.
let sq x = x*x

let rec rpt n f =
    if n=0 then fun x->x
           else f >> (rpt (n-1) f) 

let prog = 
    let a= System.Convert.ToInt32 (System.Console.ReadLine())
    rpt 3 sq a
[<EntryPoint>]
let main argv = 
    
    let Ans = prog
    System.Console.Write(Ans)
    let z = System.Console.ReadKey()
    
    0 // return an integer exit code
