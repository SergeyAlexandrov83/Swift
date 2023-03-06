import UIKit

//Структуры. Ссылочные и значимые типы данных

class Car {
    let title: String
    var owner: String
    
    init(title: String, owner: String) {
        self.title = title
        self.owner = owner
    }
    
    func copy() -> Car {
        let car = Car(title: title, owner: owner)
        return car
    }
    
    func changeOwner(_ newOwner: String) {
        self.owner = newOwner
    }
}

struct Auto {
    let title: String
    var owner: String
    
    private var keyPin: Int = 9787
    
    init(brand: String, model: String, owner: String) {
        self.title = "\(brand) \(model)"
        self.owner = owner
    }
    
    init(title: String, owner: String) {
        self.title = title
        self.owner = owner
    }
    
    mutating func changeOwner(_ newOwner: String) {
        self.owner = newOwner
    }
}

//1. У структуры memberwise init поставляется по умолчанию. У класса - нет

let mers = Car(title: "Mercedes", owner: "Вася")
let bmw = Auto(title: "BMW", owner: "Федя")

//2. Структуры не поддерживают принципы ООП: Не наследуются, не переопределяются СИМ

//3.
// Класс - ссылочный. Константа - ссылка на область памяти. Изменчивость свойств объекта обусловлена их собственной мутабельностью
mers.owner = "Галя"
mers.owner

//Структура - тип-значение. В константе хранится всё значение, то есть хранятся значения всех свойств.
//bmw.owner = "Алиса" - Error! нельзя изменить константу

print(mers)
print(bmw)

let mers2 = mers.copy()
mers.owner
mers2.owner
mers === mers2
mers2.owner = "Елизавета"

mers === mers2  //Оператор идентичности
mers.owner


//4.
var audi = Car(title: "Audi", owner: "Алёша")
var hyundai = Car(title: "Hyundai", owner: "Вовочка")
audi = hyundai
audi.title
hyundai.title
audi.owner = "Наташа"
hyundai.owner

audi === hyundai


var honda = Auto(title: "Honda", owner: "Кеша")
var kia = Auto(title: "KIA", owner: "Петя")
kia = honda
kia.owner = "Аркадий"
honda.owner


class Airport {
    let title: String
    var code: String
    var takeOffFlies: [Fly] = []
    var landingFlies: [Fly] = []
    
    init(title: String, code: String) {
        self.title = title
        self.code = code
    }
    
    func getFlies(flies: [Fly]) {
        let landing = flies.filter { fly in
            fly.landingAirp == self.code
        }
        self.landingFlies = landing
        
        let takeOff = flies.filter {$0.takeOffAirp == code}
        self.takeOffFlies = takeOff
    }
    
    func whereFlying() {
        for fly in takeOffFlies {
            print("\(fly.landingAirp)")
        }
    }
    
    func whereFromFlying() {
        for fly in landingFlies {
            print("\(fly.takeOffAirp)")
        }
    }
}

struct Fly {
    var takeOffAirp: String
    var landingAirp: String
}

let airp = Airport(title: "Шереметьево", code: "SVO")

var flies: [Fly] = [
    Fly(takeOffAirp: "SVO", landingAirp: "PRM"),
    Fly(takeOffAirp: "VKO", landingAirp: "PLK"),
    Fly(takeOffAirp: "PLK", landingAirp: "SVO"),
    Fly(takeOffAirp: "EKB", landingAirp: "SVO"),
    Fly(takeOffAirp: "SVO", landingAirp: "EKB"),
    Fly(takeOffAirp: "SVO", landingAirp: "PLK") ]

airp.getFlies(flies: flies)
airp.takeOffFlies.count
airp.landingFlies.count
airp.whereFlying()
airp.whereFromFlying()




//Перечисления (Enum) - общий тип для группы ассоциированных значений

enum DayTime: CaseIterable {
    case night
    case morning
    case afternoon
    case evening
}

