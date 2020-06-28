import UIKit


func printGoodMorningMessage(isMorning: Bool, name:@autoclosure () -> String){
    //debugPrint("printGoodMorningMessage")
    if(isMorning)
    {
        debugPrint("Good morning \(name())")
    }
}

func assignName(name: String) -> String{
    debugPrint("assignName is called")
    return name
}

//printGoodMorningMessage(isMorning: false) { () -> String in
//    assignName(name: "Mamun")
//}

printGoodMorningMessage(isMorning: true, name: assignName(name: "Mamun"))

printGoodMorningMessage(isMorning: true, name: assignName(name: "Maruf"))
//printGoodMorningMessage(isMorning: false, name: assignName(name: "appQube"))

