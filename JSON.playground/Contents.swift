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



//readJson()
//
//let json = """
//{
//"name":"Muhammad",
//"student":"CSE",
//"project":
//    [
//        {
//        "id": "1",
//        "pname":"iOS"
//        },
//        {
//        "id": "2",
//        "pname":"Django"
//        }
//    ]
//}
//"""
//
//
//extension String {
//    func convertToDictionary() -> [String: Any]? {
//        if let data = data(using: .utf8) {
//            return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//        }
//        return nil
//    }
//}
//
//
//if let jsonDict = json.convertToDictionary() {
//
//    if let item1 = (jsonDict["project"] as? [[String: Any ]])? [ 0 ] {
//        print(item1)
//    }
//    if let item2 = (jsonDict["project"] as? [[String: Any ]])? [ 1 ] {
//        print(item2)
//    }
//}

let my_json = """
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


extension String {
    func convertToDictionary() -> [String: Any]? {
        if let data = data(using: .utf8) {
            return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        }
        return nil
    }
}


if let jsonDict = my_json.convertToDictionary() {

    for (key, _) in jsonDict {
        
        if let items = (jsonDict[key] as? [[String: Any]]) {
                
            for subKey in items {

                print(subKey["pname"]!)
            }
        }
    }
}

// json
let successJsonData = """
{
    "success": true,
    "data": {
        "name": "mamun",
        "email": "infinityflow1107@gmail.com"
    },
    "errorMessage": "no error",
    "code": 200
}

""".data(using: .utf8)



let failureJsonData = """

{
    "success": false,
    "data": "some error occured",
    "errorMessage": "Invalid credentials",
    "code": 401
}

""".data(using: .utf8)


struct UserResponse: Decodable {
    let success: Bool?
    let data: User?
    let message: String?
    let code: Int?
}

// MARK: - User
struct User: Decodable {
    let name, email: String?
}

do {

    let result = try JSONDecoder().decode(UserResponse.self, from: successJsonData!)
    debugPrint(result.data?.email ?? "")

} catch let error {
    debugPrint(error)
}
