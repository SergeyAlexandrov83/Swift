import Cocoa

// Перечисления

enum DayTime {
    case night
    case mornin
    case afternoon
    case evening
}

var currentTime = DayTime.evening
currentTime = .night

let day: DayTime = .afternoon

switch currentTime {
    
case .night:
    print("Сплю")
case .mornin:
    print("Пью кофе")
case .afternoon:
    print("СпПью чайлю")
case .evening:
    print("Пью")
}

// Ассоциированные значения

enum Profession {
    case progremmer(String, String, Int)
    case sysadmin(String, String)
    case webdesigner(String, Int)
    case cleaningManager(String)
}

let myProfession = Profession.progremmer("Sergey", "Swift", 1)
let designer = Profession.webdesigner("Artemiy", 30)


func check(prof: Profession) {
    switch prof {
        
    case .progremmer(let name, let spec, let exp):
        print("My name \(name). I'm \(spec) for \(exp) years!")
    case .sysadmin(let name, let spec):
        print("My name \(name). I'm \(spec)!")
    case .webdesigner(_, _):
        break
    case .cleaningManager(_):
        break
    }
}

check(prof: myProfession)
check(prof: designer)

// Чистые значения

enum MyPetName: String, CaseIterable {
    case cat = "Vasya"
    case dog = "Tuzik"
    case boa = "Shnurok"
    case parrot = "Durak"
}

var myCat = MyPetName.cat
var myCatName = myCat.rawValue

var myPets = MyPetName.allCases
print(myPets)

for pet in myPets {
    print(pet.rawValue)
}

enum Season: Int {
    case winter = 1, spring, sumer, autumn
    
    var label: String {
        switch self {
            
        case .winter:
            return "Зима"
        case .spring:
            return "Весна"
        case .sumer:
            return "Лето"
        case .autumn:
            return "Осень"
        }
    }
    
    // Могут быть только вычесляемые свойства!
    // .. но если очень хочется:
    
    var int: Int { return 5 }
    
    init?(_ value: String) {
        switch value {
        case "Зима": self = .winter
        case "Весна": self = .spring
        case "Лето": self = .sumer
        case "Осень": self = .autumn
        default: return nil
        }
    }
    
    func printLabel() {
        print(self.label)
    }
}

let season = Season("Зима")
let season2 = Season("ПНРоро")

season?.printLabel()
season!.printLabel()
