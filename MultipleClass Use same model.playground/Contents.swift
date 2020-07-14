import UIKit


struct Book{
    
    let name:String?
    let author:String?
    
    init(name:String?, author:String?){
        self.name   = name
        self.author =  author
    }
}






class Singleton{
    
    static let shared = Singleton()
    
    private init(){}
    
    func getBookInfo() -> [Book]?
    {
        return bookinfo
    }
}

var bookinfo = [Book]()


class FirstClass{
    
    func getdataFromserver(){
        bookinfo = [
        Book(name: "C programming", author: "mamun"),
        Book(name: "Java Programming", author: "abdullah"),
        Book(name: "Python", author: "xyz")]
    }
    
    func getInfoBook()->[Book]?{
        return Singleton.shared.getBookInfo()
    }
}


class SecondClass{
    func anotherGetinfoBook() ->[Book]?{
        return Singleton.shared.getBookInfo()
    }
}


var firstclassobj = FirstClass()
firstclassobj.getdataFromserver()
print(firstclassobj.getInfoBook())

var secondclassobj = SecondClass()
print(secondclassobj.anotherGetinfoBook())
