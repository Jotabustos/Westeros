import UIKit
//
//
//// FUNCIONES COMO VALORES
//
//// En la programación funcional las funciones son ciudadanos de primera clase
//// Podemos meter a las funciones dentro de arrays, de variables, podemos pasarlo como parametros de otra funcion, o incluso, devolver una funcion dentro de una funcion
//
//
//typealias IntToInt = (Int) -> (Int)
//
//func adder(n: Int) -> IntToInt {
//
//    func f(x: Int) -> Int {
//        return x + n
//    }
//
//    return f
//}
//
//let h = adder(n: 42)
//h(13)
//
//// Tambien pueden ser parametros de entrada
//
//func apply(f: IntToInt, n:Int) -> Int {
//    return f(n)
//}
//
//apply(f: h, n: 99)
//
//
//
//// Sintaxis de clousure
//
//func f(_ n:Int) -> Int{
//    return n+1
//}
//
//// Esa funcion f es equivalente a este clousure
//
//let f1 = { (n:Int) in return n+1}
//
//f(8)
//f1(8)
//
//
//// Las funciones como son iguales que cualquier otro tipo, se pueden meter dentro de colecciones
//
//let functions = [f,f1,h]
//
//for fn in functions{
//    print(fn(42))
//}

// CLASE 5


/*
 Las funciones son ciudadanos de primera clase:
 - Podemos meterlas dentro de un array
 - Podemos asignarlas a variables
 - Pueden ser parametros de otras funciones
 - Ser el resultado que devuelve una función ( es decir, una función puede devolver una función )
*/

// Tipo de una función

typealias IntToInt = (Int) -> Int // Clousure

func adder(n: Int) -> IntToInt {
    
    func f(x: Int) -> Int {
        return x + n
    }
    return f
}

let add42 = adder(n: 42)
let add10 = adder(n: 10)
add42(8)
add10(8)

func apply(f: IntToInt, n: Int) -> Int {
    return f(n)
}

apply(f: add42,n: 2)

// SINTAXIS DE CLOUSURES
// Toda función de Swift es, en realidad, un clousure

func f(_ n: Int) -> Int {
    return n + 8
}

// Clousure
let f1 = {
    (n:Int) in
    return n + 8
}

f(8)
f1(8)

// - Podemos meterlas dentro de un array

let functions = [f, f1, add42, add10]

for f in functions {
    print(f(8))
}

// Sintaxis abreviada de clousures

let clousures = [
f,
{(n:Int) -> Int in return n + 8}, // 100% explicito
{(n: Int) in return n+8}, // 95% explicito
{n in return n*5}, // 90% No hace falta especificar el tipo de entrada. Lo infiere de la primera "f"
{n in n*5}, // Si el cuerpo de la funcion, solo tiene una linea, no hace falta el return
{ $0 * 3} // No hace falta, ni siquiera, ponerle un nombre al parametro
]

let clousures2 = [
{$0 * 3}, // No hace falta, ni siquiera, ponerle un nombre al parametro
{$0 * 2}
]


// Trailing clousure
// Bloque/Clousure de finalización

let evens = [6,12,8,2,10,4]

evens.sorted(by: {(a:Int, b:Int) -> Bool in
    a > b
})

evens.sorted{(a,b) -> Bool in
    return a > b
}

var result = evens.sorted{ $0 < $1 }

result

// Clasicos de la programacion funcional: map, flatmap (compactMap), filter, reduce, ...

var results = [Int]()

for r in results{
    results.append(r * 2)
}

print(results)

// FP - map

results = []
var results2 = [String]()
results2 = evens
    .map { $0 * 2}
    .map { "El numero es \($0)" }

print(results)

// FILTER

results = evens.filter({$0 > 5})
results

// FLATMAP
let intsOrNil: [Int?] = [1,2,nil,4,nil,6,7,nil,10,12,nil]

results = intsOrNil.compactMap{$0}
results = results.compactMap{$0*2}
results


// REDUCE

let r = evens.reduce(0) {result,each in
    var total = result
    total = total + each
    return total
}
r

let r2 = evens.reduce(0) {$0 + $1}
r2



// Date


