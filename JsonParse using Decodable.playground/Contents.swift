import UIKit


struct Car:Decodable{
    
    let name:String
    let horsepower: Int
}

//parse json into single structure
//{
//  "name": "Toyota Prius",
//  "horsepower": 1
//}
//url : https://api.jsonbin.io/b/5ef9c9aabb5fbb1d2560c9cd

func parseJsonSingleStructure(){
    guard let url = URL(string:"https://api.jsonbin.io/b/5ef9d6f80bab551d2b68adce") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        //ensure there is no error for this HTTP respose
        guard error == nil else{
            print("error:\(error!)")
            return
        }
        
        // data return from this HTTP resonse
        
        guard let data = data  else {
            print("No data")
            return
        }
        
        // parse json into Car struct using JSODecoder
        
        guard let car = try? JSONDecoder().decode(Car.self, from: data) else {
            print("Error: Couldn't decode data into car")
            return
            
        }
        print("car is:", car)
    }//execute the HTTP request
    task.resume()
}

//parseJsonSingleStructure()


// ********* Parse JSON into array of structs/objects

//[
//  {
//    "name": "Toyota Prius",
//    "horsepower": 1
//  },
//  {
//    "name": "Tesla 3",
//    "horsepower" : 3
//  },
//  {
//    "name": "Ferrari",
//    "horsepower" : 999
//  }
//]

//https://api.jsonbin.io/b/5ef9dcfebb5fbb1d2560d335
func parseIntoArray(){
    guard let url = URL(string: "https://api.jsonbin.io/b/5ef9dcfebb5fbb1d2560d335") else{return}
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        // ensure there is no error for this HTTP response
        guard error == nil else {
            print ("error: \(error!)")
            return
        }
        
        // ensure there is data returned from this HTTP response
        guard let data = data else {
            print("No data")
            return
        }
        
        // Parse JSON into array of Car struct using JSONDecoder
        guard let cars = try? JSONDecoder().decode([Car].self, from: data) else {
            print("Error: Couldn't decode data into cars array")
            return
        }
        
        for car in cars {
            print("car name is \(car.name)")
            print("car horsepower is \(car.horsepower)")
            print("---")
        }
    }
    
    // execute the HTTP request
    task.resume()
}

//parseIntoArray()

//Parse JSON from non-root key

// https://api.jsonbin.io/b/5ef9e19a0bab551d2b68b307

//{
//    "cars": [
//    {
//    "name": "Toyota Prius",
//    "horsepower": 1
//    },
//    {
//    "name": "Tesla 3",
//    "horsepower" : 3
//    },
//    {
//    "name": "Ferrari",
//    "horsepower" : 999
//    }
//    ]
//}
func parseJSONfromnonroot(){
    
    guard let url = URL(string: "https://api.jsonbin.io/b/5ef9e19a0bab551d2b68b307")else{return}
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        // ensure there is no error for this HTTP response
        guard error == nil else {
            print ("error: \(error!)")
            return
        }
        
        // ensure there is data returned from this HTTP response
        guard let data = data else {
            print("No data")
            return
        }
        
        // Parse JSON into Dictionary that contains Array of Car struct using JSONDecoder
        guard let carsArrDict = try? JSONDecoder().decode([String: [Car]].self, from: data) else {
            print("Error: Couldn't decode data into dictionary of array of cars")
            return
        }
        
        // if you are sure the key is "cars"
        let cars = carsArrDict["cars"]!
        
        for car in cars {
            print("car name is \(car.name)")
            print("car horsepower is \(car.horsepower)")
            print("---")
        }
    }
    
    // execute the HTTP request
    task.resume()
}

//parseJSONfromnonroot()

//let carOne = Car(name: "Tai Lopez Lamborghini", horsepower: 88)
//let carTwo = Car(name: "Toyota Highlander", horsepower: 20)
//var carDict:[Int: Car] = [1: carOne, 2: carTwo]


//let carOne = Car(name: "Tai Lopez Lamborghini", horsepower: 88)
//let carTwo = Car(name: "Toyota Highlander", horsepower: 20)
//var carArrayDict:[String: [Car]] = ["cars": [carOne, carTwo]]
