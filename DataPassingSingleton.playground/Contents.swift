import UIKit

class SingletonClass {
    var sharedInstance: SingletonClass {
          struct Static {
               static let instance = SingletonClass()
          }
          return Static.instance
     }
     var dataText : String = ""
}


class Intern{
    var receiveCommand:String?
    let singleTon = SingletonClass()
   
    func showReceiveCommad(){
         //print(singleTon.sharedInstance.dataText)
        receiveCommand = singleTon.sharedInstance.dataText
        print("Receive Commad From Boss:", receiveCommand ?? "")
    }
}


class Boss{
    var makeCommad:String?
    let singleTon = SingletonClass()
    
    init(makeCommad:String) {
        self.makeCommad = makeCommad
        singleTon.sharedInstance.dataText = makeCommad
    }
    
    
    
}

var bossObject = Boss(makeCommad: "done the job with in 2 hours")

let internObj = Intern()
internObj.showReceiveCommad()
