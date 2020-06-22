import UIKit

// ******* typealias for empty closures
typealias Handler = () -> Void
//typealias Handler = () -> ()

// when we use this key word (typealias) that means a variable type is also same as that variable



//struct Receipt {
//    let totalCosts: Double
//}
//
//typealias Dollar = Double
//
//struct Receipt {
//    let totalCosts: Dollar
//}



// *********** typealias for Tuples

typealias PersonTuple = (name: String, age: Int, address: String)

func getPerson(for id: Int) -> PersonTuple { //fetch from db, etc
 return ("mamun", 27, "Feni")
    

}

print(getPerson(for: 01))


// ********* Is a typealias a new type?
typealias Dollar = Double
typealias Euro = Double

struct Receipt {
    let totalCosts: Dollar
}
extension Dollar {
    func toEuro() -> Euro {
        return self * 0.896
    }
}

let receipt = Receipt(totalCosts: 10)
receipt.totalCosts.toEuro() // 8.96

let doubleNumber: Double = 10
doubleNumber.toEuro() // 8.96
