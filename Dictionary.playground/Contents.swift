import UIKit

//decleare a dictionary
var books:Dictionary<Int, String> = Dictionary<Int, String>()

var books_second = [Int:String]()
var books_third:[Int:String] = [:]


//accessing value

var book:[Int: String] = [1: "swift", 2:"my swift"]

for b in book.values{
    print("Mybook Name:", b)
}
//Note that a Dictionary, unlike an Array, in inherently unordered-that is, there is no guarantee on the order during iteration.
for bookNum in book.keys {
    print("Book number:",bookNum)
}
// outputs:
// Book number: 1
// Book number: 2

//let myallKeys = ["name", "roll", "class", "section"]

//modify dictionary
book.updateValue("hello swift", forKey: 1)
print(book)


/// Merge two dictionaries
extension Dictionary {
    func merge(dict: Dictionary<Key,Value>) -> Dictionary<Key,Value> {
        var mutableCopy = self
        for (key, value) in dict {
            // If both dictionaries have a value for same key, the value of the other dictionary is used.
            mutableCopy[key] = value
        }
        return mutableCopy
    }
}
