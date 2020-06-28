import UIKit

//1st.....
let numbers :[Int] = [1,2,3,4]

func convertToString() -> [String]
{
    var result : [String] = []
    
    for value in numbers
    {
        result.append(String(value))
    }
    
    return result
}

debugPrint(convertToString())

func convertToStringUsingMap() -> [String]
{
    return numbers.map {String($0)}
}
//end of first exp

/*Example 2: Printing multiplication table using Map function*/

let multiplicationNumbers = [1,2,3,4,5,6,7,8,9,10]

func multiplication(value: Int) -> [Int]
{
    return numbers.map {$0 * value}
}

debugPrint(multiplication(value: 2))

// end of 2nd exp

//3rd.....................

struct Employee{
    
    var name:String?
    var salary:Double
}

func getConstantEmployee() ->[Employee]{
    return [Employee(name: "Mamun", salary: 75000), Employee(name: "Maruf", salary: 80000)]
}

func userEmployeeInfo(){
    let employee = getConstantEmployee()
    
    let result = employee.map { employee in
        employee.salary + 2500
    }
    debugPrint(employee)
    debugPrint(result)
}

userEmployeeInfo()
