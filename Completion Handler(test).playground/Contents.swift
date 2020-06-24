import UIKit

// completion handler with no input argument

func sampleWithCompletion(completion:@escaping (()-> ())){
    let delayInSeconds = 1.0
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
        completion()
    }
}
//Call the function
sampleWithCompletion { print("after one second")
}


// Completion handler with input argument

enum ReadResult{
    case Successful
    case Failed
    case Pending
}

struct OutpuData {
    var data = Data()
    var result: ReadResult
    var error: Error?
}

func readData(from url: String, completion: @escaping (OutpuData) -> Void) {
    var _data = OutpuData(data: Data(), result: .Pending, error: nil)
    DispatchQueue.global().async {
        let url=URL(string: url)
        do {
            let rawData = try Data(contentsOf: url!)
            _data.result = .Successful
            _data.data = rawData
            
            completion(_data)
        }
        catch let error {
            _data.result = .Failed
            _data.error = error
            completion(_data)
        }
    }
    
}

readData(from: "https://raw.githubusercontent.com/trev/bearcal/master/sample-data-large.json") { (output) in
    switch output.result {
    case .Successful:
        //print(output.data)
        print("success!!!")
        break
    case .Failed:
        print("Failed !!!")
        break
    case .Pending:
        print("Pending ...")
        break
    }
}
