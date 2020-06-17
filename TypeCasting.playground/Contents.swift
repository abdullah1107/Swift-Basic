import UIKit

// ***** as? *****//
let value:Any = "Mamun"

let name = value as? String

//print(name)

let myage = value as? Double
//print(myage)


// **** as!  *** operator forces a cast //

let myname = value as! String
//print(myname)
//let age = value as! Double
//print(age) crash: "Could not cast value


// ******** solution**************//

let MyName:Any = "Abdullah"

if let name = MyName as? String{
    print(name)
}

if let age = MyName as? Double{
    print(age)
}

// ####################################################
// ****** String - >Int  ****** //

let number = "888.0"

let intValue = NSString(string:number).integerValue
//print(intValue)

// ***** Int -> String *****//
let Intnumebr = 800
let strValue = String(Intnumebr)
//print(strValue)


// #####################################################

// ******* String to Float ********//

let floatvalue = NSString(string: number).floatValue
//print(floatvalue)





// **** Float -> String ******* //

let numebrs = 777.0

let strFloatValue = String(numebrs)
//print(strFloatValue)

let sValue = String(format: "%.3f", numebrs)
//print(sValue)

// optional float to string

let floatVal = String(describing: numebrs)
//print(floatVal)


/// ####################################################

// Downcasting values from JSON

// [String:Any] means
//firstOne -> name, subjects
//secondOne -> String, Array

let json = ["name" : "Mamun", "subjects": ["Maths", "Science", "English", "C Language"]] as [String : Any]

let isName = json["name"] as? String ?? ""
//print(isName)

let subject = json["subjects"] as? [String] ?? []
//print(subject)

// *********************************************************
let response: Any = ["name" : "Muhammad", "subjects": ["Maths", "Science", "English", "C Language"]] // Optional Response

let my_json = response as? [String:Any] ?? [:]

let myName = my_json["name"] as? String  ?? ""
//print(myName)
let mySubjects = my_json["subjects"] as? [String] ?? []
//print(mySubjects)


// **************************************************

//this guard should be inside function

func hello(){
    
    guard  let hello_json = response as? [String: Any] else {return}
    let hello_name = hello_json["name"] as? String ?? ""
    let subjects = hello_json["subjects"] as? [String] ?? []
    print(hello_name)
    print(subjects)
    
}

//hello()


