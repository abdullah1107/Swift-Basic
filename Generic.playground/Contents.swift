import UIKit

//generic Function basic
func printing<T>(a:T){
    print(a)
}

printing(a: 2)
printing(a: "please print me!")


//ex:2 with address

func swapingFunction<T>(_ a: inout T, _ b: inout T){
    let temp = a
        a = b
        b = temp
}
var val1 = "world"
var val2 = "hello"

swapingFunction(&val1, &val2)
print(val1,val2)


// two generic parameter in samefunction

func printingTwoGenericValue<T, U>(a:T, b:U){
   print("T -> \(a) and U ->\(b)")
}
printingTwoGenericValue(a: 54, b: "swift generic Type")


//class method Class Type
class Person{
    var name:String
    var age:Int
    
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
}

func PrintDetails<T:Person>(a:T, b:T){
    //a and b are both object
    print("Now obj a -> name \(a.name) and age \(a.age)")
    print("Now obj b -> name \(b.name) and age \(b.age)")
}

var person1 = Person(name:"Mamun", age: 27)
var person2 = Person(name: "abdullah", age: 26)

PrintDetails(a: person1, b: person2)

// Equatable function

func compareAandB<T: Equatable>(a:T, b:T){
   print("a == b ? \(a == b)")
}
compareAandB(a: 2, b: 3)
compareAandB(a: "Hi", b: "Hi")
//can be used extention Generic


class MyGenericClass<T>{
    var value:T
    
    init(value:T) {
        self.value = value
    }
    
    func getValue() ->T{
        return self.value
    }
    
    func setValue(value:T) {
        self.value = value
    }
}

let genericClassStirng = MyGenericClass<String>(value: "My String Value")
let genericClassInt    = MyGenericClass<Int>(value: 54)

print(genericClassStirng.getValue())
print(genericClassInt.getValue())
