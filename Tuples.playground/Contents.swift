import UIKit

//first example
let tuple = ("one", 2, "three")

print(tuple.0)
print(tuple.1)
print(tuple.2)


/// second one

let nameTuple = (first: 1, middle: "second", last: 3)
print(nameTuple.first)


//third one

var number:(first: Int?, second: String?, last :Int?)?

number = (1, "two", 3)

print(number?.second ?? "")

//forth exp

let myName = ("Muhammad", "Mamun")
let (firstName, lastName) = myName
print(firstName, lastName)

let (_, tempLast) = myName
print(tempLast)


//// ****************Tuple as the return value function**********
func tupleReturn()->(Int, String){
    return (0, "Hello")
}


let simpleT = tupleReturn()
print(simpleT.0, simpleT.1)



//// another case
func tupleReturnwithArgument()->(firstName:String?, lastName:String?){
    return ("Muhammd", "Mamun")
}
let simpleType = tupleReturnwithArgument()
print(simpleType.0 ?? "" , simpleType.1 ?? "")



////****************Tuples as Case in Switch*******************
let switchTuple = (firstCase: true, secondCase: false)

switch switchTuple {
case (true, false):
    // do something
    print("string0")
    break
    
case (true, true):
    // do something
    print("string1")
    break
case (false, true):
    // do something
    print("string2")
    break
case (false, false):
    // do something
    print("string3")
    break
}

