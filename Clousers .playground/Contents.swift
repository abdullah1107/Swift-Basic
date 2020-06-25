import UIKit

//simple

let sayHello = { print("Hi ! Mamun") }

sayHello()


let addingTwoValue = { (x:Int, y:Int) -> Int in
    return x + y
}
// The type of addInts is "(Int, Int) -> Int"
let result = addingTwoValue(10, 15)
print(result)


enum MyErrors{
    case DivideByZero
}

let divideInts = { (x:Int, y:Int) throws -> Int in
    if y == 0 {
        //throw MyErrors.DivideByZero
    }
    return x / y
}
// The type of divideInts is "(Int, Int) throws -> Int"


// This function returns another function which returns an integer
func makeProducer(x: Int) -> (() -> Int) {
let closure = { x }
    // x is captured by the closure
    return closure
}
// These two function calls use the exact same code, // but each closure has captured different values.
let three = makeProducer(x: 3)
let four = makeProducer(x: 4)
three()  // returns 3
four()  // returns 4
