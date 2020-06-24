import UIKit

//https://useyourloaf.com/blog/swift-guide-to-map-filter-reduce/
 
let arrStateName = [
    ["Alaska", "Iowa", "Missouri", "New Mexico"],
    ["New York", "Texas", "Washington", "Maryland"],
    ["New Jersey", "Virginia", "Florida", "Colorado"]
]
//2d->1d
let arrFlatStatelist = arrStateName.flatMap({$0})
print(arrFlatStatelist)

//sort
let arrSortedStateList = arrStateName.flatMap({ $0 }).sorted(by: <)

print(arrSortedStateList)


//work with map
struct User {
    var name: String
    var age: Int
    var country: String?
}
//User's information
let user1 = User(name: "John", age: 24, country: "USA")
let user2 = User(name: "Chan", age: 20, country: nil)
let user3 = User(name: "Morgan", age: 30, country: nil)
let user4 = User(name: "Rachel", age: 20, country: "UK")
let user5 = User(name: "Katie", age: 23, country: "USA")
let user6 = User(name: "David", age: 35, country: "USA")
let user7 = User(name: "Bob",age: 22, country: nil)


let arrUser = [user1, user2, user3, user4, user5, user6, user7]

// *********** Map functon ****************

let arrUserName = arrUser.map({ $0.name })
print(arrUserName)

let arrUserAge = arrUser.map({$0.age})

print(arrUserAge)

// Fetch all user country name & ignore nil value.
let arrCountry = arrUser.compactMap({ $0.country })
print(arrCountry)
// ["USA", "UK", "USA", "USA"]


// ********* Filter function ************

let arrUSAUsers = arrUser.filter({ $0.country == "USA" })
print(arrUSAUsers.count)

let arrUserList = arrUser.filter({ $0.country == "USA" }).map({ $0.name })
print(arrUserList)

// *************** reduce function ***********

//Fetch user's total age.
let arrUsertotalage = arrUser.map({ $0.age }).reduce(0, { $0 + $1 })

print(arrUsertotalage)

//Prepare all user name string with separated by comma
let strUserName = arrUserName.reduce("", { $0 == "" ? $1 : $0 + ", " + $1 })
// John, Chan, Morgan, Rachel, Katie, David, Bob


let number = [1,2,3,4]

let newnumber = number.reduce(0, {x,y in
    return x+y
})

//This reduce function will iterate four times.
//Initial value is 0, x is 0, y is 1 → returns x+y . So, initial value or Result becomes 1.
//Initial value or Result is 1, x is 1, y is 2 → returns x+y . So, initial value or Result becomes 3 .
//Initial value or Result is 3, x is 3, y is 3→ returns x+y . So, initial value or Result becomes 6.
//Initial value or Result is 6, x is 6, y is 4→ returns x+y . So, initial value or Result becomes 10
