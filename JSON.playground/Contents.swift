import UIKit

let myjsonValue = """
{
"title": "Optionals in Swift explained: 5 things you should know",
"url": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
"category": "swift",
"views": 47093
}
"""

struct BlogPost: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    
    let title: String
    let url: URL
    let category: Category
    let views: Int
}

let jsonData = myjsonValue.data(using: .utf8)!
let blogPost: BlogPost = try! JSONDecoder().decode(BlogPost.self, from: jsonData)

//print(blogPost.title)


let myjson = """
{
"name":"Muhammad",
"student":"CSE",
"project":
    [
        {
        "id": "1",
        "pname":"iOS"

        },
        {
        "id": "2",
        "pname":"Django"
        }
    ]
}
"""

func readJson(){
    do {
        
        //convert into data bytes
        guard let jsonData = myjson.data(using: String.Encoding.utf8) else {
            fatalError("couldn't encode string as UTF-8")
        }
        
        //data to jsonObject
        // Convert JSON from NSData to AnyObject
        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
        //print(jsonObject)
        
        
        //jsonObject into Dictionary
        if let dictionary = jsonObject as? [String:Any]{
            if let nameofStudent = dictionary["name"] as? String{
                print(nameofStudent)
            }
            guard let studentofGraduation = dictionary["student"] as? String else{return}
            print(studentofGraduation)
            
            guard let totalProject = dictionary["project"]else {return}
            //print((totalProject as AnyObject))
            guard let totalProjectCounter = ((totalProject as AnyObject).count) else{return}
            print(totalProjectCounter)
        
        }//end of dictionary block
        
       
    } catch {
        print("error reading JSON: \(error)")
        
    }
}



readJson()




//writing json



//    do {
//    // Convert object to JSON as NSData
//    let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
//    print("JSON data: \(jsonData)")
//    // Convert NSData to String
//    let jsonString = String(data: jsonData, encoding: .utf8)!
//    print("JSON string: \(jsonString)") } catch {
//        print("error writing JSON: \(error)") }
//}
