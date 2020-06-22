import UIKit
//https://stackoverflow.com/questions/34574876/what-is-the-use-of-static-keyword-if-let-keyword-used-to-define-constants-im

// *********************************************
// var : used to create a variable

// let : used to create a constant

// static : used to create type properties with either let or var.[*** These are shared between all objects of a class ***].

//static let key = "API_KEY" : type property that is constant

//static var cnt = 0 : type property that is a variable

//let id = 0 : constant (can be assigned only once, but can be assigned at run time)

//var price = 0 : variable


class MyClass{
    static let typeProperty = "API_KEY"
    static var instancesOfMyClass = 0
    var price = 9.99
    let id = 5

}

let obj = MyClass()
obj.price // 9.99
obj.id // 5

MyClass.typeProperty // "API_KEY"
MyClass.instancesOfMyClass // 0



class Vehicle {
    var car = "Lexus"
    static var suv = "Jeep"
}

// changing nonstatic variable
Vehicle().car // Lexus
Vehicle().car = "Mercedes"
Vehicle().car // Lexus

// changing static variable
Vehicle.suv // Jeep
Vehicle.suv = "Hummer"
Vehicle.suv // Hummer

//When you change the variable for the static property, that property is now changed in all future instances.
