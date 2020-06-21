import UIKit
//https://www.journaldev.com/19619/swift-memory-management-automatic-reference-counting

//class Person{
//    var name:String
//
//    init(name:String) {
//        self.name = name
//    }
//
//    deinit {
//        print("calling deinit....")
//    }
//}
//
//func callingfunc(){
//var obj:Person? = Person(name: "mamun") // reference count 1
//var ref:Person? = obj  // reference count 2
//ref = nil
//obj = nil
//
//}
//
//callingfunc()


// ******************************************************************
// a Person had a (phone, watch , laptop .... ) they all connect to that Person  if this objects (strongly) connect to that Person. Person object can not be nil


class Student{
    
    var name:String
    var phone:Phone?
    
    init(name:String, phone:Phone?) {
        self.name = name
        self.phone = phone
    }
    deinit {
         print("the student name is \(name) deinitialize....")
    }
}


class Phone {
    
    var phoneName:String
    //var owner:Student? //strongly reference to Student
    weak var owner:Student?
    
    init(phoneName:String, owner:Student?) {
        self.phoneName = phoneName
        self.owner = owner
    }
    
    deinit {
        print("the name of \(phoneName) is also deinitialize...")
    }
}

var studentobj:Student? = Student(name: "Mamun", phone: nil)
var phoneobj :Phone? = Phone(phoneName: "Samsung", owner: nil)
//studentobj = nil
//phoneobj = nil

//print
//the student name is Mamun deinitialize....
//the name of Samsung is also deinitialize...

//here optional nil handle the metter

//###########################################

//if we are strongly reference to (Student and Phone )


studentobj?.phone = phoneobj
phoneobj?.owner = studentobj


//studentobj = nil


// print
//nothing..........
//##################################################

//now Student strongly refer to Phone but
//Phone is weakly refer to Student

//then weak var student:Student?
// what happend
//studentobj = nil
//print
//the student name is Mamun deinitialize....

//so object can be release

//if i print
//studentobj = nil
//print(phoneobj?.owner)

//means momory relese






