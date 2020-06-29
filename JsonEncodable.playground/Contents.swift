import UIKit

//https://medium.com/@manojkarkie/encodable-and-decodable-in-swift-4-747328a7c7c5


// encodable: The process Converting your custom type instances to other representation such as JSON and pList is known as Encoding.

//decodable:The process of converting data in representation such as JSON or pList to instance of your custom type


struct EndPoint{
    static let registerUser = "http://dummy.restapiexample.com/api/v1/create"
}

//i don't using mapping
struct UserRegister:Encodable,Decodable{
    let name:String?
    let salary:String?
    let age:String?
}

struct UserResponse:Decodable{
    let status:String?
    let data: UserRegister
}



func requestServerwithPost(){
    // segment 1
    guard let url = URL(string: EndPoint.registerUser) else { return }
    var urlRequest = URLRequest(url: url)
    
    
    // segment 2 this is what i need!!! using Encodable
    let requestModel = UserRegister(name:"abdullah", salary:"5000", age: "28")
    
    do {
        let requestBody = try JSONEncoder().encode(requestModel)
        //segment 3
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
    }
    catch let error {
        print(error.localizedDescription)
    }
    
    
    //segment 4
    //response
    URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
        
        if(data != nil && data?.count != 0)
        {
            do {
                let response = try JSONDecoder().decode(UserResponse.self, from: data!)
                debugPrint(response.data)
                guard let message = response.status else{return}
                print(message)
            }
            catch let decodingError {
               debugPrint(decodingError)
            }
        }
    }.resume()
    
}
requestServerwithPost()
