//: [Previous](@previous)

import Foundation

// TUPLAS
var httpResponse = ("OK",200)
// Las duplas tienen tipo. En este caso es (String, Int)
dump(type(of: httpResponse))

// httpResponse = (200, "OK") ERROR!!! Tuplas de diferente tipo

httpResponse = ("BAD REQUEST",400)

// Acceso a los componentes de una tupla: por posición

httpResponse.0
httpResponse.1

// Funciones que devuelven más de un valor
func intDiv(_ a:Int, _ b:Int) -> (Int, Int) {
    return ((a/b),(a%b))
}

intDiv(4,2)


typealias HTTPStatus = (code: Int, text: String)
typealias HTTPRequest = String // De momento
typealias HTTPResponse = (body: String, status: HTTPStatus)

func httpServer(request: HTTPRequest) -> HTTPResponse {
    // Aqui seria el codigo de verdad
    // ..
    return ("It works!",(200,"OK"))
}

let response = httpServer(request: "index.html")

// PATTERN MATCHING
let (cociente, resto) = intDiv(5,2)

let result = intDiv(5,2)

// Tuplas de N elementos
// a la tupla de n elementos se le llama n-tupla
(3,4, "abc") // 3-tupla
(3,4) // 2-tupla
(3) // 1-tupla ???? NOO!!! Es el elemento
() // 0-tupla ? SI! Es la nada, como Void

func g(a: Int) {
    print(a)
}

func h(a: Int) -> () {
    print(a)
}

// Ambas funciones hacen lo mismo! LA NADA ES LA TUPLA VACIA. VOID ES ()

//: [Next](@next)
