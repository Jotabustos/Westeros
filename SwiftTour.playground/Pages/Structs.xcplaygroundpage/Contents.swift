
/*:
 Las structs tienen DOS ventajas sobre las tuplas:
 
 - Los componentes SIEMPRE tienen nombres
 - Pueden tener métodos
 
*/


struct Complejo {
    let x: Double
    let y: Double
    
    init(real: Double, imaginary: Double) {
//        x = real
//        y = imaginary
        (x,y) = (real,imaginary)
    }
    // Cuando creas un inicializador personalizado, el init por defecto que te genera el compilador desaparece
    init(real: Double) {
//        x = real
//        y = 0
        self.init(real: real, imaginary: 0)
    }
    
    init(imaginary: Double){
//        x = 0
//        y = imaginary
        self.init(real:0, imaginary:imaginary)
    }
    
    func magnitude() -> Double {
        return ((x*x) + (y*y)).squareRoot()
    }
}

let a = Complejo(real: 2, imaginary: 3)

let b = Complejo(real: 4)


// Por defecto, TODO en una struct es inmutable

struct Point {
    var x: Double
    var y: Double
    
    // Asi le dices que va a ser mutable
    mutating func moveTo(x: Double, y:Double){
        self.x = x
        self.y = y
    }
}

var p1 = Point(x: 2, y: 4)

p1.moveTo(x: 6, y: 4)
p1.x
p1.y

// Las structs NUNCA SE COMPARTEN (entre dos variables).
// Esto es una de las principales diferencias que tienen con las clases

// Las instancias de clases si se comparten


var x1: Int = 42
var x2 = x1 // Aqui se hizo una copia

x1 = 0
x2

// x2 no comparte la misma dirección de memoria que x1

// SPOILER: las instancias de clases si se comparten

// Las struct NO tienen HERENCIA
// Como le añadimos superpoderes a las structs? Mediante extensiones y protocols

// En el caso de las clases, mediante extensiones, Herencia y tambien protocols
