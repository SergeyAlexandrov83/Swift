import UIKit
//1. Требуется создать справочник (массив) достопримечательностей города. Это могут быть как Скульптуры, например, пямятники, так и архитектурные объекты - здания. Структура Скульптуры имеет свойства - название, скульптор и Материал. Класс Архитектурное строение имеет свойства - почтовый индекс, название.  Создать протокол, требующий свойства - название и год создания данной достопримечательности. Именно эти свойства будет необходимы для того, чтобы поместить достопримечательности в общий справочник. Создать несколько экземпляров архитектурных и скульптурных памятников и добавить их в общий массив, проверив тем самым работу кода.
protocol ArchItems {
    var name: String { get }
    var year: Int { get }
}

struct Sculpt: ArchItems {
    let name: String
    let year: Int
    
    let produser: String
    let material: String
}

class ArchBuilding: ArchItems {
    let name: String
    let year: Int
    
    let index: Int
    
    init(name: String, year: Int, index: Int) {
        self.name = name
        self.year = year
        self.index = index
    }
}

let sculptOne = Sculpt(name: "Мужик с рукой", year: 1945, produser: "Неизвестный автор", material: "Папье-маше")
let sculptTwo = Sculpt(name: "Мужик без рук", year: 1965, produser: "Известный автор", material: "Пластик")
let archBuldOne = ArchBuilding(name: "Дом со стенами", year: 1973, index: 100456)
let archBuldTwo = ArchBuilding(name: "дом с крышей", year: 1845, index: 123456)
var archList: [ArchItems] = [sculptOne, sculptTwo, archBuldOne, archBuldTwo]

//2. Требуется создать протокол Сотрудник компании со свойствами Название компании, имя, должность. Создать класс Директор, подписанный под протокол Сотрудник. Создать класс Бухгалтер, который также является сотрудником компании. Бухгалтеру добавить свойство баланс счёта компании. Создать структуру Платёжное поручение со свойствами Контрагент (строка), тип контрагента (перечисление - ЮЛ, ФЛ, ИП, Самозанятый), назначение платежа. сумма платежа. Директор должен иметь возможность передать бухгалтеру массив Платёжных поручений для оплаты. Бухгалтер проходится по каждому документу и если хватает денег на счёте, оплачивает платежу и пишет в консоль строку вида «ПП в сторону Васи Пупкина на сумму 3000р оплачено». Если денег не хватает, пишет в консоль, что денег на балансе не хватает.

protocol Employer {
    var companyName: String { get }
    var name: String { get }
    var position: String { get }
}

protocol PayListDelegate {
    func addPay(bill: PayBill)
    func doYourWork()
}

class Director: Employer {
    var companyName: String
    var name: String
    var position: String
    var delegate: PayListDelegate?
    
    init(companyName: String, name: String, position: String) {
        self.companyName = companyName
        self.name = name
        self.position = position
    }
    
    func addPayToList(bill: PayBill) {
        delegate?.addPay(bill: bill)
        }
    func payBills() {
        delegate?.doYourWork()
    }
}

class MoneyCounter: Employer, PayListDelegate {
    var payBillsList: [PayBill] = []
    var companyName: String
    var name: String
    var position: String
    var balance: Int
    
    init(companyName: String, name: String, position: String, balance: Int) {
        self.companyName = companyName
        self.name = name
        self.position = position
        self.balance = balance
    }
    
    func addPay(bill: PayBill) {
            payBillsList.append(bill)
        }
    
    func doYourWork() {
        payBillsList.forEach { bill in
            guard balance - bill.paySum >= 0 else { return print("Нет денях!") }
            balance -= bill.paySum
            print("ПП в сторону \(bill.type) \(bill.contragent) на сумму \(bill.paySum)р оплачено")
        }
    }
}

enum ContrType: String {
    case ul = "ЮЛ"
    case fl = "ФЛ"
    case ip = "ИП"
    case sc = "Самозанятый"
}

struct PayBill {
    let contragent: String
    let type: ContrType
    let payDiscription: String
    let paySum: Int
}

