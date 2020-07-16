import UIKit
import Foundation


func simpleFunction(){
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Response from delayed sample function")
    }
}


//simpleFunction()


//why it is needed
// second print() calling first.....

func sampleFunction2() {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Response from delayed sample function")
    }
    print("After the response from delayed sample function.")
}

//sampleFunction2()


//completion Handeler calling without parameter

// function with() -> Void completion block

func simpleFunction3(completion: @escaping() -> Void){
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Response from delayed sample function")
        completion()
    }
}

//simpleFunction3 {
//    print("calling after print inside simpleFunction3 calling ...")
//}
//or
simpleFunction3(completion: {
    print("calling after method calling...")
})

//Function with (T) -> Void Completion Block
//parametr passing

func sampleFunction4(completion: @escaping(String) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Response from delayed sample function")
        
        completion("hello mamun back plz!!!")
    }
}

sampleFunction4 { (response) in
   print(response)
}

//Function with parameter and (T) -> Void Completion Block
//
//Wnen your function includes a parameter and your closure includes one too

func sampleFunction5(searchString: String, completion:@escaping(String) -> Void) {
    print("You are about to search for \(searchString)")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        
        completion("\(searchString) is one of best programming language")

    }
}

sampleFunction5(searchString: "swift") { (response) in
    print(response)
}

