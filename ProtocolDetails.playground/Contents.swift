import UIKit

protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var airspeedVelocity: Double { get }
}

protocol methodProtocol{
    func helloprotocol(type:String)->String?
    func customprintProtocol()
}


class FlappyBird: Bird, Flyable,methodProtocol{
    
    func helloprotocol(type: String) -> String? {
        
        return "inside\(type)"
    }
    
    
    func customprintProtocol() {
        print("this is inside!!!")
    }
    
    
    
    let name: String = ""
    let flappyAmplitude: Double = 0.0
    let flappyFrequency: Double = 0.0
    let canFly = true
    
    var airspeedVelocity: Double {
        3 * flappyFrequency * flappyAmplitude
    }
    
    
    
}

//let obj = FlappyBird()
//print(obj.customprintProtocol())
//print(obj.helloprotocol(type: "mamun how are you?") as Any)





//protocol Queue {
//   // associatedtype ItemType
//    var count: Int { get }
//    func push(_ element: Int)
//    func pop() -> Int
//}
//
//class Container: Queue {
//    private var items: [Int] = []
//
//    var count: Int {
//        return items.count
//    }
//
//    func push(_ element: Int) {
//        items.append(element)
//    }
//
//    func pop() -> Int {
//        return items.removeFirst()
//    }
//
//}

protocol customProtocol{
    func dataPassingFunction(dataString:String)
}

class FirstController:customProtocol{
    
    func dataPassingFunction(dataString:String) {
        print("data:",dataString)
    }
    
    func datapass(temp:String){
        print(temp)
    }

}

class SecondController{
    
    var mainViewController = FirstController()
    var delegate:customProtocol?
    
    func fromsecondControllerMethod(){
        //mainViewController.datapass(temp:"inside second one")
        //mainViewController.dataPassingFunction(dataString: "tempdata")
        delegate?.dataPassingFunction(dataString: "it is from second Class")
    }
    
}

//var obj = SecondController()
//obj.fromsecondControllerMethod()


protocol MessageDelegate{
    func shareMessage(msg: String)
}

class Receiver: MessageDelegate{

    var rmsg:String?

    func shareMessage(msg:String) {
        rmsg = msg
        print(msg)
    }
}



class Sender{

    
    var sendermessage:String?

    var delegate: MessageDelegate?

    func sendMessage() {
        delegate?.shareMessage(msg: sendermessage ?? "")
    }
}


var sender = Sender()
sender.sendermessage = "my name is mamun"
var receiver: Receiver = Receiver()

//give Sender it's Receiver
sender.delegate = receiver

//Trigger the sender to send message to it's Receiver
sender.sendMessage()




