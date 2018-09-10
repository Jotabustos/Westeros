import UIKit

// Valores, Bindings, REPL

let answer = 42 // constante inmutable

var aVariable = "Soy una variable y puedo cambiar"

aVariable = "Cambié"

// aVariable = 42 ERROR!!!! Tipado fuerte y estático en Swift

// Podemos definir de forma explícita el tipo de una variable
let name: String = "Jon Snow"

// INFERENCIA DE TIPOS: El compilador es capaz de descubrir, el solito, el tipo de una variable
let name2 = "Tyrion"

// Un alias para un tipo
// typealias NOMBRE_NUEVO = NOMBRE_VIEJO

typealias Integer = Int

let a:Integer = 8

// El simbolo anonimo _
// Cualquier cosa que asignas a este simbolo, se va al garete

let _ = "Robb Stark"
let _ = "Stannis"
// Tanto Robb como Stannis están muertos


// Intro a funciones

func add(x: Int, y:Int) -> Int {
    return x + y
}

add(x: 44, y: 2) // Parametros externos

// Parametros con nombres internos y nombres externos

func franctionOf(numerator n: Double, denominator d: Double) -> Double {
    return n / d
}

franctionOf(numerator: 8, denominator: 2)

// Si no queremos parametros externos usamos el simbolo anónimo
func add42(_ a:Int) -> Int {
    return 42 + a
}

add42(4)

franctionOf(numerator: 30, denominator: 1)
