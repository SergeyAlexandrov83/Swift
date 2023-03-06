import UIKit

//Свойства - это переменные или константы, которые хранят или вычисляют состояние объекта или типа

class Person {
    //static properties - Статические свойства
    //1. Могут быть у классов, структур, перечислений
    //2. Могут быть как Хранимыми, так и Вычисляемыми
    //3. Не могут переопределяться
    static let typeName = "Человек разумный"

    //class properties - Классовые свойства
    //1. Могут быть только у классов
    //2. Могут быть только вычисляемыми
    //3. Поддерживают переопределение реализации
    class var armsCount: Int { return 4 }
    
    //Хранимые свойства экземпляра (объекта) (Stored properties)
    var name: String
    var lastName: String
    
    var age: Int {
        willSet { //Исполняется, непосредственно перед тем, как будет установлено значение
            print("willSet - Возраст \(name): \(age). Будет \(newValue)")
        }
        didSet { //Исполняется, непосредственно после того, как было установлено значение
            print("didSet - Возраст \(name): \(age). Было \(oldValue)")
        }
    }
    
    
    var phone: Int?   //По умолчанию - nil
    
    //Вычисляемые свойства Объекта (экземпляра)
    var fullName: String {
        get { //Геттер нужен для вычисления значения
            return "\(name) \(lastName)"
        }

        set { //Сеттер Нужен для установки (изменения) значения
            let components = newValue.components(separatedBy: " ")
            print(fullName)
            let (name, lastName) = (components[0], components[1])
            self.name = name
            self.lastName = lastName
        }
    }
    
    var about: String { "Имя: \(fullName). Возраст: \(age) лет." }
    
    lazy var fatherName: String = "Петрович"
    
    //Memberwise-Инициализатор - это инит, который дублирует непроинициализированные при создании свойства
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.age = age
        self.lastName = lastName
    }
    
    //Пустой инициализатор
    init() {
        self.name = "Витя"
        self.lastName = "Курочкин"
        self.age = 26
    }

    //Инициализаторы со значениями по умолчанию
    init(name: String, family: String, age: Int = 18) {
        self.name = name
        self.lastName = family
        self.age = age
    }
    
    //convenience-init "Удобный" инициализатор - внутри этого инита должен быть вызван какой-либо другой инит
    
    convenience init(name: String, lastName: String, age: Int, phone: Int) {
        self.init(name: name, lastName: lastName, age: age)
        self.phone = phone
    }
    
    //Провальный инициализатор - может вернуть nil вместо объекта
    init?(name: String, lastName: String, years: Int) {
        guard years >= 0 else { return nil }
        self.name = name
        self.age = years
        self.lastName = lastName
    }
    
    //Методы
    //Методы экземпляра
    func say(_ message: String) {
        print("\(name): \(message)")
    }
    
    //Методы типа:
    //Статические
    static func printType() {
        print("Человек")
    }
    
    //Классовые
    
}

class Car {
    var title = "Audi"
    var price = 40000
}
//Назначенный - автоматический пустой инит
let audi = Car()

let alisa = Person(name: "Алиса", family: "Встранечудес")
let evgeniy = Person(name: "Евгений", family: "Онегин", age: 34)
evgeniy.age
alisa.age
let vasya = Person(name: "Вася", lastName: "Пупкин", age: 24)
vasya.name
vasya.age
vasya.phone = 89654321232
vasya.phone
vasya.say("Привет всем!")
vasya.fullName
print(vasya.about)
vasya
print(vasya.fatherName)
vasya

Person.printType()
let vitya = Person()
vitya.name
vitya.age


let natasha = Person(name: "Наташа", lastName: "Ростова", age: 22)
natasha.phone
natasha.age += 4
natasha.name
natasha.fullName
print(natasha.about)

natasha.fullName = "Аркадий Укупник"
natasha.name
natasha.lastName
natasha.fullName

natasha.fullName = "Алла Пугачёва"
natasha.name
natasha.lastName
natasha.fullName

let alyosha = Person(name: "Алёша", lastName: "Пешков", years: 45)

Person.typeName

let andrey = Person(name: "Андрей", lastName: "Болконский", age: 37, phone: 89876543212)
andrey.phone

class Taxi {
    static var wheels = 4
    static let color = "Yellow"
}

Taxi.wheels
Taxi.color

//Создать класс Менеджер по продажам. Его зарплата состоит из окладной и премиальной части за вычетом штрафов. Премиальная часть складывается из двух KPI - количества совершённых звонков (должно быть более 130, каждый звонок оценивается в 30 рублей) и 12% от суммы его продаж, если эта сумма больше 300.000. Необходимо учесть, что штраф может уменьшить премию работника на 100%, но не может уменьшать оклад работника более чем в 2 раза. Вычислить зарплату

class SalesManager {
    var salaryBase = 45000
    var calls: Int = 0
    var sales = 0
    var sanctions = 0
    
    var motivation: Int {
        let conditionMovation = calls > 130 && sales > 300000
        guard conditionMovation else { return 0 }
        let callsPart = calls * 30
        let salesPart = sales * 12 / 100
        return callsPart + salesPart
    }
    
    var salary: Int {
        let solvedSalary = salaryBase + motivation - sanctions
        guard solvedSalary > salaryBase / 2 else { return salaryBase / 2 }
        return solvedSalary
    }
    
    func sale(amount: Int) {
        self.sales += amount
    }
    
    func called(count: Int) {
        self.calls += count
    }
    
    func kosyak(amount: Int) {
        self.sanctions += amount
    }
    
    func about() {
        print("ЗП: \(salary). Премия: \(motivation). Штрафы: \(sanctions). Звонки: \(calls). Продано: \(sales)")
    }
}

let manager = SalesManager()
manager.about()
manager.sale(amount: 120000)
manager.called(count: 80)
manager.about()
manager.sale(amount: 90000)
manager.called(count: 70)
manager.about()
manager.called(count: 40)
manager.sale(amount: 210000)
manager.about()
manager.kosyak(amount: 40000)
manager.about()
manager.kosyak(amount: 120000)
manager.about()
manager.kosyak(amount: 12000000000)
manager.about()
