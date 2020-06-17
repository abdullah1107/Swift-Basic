import UIKit

//an optional value either contains a value or
//contains nil to indicate that value is missing


//let str1 = "42"
//let num1: Int? = Int(str1) // 42
//let str2 = "Hello, World!"
//let num2: Int? = Int(str2) // nil

//using if let sample 1
var number: Int?

if let unwrappedNumber = number {
    print("number: \(unwrappedNumber)")
}
else {
    print("number was not assigned a value")
}

//sample :2
let num: Int? = 10 // or: let num: Int? = nil
if let unwrappedNum = num {
    print("num was not nil: \(unwrappedNum + 1)")
} else {
    print("num was nil")
}

////////////////////////////////////////////////////////////////////////////////////////////////
//using guard
var value:Int?

func testfunction(){
    //value = 15
    guard let unwrappedNumber = value else {
        print("number doesnot exist")
        return
        
    }
    print("number: \(unwrappedNumber)")
}

testfunction()


