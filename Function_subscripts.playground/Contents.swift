import UIKit
////Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence
struct daysofWeek{
    
    var days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    subscript (index:Int)->String{
        get {
            return days[index]
        }
        set{
            days[index] = newValue
        }
    }
}

//var week = daysofWeek()
//print(week[0])
//week[0] = "Sunday"
//print(week[0])


//subscript can take any number of parameter and these input parameter can be anyType

struct Food{
    enum mealTime{
        case breakfast, lunch, dinner
    }
    
    var meals:[mealTime:String] = [:]
    
    subscript (type:mealTime)->String? {
        
        get{
            return meals[type]
        }
        set{
            meals[type] = newValue
        }
        
    }
}

//var diet = Food()
//diet[.breakfast] = "Ruti + bazi"
//
//diet[.dinner] = "Rice + dal + Fish"
//
//print("Break fast with",diet[.breakfast] ?? "")


func maths(number: Int) -> (times2: Int, times3: Int) {
    let two = number * 2
    let three = number * 3
    return (two, three)
}
//let resultTuple = maths(number: 5)
//print(resultTuple)

////  / / **************Nested function *************** / / / /

func getting_message(name:String){
    
    func printmessage(){
        print("Hello !!!", name)
    }
    printmessage()
}
//getting_message(name: "Abdullah Al Mamun")

// // second exp: the outer function is operate(), with return value of type Function (Int,Int) -> Int

func operate(with symbol:String)->(Int, Int)->Int{
    
    func add (num1:Int, num2:Int)->Int{
        return num1 + num2
    }
    func subtruct(num1:Int, num2:Int)->Int{
        if num1>num2{
            return num1 - num2
        }
        else if num2>num1{
            return num2-num1
        }
        else{
            return 0
        }
    }
   let returnvalue = (symbol == "+") ? add :subtruct
   return returnvalue
}
let operation = operate(with: "+")
//let result = operation(10,5)
//print(result)


////********Trailing clousure ******** //
////  when last parameter of the function is clousure

func loadData(id: String, completion:(_ nameoftheUser: String)-> ()){
    completion("Muhammad Abdullah Al Mamun")
}

//loadData(id: "123") { name in
//    print(name)
//}



