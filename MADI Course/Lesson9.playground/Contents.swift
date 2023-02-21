import UIKit

class Car {
    let title: String
    var color: String
    let wheels: Int
    
    //У машины должно быть количество колёс не менее 4 и чётное
    init?(title: String, color: String, wheels: Int) {
        guard wheels > 3 && wheels % 2 == 0 else { return nil }
        self.title = title
        self.wheels = wheels
        self.color = color
    }
}


let firstCar = Car(title: "First", color: "Yellow", wheels: 6)
firstCar?.color = "Blue"
firstCar?.wheels
firstCar?.title
firstCar?.color
let second = Car(title: "Second", color: "Black", wheels: 2)
second?.color = "Blue"
let third = Car(title: "Third", color: "Red", wheels: 5)

if let car = firstCar {
    print(car.title)
}

if let car2 = second {
    print(car2.title)
} else {
    print("Машины нет")
}


//Принципы ООП
//Наследование - Это способность классов порождать потомков и наследоваться от других классов

class Teapot {
    let title: String
    let volume: Double
    let material: String
    var currentTemp = 20
    
    init(title: String, volume: Double, material: String) {
        self.title = title
        self.volume = volume
        self.material = material
    }
    
    func boil() {
        currentTemp = 100
    }
}


final class GasTeapot: Teapot {
    var maxTemp: Int
    var hasWhistle: Bool
    
    init(title: String, volume: Double, maxTemp: Int, hasWhistle: Bool) {
        self.maxTemp = maxTemp
        self.hasWhistle = hasWhistle
        super.init(title: title, volume: volume, material: "Сталь нержавеющая")
    }
}

//class SomeGasTeapot: GasTeapot {  } //- Ошибка! GasTeapot - это final class
 

class ElectricalTeapot: Teapot {
    let voltage: Int
    var isOn: Bool
    
    init(title: String, volume: Double, material: String, voltage: Int) {
        self.voltage = voltage
        self.isOn = false
        super.init(title: title, volume: volume, material: material)
    }
    
    final func onOff() {
        self.isOn.toggle()
    }
    
    func warm(temp: Int) {
        guard 60...100 ~= temp else { return }
        self.currentTemp = temp
    }
}

let teapot = Teapot(title: "Самовар", volume: 5, material: "Латунь")
let gasTeapot = GasTeapot(title: "Bosch", volume: 3.2, maxTemp: 300, hasWhistle: true)
let electroTeapot = ElectricalTeapot(title: "Scarlett", volume: 1.9, material: "Пластик", voltage: 220)

teapot.boil()
electroTeapot.currentTemp
teapot.currentTemp
gasTeapot.material

var teapots: [Teapot] = [
    teapot,
    gasTeapot,
    electroTeapot
]

//Проверка типа и приведение типов
teapots[2] is ElectricalTeapot ? print("Электрочайник") : print("Неэлектрочайник")
let isEl = teapots[2] is ElectricalTeapot

//is - проверка типа. Результат проверки - булево значение. is не приводит один тип к другому

//as! as? - приведение типа

let elTeapot = teapots[2] as! ElectricalTeapot
print(elTeapot.title)


if let gasTeapot = teapots[1] as? GasTeapot {
    print(gasTeapot.title)
}


func printTeapotVoltage(teapot: Teapot) {
    guard let teapot = teapot as? ElectricalTeapot else {
        print("Это не электрочайник")
        return
    }
    print(teapot.voltage)
}


printTeapotVoltage(teapot: electroTeapot)


//Полиморфизм - это свойство переопределять реазилацию свойств, методов и инициализаторов у дочерних объектов


class Animal {
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func food() {
        print("\(title) ест")
    }
    
    func go() {
        print("\(title) движется")
    }
    
    func food(eat: String) {
        print("\(title) ест \(eat)")
    }
}

class PredatorBird: Animal {
    var isFly: Bool
    
    init(title: String, isFly: Bool) {
        self.isFly = isFly
        super.init(title: title)
    }
    
    override init(title: String) {
        self.isFly = true
        super.init(title: title)
    }
    
    override func food() {
        print("\(title) ест мясо")
    }
    
    func food(isMeat: Bool) {
        if isMeat { print("Ест мясо") } else {
            print("Ест рыбу")
        }
    }
    
    override func go() {
        if isFly {
            print("\(title) летит по небу")
        } else {
            print("\(title) бежит по земле")
        }
    }
}

let animal = Animal(title: "Мишка")
animal.title
animal.go()
animal.food()
animal.food(eat: "Мёд")

let eagle = PredatorBird(title: "Орёл", isFly: true)
eagle.food()
eagle.go()
eagle.food(eat: "рыбу")
eagle.food(isMeat: true)
eagle.food(isMeat: false)

let animals = [animal, eagle]


for animal in animals {
    animal.food()
    animal.go()
    
}







//Инкапсуляция - это помещение свойств и методов сзаимодействия с объектом внутрь этого объекта и разграничение доступа.

class Person {
    let name: String
    private(set) var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func birthDay() {
        self.age += 1
    }
    
    func getAge() -> Int { age }
}

var vasya = Person(name: "Вася", age: 25)
vasya.birthDay()
vasya.birthDay()
vasya.birthDay()
vasya.birthDay()
vasya.getAge()

vasya.age


class CreditCard {
    private var pin: Int
    private (set) var balance: Int
    
    init(pin: Int, balance: Int) {
        self.pin = pin
        self.balance = balance
    }
    
    func setPin(_ pin: Int, oldPin: Int) {
        guard oldPin == self.pin else { return }
        self.pin = pin
    }
    
    func addMoney(_ amount: Int) {
        self.balance += amount
    }
    
    func buy(amount: Int) {
        guard amount <= balance else { return }
        balance -= amount
    }
    
}

let card = CreditCard(pin: 1234, balance: 10000)

card.balance
card.buy(amount: 5000)

card.setPin(3456, oldPin: 1234)

// open - открытые для доступа и изменения из сторонних проектов
// public - открытые для доступа из сторонних проектов
// internal - открытые для доступа внутри проекта
// private - открытые для доступа внутри типа
// fileprivate - открытые для доступа внутри файла



//Синглтон - одиночка

class Wallet {
    static let shared = Wallet(); private init() { }
    var balance = 10000
}

class Work {
    var wallet = Wallet.shared
}

class Shop {
    var wallet = Wallet.shared
}

let work = Work()
let shop = Shop()
work.wallet.balance += 30000
shop.wallet.balance



work.wallet === shop.wallet
shop.wallet.balance -= 23000
shop.wallet.balance
work.wallet.balance


class Fish {
    static let title = "Рыба"
    let title: String = "Окунь"
}

Fish.title
let fish = Fish()
fish.title







