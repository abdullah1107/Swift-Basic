import UIKit

//do {
//    try expression
//    // statements
//} catch pattern{
//    //statements
//}


enum ValidationError: Error {
    case tooShort
    case tooLong
    case invalidCharacterFound(Character)
}
//error handiling
func validate(username: String) throws {
    guard username.count > 5 else {
        throw ValidationError.tooShort
    }

    guard username.count < 15 else {
        throw ValidationError.tooLong
    }

    for character in username {
        guard character.isLetter else {
            throw ValidationError.invalidCharacterFound(character)
        }
        //print(character.isLetter)
    }
}

func userDidPickName(_ username: String) {
    do {
        try validate(username: username)

        // that no error was thrown, and the validation passed.
        print(username)

    } catch let error {

        print(error)
    }
}

userDidPickName("mam")


// ///////////////////////////////////////
enum UserDtails:Error{

    case non_validage

    case non_validname
}

func User(age:Int, name:String) throws{

    guard age > 0 else{
        throw UserDtails.non_validage
    }

   guard name.count > 0 else{
        throw UserDtails.non_validname
    }

}

do {
    try User(age: 15, name: "")
} catch let error {
    print(error)
}



 // //////////////////// Error Handiling

//let contents: Data?
//let someURL = "https://google.com"
//do {
//    contents = try Data(contentsOf:someURL)
//} catch {
//    contents = nil
//}
 ////////////////////////////////////

do {
    let encrypted = try encrypt("secret information!", withPassword: "12345")
    print(encrypted)
} catch {
    print("Something went wrong!")
}

enum EncryptionError: Error {
    case empty
    case short
}

func encrypt(_ str: String, withPassword password: String) throws -> String {
    // complicated encryption goes here
    guard password.count > 0 else { throw EncryptionError.empty }
    guard password.count >= 5 else { throw EncryptionError.short }
    let encrypted = password + str + password
    return String(encrypted.reversed())
}




do {
    let encrypted = try encrypt("secret information!", withPassword: "01812")
    print(encrypted)
} catch EncryptionError.empty {
    print("You must provide a password.")
} catch EncryptionError.short {
    print("Passwords must be at least five characters, preferably eight or more.")
} catch {
    print("Something went wrong!")
}

enum ErrortoHandle:Error{
    case nameisEmpty
}

class Human{
    var name:String?
    init(name:String?) throws{
        guard let name = name else{
            throw ErrortoHandle.nameisEmpty
        }
        self.name = name
        print("Name:", self.name ?? "")
    }
}
do{
    _ = try Human(name: "")
    
}catch let error{
    print(error)
}

let object1 = try? Human(name: "mamun")
print("Object1",object1?.name ?? "")


//keywords: throws
//          throw
//          do, try, catch