let pay1 = PayBill(contragent: "Vasya", type: .fl, payDiscription: "For candies", paySum: 3000)
let pay2 = PayBill(contragent: "Petya", type: .sc, payDiscription: "For burger", paySum: 3000)

let director = Director(companyName: "GSM", name: "Fedor", position: "SEO")
let buh = MoneyCounter(companyName: "GSM", name: "Ghalya", position: "Slave", balance: 5000)

director.delegate = buh
director.addPayToList(bill: pay1)
director.addPayToList(bill: pay2)
director.payBills()

//3. Создайте класс День со свойствами День недели (перечисление), часы, минуты. Сделайте так, чтобы часы и минуты можно было изменять только в астрономических пределах (0-23 и 0-60 соответственно). Создайте класс Охранник со свойствами имя, 1или2смена (Bool). Охранники должны наблюдать за часами и работать либо в 1 смену (с 8 до 20:00) либо во 2 смену (с 20:00 до 8:00). Создайте класс Клерк со свойством Имя. Клерк должен наблюдать за часами и работать только по будням с 8 утра до 5 вечера. При изменении данных в классе День каждый наблюдатель должен печатать строку вида: «Я охранник Федя. Сейчас работаю»

protocol Observer {
    func didChange(day: Day.week, hour: Int, mins: Int)
}

protocol Subject {
    func add(_ observer: Observer)
    func remove(_ observer: Observer)
    func notification()
}

class Day: Subject {
    var observers = NSMutableSet()
    var dayOfWeek: week {
        didSet {
            self.notification()
        }
    }
    var hours: Int {
        didSet {
            self.notification()
        }
    }
    var mins: Int {
        didSet {
            self.notification()
        }
    }
    
    enum week {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Saturday
        case Sunday
    }
    
    init(dayOfWeek: week, hours: Int, mins: Int) {
        self.dayOfWeek = dayOfWeek
        if hours >= 0 && hours < 24 { self.hours = hours } else { self.hours = 0 }
        if mins >= 0 && mins < 60 { self.mins = mins } else { self.mins = 0 }
    }
    
    func add(_ observer: Observer) {
        observers.add(observer as! NSObject)
    }
    
    func remove(_ observer: Observer) {
        observers.remove(observer)
    }
    
    func notification() {
        observers.forEach { ($0 as! Observer).didChange(day: self.dayOfWeek, hour: self.hours, mins: self.mins) }
    }
}

//Наблюдатели
class Guard: NSObject, Observer {
    let name: String
    var isFirstSmena: Bool
    
    init(name: String, isFirstSmena: Bool) {
        self.name = name
        self.isFirstSmena = isFirstSmena
    }

    func didChange(day: Day.week, hour: Int, mins: Int) {
        let firstSmenaCond = hour > 8 && hour < 20
        let secondSmenaCond = hour < 8 && hour > 20
        if isFirstSmena && firstSmenaCond {
            print("Я охранник \(name). Сейчас работаю в I смену")
        } else if !isFirstSmena && secondSmenaCond {
            print("Я охранник \(name). Сейчас работаю во II смену")
        } else {
            print("От работы дохнут кони, я в пятерочку за шнапсом!")
        }
    }
}

class Clerk: NSObject, Observer {
    let name: String
    
    init(name: String) {
        self.name = name
    }

    func didChange(day: Day.week, hour: Int, mins: Int) {
        let dayCond = day != .Saturday && day != .Sunday
        let hourCond = hour > 8 && hour < 17
        if dayCond && hourCond {
            print("Я \(name)! И я раскажу вам, что такое рабство!")
        } else {
            print("Ya svobodeeeen!!!")
        }
    }
}

var day = Day(dayOfWeek: .Monday, hours: 14, mins: 30)
var borodach = Guard(name: "Vasya", isFirstSmena: true)
var office = Clerk(name: "Masha")

day.add(borodach)
day.add(office)
day.dayOfWeek = .Sunday
day.hours = 22



