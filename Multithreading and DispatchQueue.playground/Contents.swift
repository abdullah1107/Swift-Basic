import UIKit
//https://fluffy.es/help-my-app-freezes/#core-thread-queue

// ********** Three types of Queue *****************

//1.The Main dispatch queue (serial, pre-defined)

//2.Global queues (concurrent, pre-defined)

//3.Private queues (can be serial or concurrent, you create them)

// **************************************************

// Global ---------------------->

//statement serial executation
DispatchQueue.global().sync {}
//statement concurent executation
DispatchQueue.global().async {}

//Main -------------------------->

//main thread for serial execation
//DispatchQueue.main.sync {}
//main thread for concurent execation
DispatchQueue.main.async {}

// Privte ------------------------>
// a serial DispatchQueue performs only one task at a time.

let serialQueue = DispatchQueue(label: "swift.serial.queue")

serialQueue.sync {
   print("Task 1 started")
   // Do some work..
   for _ in 0..<5 { print("🔵") }
   print("Task 1 finished")
}

serialQueue.sync {
    print("Task 2 started")
    // Do some work..
    for _ in 0..<5 { print("🔴") }
    print("Task 2 finished")
}
print("######################")
//A concurent queue work done by async pattern

let concurrentQueue = DispatchQueue(label: "swift.concurrent.queue", attributes: .concurrent)
//
concurrentQueue.async {
    print("Task 1 started")
    // Do some work..
    for _ in 0..<5 { print("🔵") }
    print("Task 1 finished")
}
concurrentQueue.async {
    print("Task 2 started")
    // Do some work..
    for _ in 0..<5 { print("🔴") }
    print("Task 2 finished")
}

// Global definations

DispatchQueue.global().sync {
    print("Inside sync")
}
print("Outside sync")
// Console output:
// Inside
// Outside

DispatchQueue.global().async {
    print("Inside async")
}
print("Outside async")
// Potential console output (based on QoS):
// Outside
// Inside


/// two are using .....
//DispatchQueue.global().async {
//  let data = try? Data(contentsOf: URL(string: "https://github.com/fluffyes/AppStoreCard/archive/master.zip")!)
//
//  // jump back to main thread to update the UI
//  // you can use the data downloaded here
//    DispatchQueue.main.async {
//    //self.nameLabel.text = "Zip file downloaded"
//  }
//}


// ###########################################################
enum Color: String {
    case blue = "🔵"
    case white = "⚪️"
}

func output(color: Color, times: Int) {
    for _ in 1...times {
        print(color.rawValue)
    }
}

let starterQueue = DispatchQueue(label: "com.besher.starter", qos: .userInteractive)
let utilityQueue = DispatchQueue(label: "com.besher.utility", qos: .utility)
let backgroundQueue = DispatchQueue(label: "com.besher.background", qos: .background)
let count = 10

starterQueue.async {

    backgroundQueue.async {
        output(color: .white, times: count)
    }

    backgroundQueue.async {
        output(color: .white, times: count)
    }

    utilityQueue.async {
        output(color: .blue, times: count)
    }

    utilityQueue.async {
        output(color: .blue, times: count)
    }

    // next statement goes here
}