var currentTime: DayTime = .evening
currentTime = .night

let night = DayTime.night

switch currentTime {
case .night:
    print("Сейчас темно, летают совы")
case .morning:
    print("Поют жаворонки")
case .afternoon:
    print("Обед, пора хомячить!")
case .evening:
    print("Скоро спать! Ура!")
}

for time in DayTime.allCases {
    print(time)
}

//Ассоциированные значение
enum Weapons {
    case bow(distAttack: Int, dist: Int)
    case crossbow(distAttack: Int, dist: Int)
    case knife(nearAttack: Int)
    case stuff(distAttack: Int)
}

let bow = Weapons.bow(distAttack: 23, dist: 60)
let crossbow = Weapons.crossbow(distAttack: 45, dist: 120)
let knife: Weapons = .knife(nearAttack: 32)
let stuff = Weapons.stuff(distAttack: 38)

class Player {
    var weapon: Weapons = knife
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func attack(aDist: Int) {
        switch weapon {
        case .bow(distAttack: let distAttack, dist: let dist):
            guard dist >= aDist else {
                print("Невозможно атаковать. Противник слишком далеко")
                 return
            }
            print("Отняли \(distAttack) HP")
        case .crossbow(distAttack: let distAttack, dist: let dist):
            guard dist >= aDist else {
                print("Невозможно атаковать. Противник слишком далеко")
                 return
            }
            print("Отняли \(distAttack) HP")
        case .knife(nearAttack: let nearAttack):
            guard aDist <= 1 else {
                print("Невозможно атаковать. Противник слишком далеко")
                 return
            }
            print("Отняли \(nearAttack) HP")
        case .stuff(distAttack: let distAttack):
            print("Отняли \(distAttack) HP")
        }
    }
}

let dwarf = Player(name: "Бородач")
dwarf.weapon = crossbow

dwarf.attack(aDist: 100)


//enum AnimalType {
//    case dog(poroda: String, name: String)
//    case fish(view: String, isPredator: Bool)
//    case bird(view: String, isPredator: Bool)
//}
//
//class Animal {
//
//}
//
//class Dog: Animal  {
//
//}
//
//class Fish: Animal  {
//
//}
//
//class Bird: Animal {
//
//}
//
//
//func createAnimal(_ type: AnimalType) -> Animal {
//    switch type {
//    case .dog(poroda: let poroda, name: let name):
//        return Dog()
//    case .fish(view: let view, isPredator: let isPredator):
//        return Fish()
//    case .bird(view: let view, isPredator: let isPredator):
//        return Bird()
//    }
//}


//Чистые значения
enum Season: String {
    case winter = "Зима"
    case spring = "Весна"
    case summer = "Лето"
    case autumn
}

Season.autumn.rawValue

enum Sides: Int {
    case left = 5, right
}

Sides.right.rawValue

enum CompassPoint {
    case north, south, west, east
    
    //Свойства в перечислениях - только вычисляемые
    var label: String {
        switch self {
        case .north: return "Север"
        case .south: return "Юг"
        case .west: return "Запад"
        case .east: return "Восток"
        }
    }
    
    var isVertical: Bool {
        self == .north || self == .south ? true : false
    }
    
    //Инициализаторы
    init(label: String) {
        switch label {
        case "Север", "север", "north": self = .north
        case "Юг", "юг", "south": self = .south
        case "Восток", "восток", "east": self = .east
        case "Запад", "запад", "west": self = .west
        default: self = .north
        }
    }
    
    func tellMeYourLabel() {
        print(label)
    }
    
}

let south = CompassPoint.south
south.label
south.isVertical

let point = CompassPoint(label: "Север")
let point2 = CompassPoint(label: "South")

south.tellMeYourLabel()
point.tellMeYourLabel()
point2.tellMeYourLabel()


var array = [3,2,45,7,9]
array.sorted()
array.sort()



