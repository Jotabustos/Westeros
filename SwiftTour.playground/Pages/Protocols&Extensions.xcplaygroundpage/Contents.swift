import Foundation


/*
 EXTENSIONES: Como las categorias de Objective C
 Son un mecanismo para:
 1) Añadir funcionalidades a una clase/struct ya existente
 2) Modularizar clases o structs
 
 */

extension Int{
    func invert() -> Int {
        return -self
    }
}

8.invert()


// Que cosas NO se pueden añadir a una extensión

/*
 - NADA que pueda cambiar el layout de memoria del objeto (Añadir propiedades)
 - Ciertos tipos de inits (pánico a nil)
 
 */

/*
Esto no lo podemos hacer, porque añadimos mas bytes de memoria
 
 extension Int{
 let a: Double
 }
 
 */


struct Complex {
    let x: Double
    let y: Double
    
}

extension Complex {
    // Propiedad COMPUTADA: se evaluan sobre la marcha. Tienen un getter y un setter
    
    var magnitude: Double {
        get {
            return ( (x*x) + (y*y) ).squareRoot() // No añades nada, sino que usas cosas ya guardadas
        }
    }
}


/*
 PROTOCOLS: Similares a los interfaces de Java o los protocols de Objective C
 
 Obligatorio:
 - CustomStringConvertible:
 - Equatable
 - Hashable
 - Comparable
 
 */

extension Complex: CustomStringConvertible {
    var description: String { // Si no pones nada, es el getter. Asi que si no hay setter se deja en blanco
        return "\(x) + \(y)j"
    }
}

let c = Complex(x:23, y:-8)

let d = Complex(x:4, y:7)

print(c)

extension Complex: Equatable {
    
    static func == (lhs: Complex, rhs: Complex) -> Bool {
        return (lhs.x, lhs.y) == (rhs.x, rhs.y)
    }
}

d == c

// Podemos crear nuestros propios protocolos

protocol Answerable { // Los protocolos son como un contrato, no se tira codigo. Se ponen unas normas
    var answer: Int {
        get
    }
}

extension Answerable {
    var answer: Int { // Implementación por defecto
        return 8
    }
}

extension String: Answerable{
    
}

"Givemeanumber".answer

extension Complex: Answerable{
    var answer: Int {
        return 42
    }
}

c.answer

