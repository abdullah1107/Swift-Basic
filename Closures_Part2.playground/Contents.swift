import UIKit

//https://github.com/cupnoodle/fluffyes/blob/master/14-return-value-closure.md


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


//part 2

// no need to define parameter type again inside the closure parameter list
// since we already inform the compiler the type of the function explicitly
// (Data?, URLResponse?, Error?) -> Void
// compiler will know data is Data? type, response is URLResponse? type and error is Error? type
// according to order
let dataTaskClosure : (Data?, URLResponse?, Error?) -> Void = { data, response, error in
    guard error == nil else {
        print ("error: \(error!)")
        return
    }
            
    guard let content = data,
    let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
        print("Not containing JSON")
        return
    }
}
        
//let networkTask = URLSession.shared.dataTask(with: url, completionHandler: dataTaskClosure)


//  part 3


// similar to above, since completionHandler parameter expects (Data?, URLResponse?, Error?) -> Void type
// we can omit the parameter type in the closure, compiler will assume data has Data? type, response has URLResponse? type and error has Error? type


//
//let networkTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
//    guard error == nil else {
//        print ("error: \(error!)")
//        return
//    }
//            
//    guard let content = data,
//    let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
//        print("Not containing JSON")
//        return
//    }
//})
