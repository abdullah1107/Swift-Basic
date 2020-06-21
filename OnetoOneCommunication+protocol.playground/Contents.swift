import UIKit

// it is receiver class and take message from boss
class Employee:Bossorder{
    
    var bossmessage:String?
    
    func shareMessage(msg: String) {
        bossmessage = msg
        print(bossmessage ?? "___")
    }
    
    
}
var employee:Employee = Employee()



// second class where boss give an order it is a sender class
protocol Bossorder{
    func shareMessage(msg: String)
}
class Boss{
    
    var message:String
    var bossorderdelegate:Bossorder?
    
    init(message:String) {
        //print("hello")
        self.message = message
        //print(self.message)
       
    }
    func callingfunc(){
        bossorderdelegate?.shareMessage(msg: message)
    }
    
}

var boss:Boss = Boss(message: "have a metting 5 pm")
boss.bossorderdelegate = employee
//SVController.delegate = self
boss.callingfunc()




