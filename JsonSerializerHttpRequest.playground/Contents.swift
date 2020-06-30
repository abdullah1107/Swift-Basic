import UIKit

struct EndPoint{
    static let registerUser = "http://dummy.restapiexample.com/api/v1/create"
    static let getAlluser = ""
}


func postRegisterUser()
{
    //code to register user
    var urlRequest = URLRequest(url: URL(string: EndPoint.registerUser)!)
    urlRequest.httpMethod = "post"
    
    let dataDictionary = ["name":"abdullah", "salary":"10k","age":"28"]
    
    
    //section one
    do {
        let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
        
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
    } catch let error {
        debugPrint(error.localizedDescription)
    }
    //section 2
    
    URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
        
        if(data != nil && data?.count != 0)
        {
            let response = String(data: data!, encoding: .utf8)
            print(response!)
            //debugPrint(httpUrlResponse)
        }
    }.resume()
}

//calling function
postRegisterUser()



//get data from server without Model

func GetUserFromServer()
{
    var urlRequest = URLRequest(url: URL(string: EndPoint.getAlluser)!)
    urlRequest.httpMethod = "get"

    URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
        if(data != nil && data?.count != 0)
        {
            let response = String(data: data!, encoding: .utf8)
            debugPrint(response!)
        }
    }.resume()
}
