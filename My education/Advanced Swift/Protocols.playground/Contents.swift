import Cocoa

// Протоколы

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    
    var fullName: String
    var age: Int
    
    var phoneNumber: Int
}

class Company: FullyNamed {
    var fullName: String
    var director = "Тим Кук"
    
    init(prefix: String, title: String) {
        self.fullName = "\(prefix) \(title)"
    }
}


let misha = Person(fullName: "Misha", age: 34, phoneNumber: 9998887766)
let alisa = Person(fullName: "Alisa", age: 23, phoneNumber: 9998887755)
let apple = Company(prefix: "LLC", title: "Apple")
let google = Company(prefix: "LLC", title: "Google")

class Bank: Company {
    
    var clients = [FullyNamed]()
}

let bank = Bank(prefix: "OOO", title: "Alfa-Bank")

bank.clients.append(misha)
bank.clients.append(alisa)
bank.clients.append(apple)
bank.clients.append(google)
google.director = "Вася Пупкин"

for client in bank.clients {
    print(client.fullName) //можем обратиться только к тому, что прописано в протоколе
    if client is Person {
        print((client as! Person).age)
    } else if client is Company {
        print((client as! Company).director)
    }
}

enum Speciality {
    case iOS, android, python, java
}

protocol Human {
    var name: String { get }
}

protocol Developer {
    var speciality: Speciality { get }
    var expInYears: Int { get }
}

protocol Teacher {
    var speciality: Speciality { get }
    func teach(theme: String) // Внутри протокола функцию только объявляем но не реализуем
}

struct DevTeacher: Human, Developer, Teacher {
    var name: String
    var speciality: Speciality // Композиция протоколов - достаточно 1 раза вместо 2-х
    var expInYears: Int
    
    func teach(theme: String) {
        print("Учу людей. Тема урока \(theme)")
    }
}

let vlad = DevTeacher(name: "Влад", speciality: .iOS, expInYears: 6)

vlad.name
vlad.teach(theme: "Протоколы")



protocol Named {
    var title: String { get }
}

protocol Location {
    var lat: Double { get }
    var lon: Double { get }
}

struct City: Location, Named {
    var lat: Double
    var lon: Double
    var title: String
    
}

struct Club: Location, Named {
    var lat: Double
    var lon: Double
    var title: String
    
}

struct Brand: Named {
    var title: String
    
}

func concert(place: Location & Named, band: String) {
    print("Группа \(band) выступает в \(place.title). Координаты для GPS: \(place.lat), \(place.lon)")
    
}

let moscow = City(lat: 45.678190, lon: 45.67123, title: "Москва")
let glavclub = Club(lat: 56.456282, lon: 34.2443222, title: "Главклуб")
let brand = Brand(title: "Apple")
concert(place: moscow, band: "Наив")
concert(place: glavclub, band: "Дергать")
//concert(place: brand, band: "Дергать") - не можем сделать, так как не соответствует всем протоколам в функции


// Паттерн ДЕЛЕГАТ
// Делегатор - тот кто ставит задачу
// Тип делегата - протокол который описывает какими свойствами и методами должен обладать Делегат
// Делегат - тот, кто исполняет задачу

protocol CoffeeMakerDeligate {
    func makeCoffee(amount: Int) -> Int
}

class Client {
    var name = "Влад"
    
    var coffeeMaker: CoffeeMakerDeligate?
    
    func visitCoffeeHouse(coffeeMaker: CoffeeMakerDeligate) {
        self.coffeeMaker = coffeeMaker
    }
    
    func goOutCoffeeHouse() {
        self.coffeeMaker = nil
    }
    
    func buyCoffee(amount: Int) {
        guard let deligate = coffeeMaker else {
            print("Вы не в кофейне")
            return
        }
        let count: Int = deligate.makeCoffee(amount: amount)
        print("Вы купили \(count) кружек кофе!")
    }
}

struct Officiant: CoffeeMakerDeligate {
    
    func makeCoffee(amount: Int) -> Int {
        let price = 350
        let count = amount / price
        return count
    }
    
}

struct Barista: CoffeeMakerDeligate {
    func makeCoffee(amount: Int) -> Int {
        let price = 100
        let count = amount / price
        return count
    }
}

let oficiant = Officiant()

let client = Client()

client.visitCoffeeHouse(coffeeMaker: oficiant)
client.buyCoffee(amount: 2000)
client.goOutCoffeeHouse()

let bsrista = Barista()

client.visitCoffeeHouse(coffeeMaker: bsrista)
client.buyCoffee(amount: 400)
client.goOutCoffeeHouse()

client.buyCoffee(amount: 600)


