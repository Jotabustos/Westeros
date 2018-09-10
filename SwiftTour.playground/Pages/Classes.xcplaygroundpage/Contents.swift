import UIKit

// Programa que representa Libros

class AnonymousBook {
    
    let title: String
    
    // Swift tiene panico a nil
    // Si no le damos un valor por defecto, tienes que crear un init y darle el valor ahi dentro
    
    init(title: String) {
        self.title = title
    }
}

// Herencia
// En Swift, una clase puede tener UNA o CERO superclases

class Book: AnonymousBook{
    let authors: [String]
    
    // Inicializador designado. SOLO se puede tener un init designado dentro de la clase.
    // No se puede tener un init designado dentro de una extensión
    init(title: String, authors: [String]){
        // Lo primero es inicializar TUS propiedades
        self.authors = authors
        // Una vez que limpias tu propio desorden, llamas a super
        super.init(title: title)
    }
}

extension Book {
    convenience init(title: String, author: String) {
        // SIEMPRE hay que llamar al self.init IMPORTANTE
        // Los inits de conveniencia siempre tienen que llamar al designado
        self.init(title: title, authors: [author])
    }
}

// Si es una subclase, el init designado llama a super

// Un init de conveniencia siempre llama a self.init


// BUENAS PRACTICAS: marcar SIEMPRE las clases como finales. SI luego tienes que extender, se lo quitas
// Las clases finales son aquellas de las que no se puede heredar, es decir, no puede tener subclases

final class BookCharacter  { // REPASA ESTO DEL REPO
    let name: String
    let book: Book
    
    init(name:String,book: Book){
        self.name = name
        self.book = book
    }
}

extension BookCharacter: CustomStringConvertible{
    var description: String {
        return "<\(type(of:self))>: \(name). Appears in \(book.title)"
    }
}

//let c = BookCharacter(name: "John Snow", book: "Cancion de Hielo y Fuego")

// Sobreescritura de metodos
// Override

//class MyView: UIView{
//    override func draw(_ rect: CGReact){
//        // Hago lo mio...
//    }
//}


// Enums
enum Genre {
    case terror
    case sciFi
}

let genre: Genre = .sciFi // REPASARLO BIEN
