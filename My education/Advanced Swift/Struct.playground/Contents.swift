import Cocoa
// Ссылочный тип Reference Type
class Person {
    let name: String
    var phone: Int
    
    init(name: String, phone: Int) {
        self.name = name
        self.phone = phone
    }
    
    // Не меняет класс..
    func change(phone: Int) {
        self.phone = phone
    }
}

// Значимый тип Value Type
struct User {
    let name: String
    var phone: Int
    
    // Метод меняет саму стрктуру!
    mutating func change(phone: Int) {
        self.phone = phone
    }
}

let person = Person(name: "Vasya", phone: 89156334113)
let user = User(name: "Fedya", phone: 89156334114)

var person2  = Person(name: "Olesya", phone: 87772233444)
var user2 = User(name: "Masha", phone: 89993456789)
person.phone = 89995554433
//user.phone = 89996665544 нельзя так как константа
// person = person2 - ERROR!

person2 = person

person.name
person2.name
person2.phone = 8123456789
person.phone
person2.phone

user2 = user
user2.name
user.name
user2.phone = 234567
user.phone
user2.phone
