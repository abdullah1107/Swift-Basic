import UIKit

// when a class or method decleare as "final"
// then it can not be override

class Myfather{
    
    final func twoHands()->String{
        return "it belogns to my father"
    }
    
    func property()->String{
        return "now it is mine"
    }
}

class Myself:Myfather{
    
    func myhand()->String{
        return "its belong to me"
    }
    
    //no error
    override func property() -> String {
        return "i also can use it"
    }
   //***********************************
//    override func twoHands()->String{
//        return "can it be myHands"
//    }
   //*************************************
    // here we can see error it can not be override
    //it is only use inside myfather class
}
