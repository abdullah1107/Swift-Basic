import UIKit
//https://www.hackingwithswift.com/example-code/language/whats-the-difference-between-a-static-variable-and-a-class-variable

class Person {
    static var count: Int {
        return 250
    }

    class var averageAge: Double {
        return 30
    }
}


class Student: Person {
    // THIS ISN'T ALLOWED
    // override static var count: Int {
    //    return 150
    // }

    // THIS IS ALLOWED
    override class var averageAge: Double {
        return 19.5
    }
}
