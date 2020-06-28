import UIKit
//https://learnappmaking.com/singletons-swift/

struct UserInfo{
    var firstName:String?
    var lastName:String?
    
    init(firstName:String?, lastName:String?) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var userInfo = UserInfo(firstName: "Muhammad", lastName: "Mamun")// global object

//#############################################################
class Singleton{
    
    static let shared = Singleton() // create instance
    
    private init(){} // this is most important think to use
    //when it use anyone can not use make Singleton Object from outside
    //let obj = Singleton() // not useable
    
    func getUserInfo() -> UserInfo?
    {
        return userInfo
    }
}
// #######################################################
//new class
class User {
    //var obj = Singleton() //this is not possible private init()
    
    func getUser()->UserInfo?{
        return Singleton.shared.getUserInfo()
    }
}

class MyName{
    func getmyName() -> UserInfo? {
        return Singleton.shared.getUserInfo()
    }
}

let objuser = User()
print(objuser.getUser() ?? "")

let myobj = MyName()
print(myobj.getmyName() ?? "")


