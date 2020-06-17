import UIKit

// FOR Loop section ///
//****************simple for loop ***********//
for i in 0..<3{
    print(i)
}
//also same
for i in 0...2{
    print(i)
}

//*************simple array****************/////
let number = [1,2,3,4,5]

for num in number{
    print(num)
}

//same as
let names = ["mamun", "maruf", "mahmud", "mimi", "mamu"]

for name in names{
    print(name)
}


for (index, name) in names.enumerated(){
    print("index:", index, "name:", name)
}


//************ iteration over a dictionary************////

 ////dictionary iteration is not work sequentially

let nameages = ["mamun": 27, "maruf": 23, "mahmud": 18]

for (name, age) in nameages{
    print(name, "is", age, "years old")
}




//****************reversed loop******************//
for i in (0..<3).reversed() {
    print(i)
}
for i in (0...2).reversed() {
    print(i)
}

// ************custom  stride loop ***************//
for i in stride(from: 4, to: 0, by: -2) {
    print(i)
}
for i in stride(from: 1, through: 4, by: 2) {
    print(i)
}

//*********** For loop in filtering  (where)********

for i in 1..<5 where i % 2 == 0{
    print(i)
}
//2
//4

//***** same as//***** /////
let getnames = ["mamun", "shakil", "fahim", "maruf"]

for n_ame in getnames where n_ame.contains("m"){
    print(n_ame)
}


 //*********** For loop in filtering  (case)********

let points = [(5, 0), (31, 0), (5, 31)]
for case (let x, 0) in points {
    print("point on x-axis:",x)

}

// same
let optionalNumbers = [31, 5, nil]
for case let number? in optionalNumbers {
    print(number)
}
//31
//5


// ********repeat-while loop ***********///

var i: Int = 0
repeat {
    print(i)
    i += 1
} while i < 3
//// 0
//// 1
//// 2
//// like c++ do while loop//////////

//// **************For each loop **************//

let collections = [1,2,3,4,5]

collections.forEach{
    print($0)
}

let againcollections = [10,9,8,7,6]
againcollections.forEach { number in
    print(number)
}


