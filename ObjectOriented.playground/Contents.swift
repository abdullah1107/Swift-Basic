import UIKit
import Foundation

class Employee {
    var givenName: String
    var surname: String

    init(givenName: String, surname: String) {
        self.givenName = givenName
        self.surname = surname
    }

    func calculatePay() -> Float {
        fatalError("Subclasses must override calculatePay")
    }
}


class SalariedEmployee: Employee {

    var salary: Float

    init(givenName: String, surname: String, annualSalary: Float) {
        salary = annualSalary
        super.init(givenName: givenName, surname: surname)
    }

    override func calculatePay() -> Float {
        return salary/12     // Note: No call to super.calculatePay
    }

}

let object = SalariedEmployee(givenName:"mamun", surname:"abdullah",annualSalary:150.0)
print(object.calculatePay())
