import Foundation


// Opcionales: son una especie de caja
var name: String?

name = "Jon"

name = nil

// Tenemos que tener mucho cuidado a la hora de leer un opcional
// Si la caja tiene valor, perfecto, todo funciona
// Si hay un nil, la app estalla

// Podemos abrir la caja de dos maneras
// 1. Explicitamente (a.k.a. "por mis cojones")
// 2. Con modales

// 1: utilizando el simbolo de admiracion
//print(name!)

// 2: con modales. Dos sub-maneras de desempaquetarlo

// if let

if let name = name {
    print(theName)
}

// Aqui fuera, name sigue siendo String?

// guard
//guard let name = name else{
//    // Haces otra cosa en caso de que haya nil
//    return
//}
//
//// Aqui fuera name si es de tipo String
//
//print(name)
