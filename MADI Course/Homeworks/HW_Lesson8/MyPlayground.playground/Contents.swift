import UIKit

// 1. Создать класс Клиент Банка. Задать ему свойства Наименование, баланс счёта, e-mail, телефон. Клиентами банка могут быть как физические, так и юридические лица. Создайте инициализатор, который принимает наименование клиента целиком и контактные данные. Баланс счёта в этом случае должен быть равен 0. Создайте «удобные» инициализаторы, которые принимают либо Фамилию, имя, отчество для физ. лиц, либо форму собственности (ООО, ПАО, АО) для юридических лиц, а также начальный баланс счёта клиента. Проинициализируйте класс. Создайте три экземпляра класса, используя разные инициализаторы. Добавьте их в массив Клиенты Банка.
class BankClient {
    let nameing: String
    var accountBalance: Int
    var eMail: String
    var telNumber: String
    var name: String?
    var lastName: String?
    var fatherName: String?
    var typeOfclient: String?
    
    init(nameing: String,
         eMail: String,
         telNumber: String,
         accountBalance: Int = 0) {
        self.nameing = nameing
        self.eMail = eMail
        self.telNumber = telNumber
        self.accountBalance = 0
    }
    
    convenience init(nameing: String,
                     eMail: String,
                     telNumber: String,
                     name: String,
                     lastName: String,
                     fatherName: String) {
        self.init(nameing: nameing,
                  eMail: eMail,
                  telNumber: telNumber)
        self.name = name
        self.lastName = lastName
        self.fatherName = fatherName
    }
    
    convenience init(nameing: String,
                     eMail: String,
                     telNumber: String,
                     typeOfclient: String,
                     accountBalance: Int = 10000) {
        self.init(nameing: nameing,
                  eMail: eMail,
                  telNumber: telNumber)
        self.typeOfclient = typeOfclient
        self.accountBalance = accountBalance
    }
}

var bankClients: [BankClient] = []
let first = BankClient(nameing: "Физическое лицо",
                       eMail: "abc@mail.com",
                       telNumber: "89199876543")

let second = BankClient(nameing: "Физическое лицо",
                        eMail: "def@mail.com",
                        telNumber: "89156784523",
                        name: "Петр",
                        lastName: "Петрович",
                        fatherName: "Петров")

let third = BankClient(nameing: "Зеленые шишки",
                       eMail: "greenbuds@mail.com",
                       telNumber: "88008008080",
                       typeOfclient: "ООО",
                       accountBalance: 15000)

bankClients.append(first)
bankClients.append(second)
bankClients.append(third)

// 2. Создайте класс Программист, объявите целочисленное свойство - опыт в годах, строковое свойство Специализация и строковое свойство - Квалификация. Создайте инициализатор, который принимает в себя опыт в годах и специализацию. Квалификация определяется в инициализаторе следующим образом: Стажёр 0-1 год, Junior 1-3 года, Middle - 3-5 лет, Senior - от 5 лет.
class Programmer {
    var lostYears: Int
    var stack: String
    var qualify: String
    
    init(lostYears: Int, stack: String) {
        self.lostYears = lostYears
        self.stack = stack
        self.qualify = {
            if lostYears < 1 {
                return "Стажер"
            } else if lostYears < 3 {
                return "Junior"
            } else if lostYears < 5 {
                return "Middle"
            } else {
                return "Senior"
            }
        }()
    }
}

let vasyaCoder = Programmer(lostYears: 2, stack: "Swift")
vasyaCoder.qualify
let vladMady = Programmer(lostYears: 10, stack: "SwiftLikeAGod!")
vladMady.qualify

// 3. Создать класс Круг с хранимым свойством Радиус. Добавить ему вычисляемые свойства - длина окружности и площадь круга. Добавить метод "Вытянуть в цилиндр", который принимает высоту цилиндра и возвращает объем цилиндра
class Circle {
    let rad: Double
    var lenght: Double {
        return 2 * Double.pi * rad * rad
    }
    var ploshad: Double {
        return 3 / 4 * Double.pi * rad * rad * rad
    }
    
    init(rad: Double) {
        self.rad = rad
    }
    
    func strechTo(cilinderHigh: Double) -> Double {
        return ploshad * cilinderHigh
    }
}

let pretyCircle = Circle(rad: 10)
pretyCircle.lenght
pretyCircle.ploshad
pretyCircle.strechTo(cilinderHigh: 10)

// 4. Создать класс Кофе-машина
class CoffeMachine {
    // Определить хранимые свойства:
    // ⁃ Марка (константа)
    let mark: String
    // ⁃ Мощность (константа)
    let power: Int
    // ⁃ Гарантированный ресурс (в кружках кофе, константа, приватная)
    private let resurse: Int
    // ⁃ Выработанный ресурс (в кружках кофе переменная, приватная)
    private var resurseDone: Int
    // Определить вычисляемое свойство - остаток ресурса (Гарантированный минус выработанный)
    private var resurseLeft: Int { resurse - resurseDone }
    
    init(mark: String, power: Int, resurse: Int, resurseDone: Int) {
        self.mark = mark
        self.power = power
        self.resurse = resurse
        self.resurseDone = resurseDone
    }
    
    // Определить методы, отвечающие за кипячение воды и за подсчёт количества приготовленных кружек кофе. Первый принтит в консоль «Вода горячая», а второй добавляет к выработанному ресурсу +1  и выводит в консоль сообщение типа «Вы приготовили 15 из 300 гарантированных кружек кофе». Если кружек больше 300, тогда метод выдаэт предупреждение, что нужно обслуживание кофе-машины
    private func waterBoil() {
        print("Вода горячая")
    }
    private func coffeCupsCounter() {
        resurseDone += 1
        if resurseDone >= resurse {
            print("Требуется сервисное обслуживание!")
        } else {
            print("Вы приготовили \(resurseDone) из \(resurse) гарантированных кружек кофе")
        }
    }
    // Определить метод, отвечающий за процесс приготовления кофе, который включает в себя вызов двух методов, описанных выше, и принт «Ваш кофе готов!»
    func makeCoffe() {
        waterBoil()
        coffeCupsCounter()
        print("Ваш кофе готов!")
    }
    // Определить метод обслуживания кофе-машины, который обнуляет гарантированный счётчик
    func servise() {
        resurseDone = 0
        print("Как новая!")
    }
}

let bork = CoffeMachine(mark: "Bork", power: 1800, resurse: 350, resurseDone: 350)
bork.makeCoffe()
bork.makeCoffe()
bork.servise()
bork.makeCoffe()
