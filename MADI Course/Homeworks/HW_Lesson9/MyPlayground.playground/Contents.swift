import UIKit
//Создайте класс Автомобиль
class Automobile {
    //Определите свойства - название, год выпуска, количество бензина, пробег, средний расход топлива, объём бака, максимальная масса
    let name: String
    let year: Int
    var fuel: Double
    var distance: Int
    let midFuelOn100km: Int
    let fuelTank: Int
    let maxMass: Int
    //Определите вычисляемое свойство «Старое ли авто». Старым считать автомобиль, год выпуска которого на 15 меньше, чем текущий - 2023
    var isOld: Bool {
        guard year > 2008 else {return true}
        return false
    }
    //Доработайте класс Автомобиль для взаимодействия с водителем:
    // - У Автомобиля должен появиться водитель (свойство)
    var driver: Driver
    //Проинициализируйте определённые в классе свойства с помощью обычной инициализации
    init(name: String,
         year: Int,
         fuel: Double,
         distance: Int,
         midFuelOn100km: Int,
         fuelTank: Int,
         maxMass: Int,
         driver: Driver) {
        self.name = name
        self.year = year
        self.fuel = fuel
        self.distance = distance
        self.midFuelOn100km = midFuelOn100km
        self.fuelTank = fuelTank
        self.maxMass = maxMass
        self.driver = driver
    }
    //Определите методы «двигаться», «об этом ТС», заполнение и «заправка»
    //Метод Двигаться принимает количество км, добавляет их в пробег, а также уменьшает  количество топлива, согласно показателю среднего расхода. В консоль выводится сообщение «\(название) проехал \(дистанция) км»
    func drive(km: Int) {
        guard fuel > Double(km * midFuelOn100km / 100) else {
            let leftDist = fuel / Double(midFuelOn100km) * 100
            distance += Int(leftDist)
            print("\(name) проехал \(Int(leftDist)) км и закончился бензин")
            return fuel = 0
        }
        distance += km
        fuel -= Double(km * midFuelOn100km / 100)
        print("\(name) проехал \(km) км")
    }
    //Метод «об этом ТС» распечатывает информацию об автомобиле
    func about() {
        print("Автомобиль: \(name), год выпуска - \(year), владелец: \(driver.name), пробег: \(distance), количество бензина: \(fuel)")
    }
    //Метод «заправка» принимает количество литров топлива и добавляет это количество в бак. Помните, что в бак не поместится больше его объёма
    // - Метод Заправка теперь должен, помимо прочего, вычитать из денег Водителя сумму за бензин. Конечно, если у него хватит денег 😄
    func fuelBuy(liters: Double, price: Double) {
        guard Double(fuelTank) > fuel + liters else {
            let done = (Double(fuelTank) - fuel)
            guard driver.fuelBuy(cash: done * price) else {
                print("Кредит будем оформлять? Всего 230% годовых!")
                return
            }
            print("Заправил \(done) литров!")
            return fuel = Double(fuelTank)
        }
        guard driver.fuelBuy(cash: liters * price) else {
            print("Кредит будем оформлять? Всего 230% годовых!")
            return
        }
        print("Заправил \(liters) литров!")
        fuel += liters
    }
    //Метод «заполнение» выводит абстрактное сообщение, что производится заполнение автомобиля полезным грузом
    func filling() {
        print("Абстрактное сообщение, что производится заполнение автомобиля полезным грузом!")
    }
}

//Со звёздочкой:
//Создайте класс Водитель со свойствами имя и количество денег (приватное).
class Driver {
    let name: String
    private var money: Double
    
    init(name: String, money: Double) {
        self.name = name
        self.money = money
    }
    
    func fuelBuy(cash: Double) -> Bool {
        guard money >= cash else {
            return false
        }
        money -= cash
        print("Денег осталось \(money)")
        return true
    }
}

//Создайте наследников автомобиля - грузовой, автобус
class Truck: Automobile {
    //Определите дополнительные свойства для грузового - грузоподъёмность и вычисляемое - собственная масса ТС.
    var weight: Int
    var selfWeight: Int {
        4500 + weight // 4500 масса ТС + груз или я не правильно понял условие
    }
    
    init(name: String,
         year: Int,
         fuel: Double,
         distance: Int,
         midFuelOn100km: Int,
         fuelTank: Int,
         maxMass: Int,
         driver: Driver,
         weight: Int) {
        self.weight = weight
        super.init(name: name,
                   year: year,
                   fuel: fuel,
                   distance: distance,
                   midFuelOn100km: midFuelOn100km,
                   fuelTank: fuelTank,
                   maxMass: maxMass,
                   driver: driver)
        
    }
    //Переопределите метод заполнения для дочерних классов. Грузовик - заполнять кузов на 300 кг (но не более вместимости кузова).
    override func filling() {
        guard maxMass >= selfWeight + 300 else { return }
        weight += 300
    }
    //Перегрузите метод заполнения в дочерних классах с указанием конкретного количества загрузки пассажиров или груза соответственно
    func filling(mass: Int) {
        guard maxMass >= selfWeight + mass else { return }
        weight += mass
    }
}

class Bus: Automobile {
    //Определите дополнительные свойства для автобуса - количество пассажиров и вычисляемое - собственная масса ТС.
    //Для расчёта собственной массы в том случае принять вес 1 пассажира равным 85 кг.
    var passengers: Int
    var selfWeight: Int {
        4500 + passengers * 85
    }
    
    init(name: String,
         year: Int,
         fuel: Double,
         distance: Int,
         midFuelOn100km: Int,
         fuelTank: Int,
         maxMass: Int,
         driver: Driver,
         passengers: Int) {
        self.passengers = passengers
        super.init(name: name,
                   year: year,
                   fuel: fuel,
                   distance: distance,
                   midFuelOn100km: midFuelOn100km,
                   fuelTank: fuelTank,
                   maxMass: maxMass,
                   driver: driver)
        
    }
    //Переопределите метод заполнения для дочерних классов. Автобус должен при вызове этого метода заполнять свои свободные места на 10 человек (но не более, чем вместимость).
    override func filling() {
        guard maxMass >= selfWeight + 850 else { return }
        passengers += 10
    }
    //Перегрузите метод заполнения в дочерних классах с указанием конкретного количества загрузки пассажиров или груза соответственно
    func filling(pass: Int) {
        guard maxMass >= selfWeight + pass * 85 else { return }
        passengers += pass
    }
}


let vasya = Driver(name: "Вася", money: 3500)
let jiga = Automobile(name: "Жига", year: 1998, fuel: 20, distance: 300260, midFuelOn100km: 9, fuelTank: 50, maxMass: 2500, driver: vasya)
jiga.isOld
jiga.drive(km: 150)
jiga.fuel
jiga.distance
jiga.drive(km: 150)
jiga.fuel
jiga.distance
jiga.drive(km: 150)
jiga.fuel
jiga.distance
jiga.about()
jiga.fuelBuy(liters: 40, price: 50.0)
jiga.fuel
jiga.fuelBuy(liters: 20, price: 50.0)
jiga.fuel
jiga.fuelBuy(liters: 10, price: 50.0)
jiga.fuel
jiga.filling()
let bus = Bus(name: "ПАЗИК", year: 1846, fuel: 400, distance: 9567342156, midFuelOn100km: 100, fuelTank: 1000, maxMass: 9000, driver: vasya, passengers: 40)
bus.passengers
bus.selfWeight
bus.filling()
bus.passengers
bus.selfWeight
bus.filling(pass: 2)
bus.passengers
bus.selfWeight
bus.filling(pass: 1)
bus.passengers
bus.selfWeight

