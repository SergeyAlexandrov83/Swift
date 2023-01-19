import Cocoa

//Часть 1.
protocol Car: Equatable {
    var model: String { get }
    var color: String { get }
    var buildDate: Int { get }
    var price: Double { get set }
    var accessories: [String] { get set }
    var isServiced: Bool { get set }
}

//Часть 2.
protocol Dealership {
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [Cars] { get set }
    var showroomCars: [Cars] { get set }
    var cars: [Cars] { get set }
    
    func offerAccesories(_: [String])
    func presaleService(_: inout Cars)
    func addToShowroom(_: inout Cars)
    func sellCar(_: inout Cars)
    func orderCar()
}

//Часть 3.
struct Cars: Car, Equatable {
    var model: String
    var color: String
    var buildDate: Int
    var price: Double
    var accessories: [String]
    var isServiced: Bool
}

class Dealer: Dealership {
    var name: String
    var slogan: String
    var showroomCapacity: Int
    var stockCars: [Cars] = []
    var showroomCars: [Cars] = []
    var cars: [Cars] = []
    var toInstal: [String] = []
    
    init(name: String, slogan: String, showroomCapacity: Int) {
        self.name = name
        self.slogan = slogan
        self.showroomCapacity = showroomCapacity
    }
    
    func offerAccesories(_ offer: [String]) {
        print("Клиент согласился купить \(offer)")
        toInstal = toInstal + offer
    }
    
    func presaleService(_ car: inout Cars) {
        print("CAR ENTER SERVICE \(car)")
        if !toInstal.isEmpty {
            car.accessories = toInstal
            toInstal.removeAll()
            print(toInstal)
            print("Установлено дополнительное оборудование!")
            print(car.accessories)
        } else {
            print("Нечего ставить!")
            car.isServiced = true
            print("Предпродажная подготовка проведена")
        }
        
    }
    
    func addToShowroom(_ car: inout Cars) {
        print("CAR ENTER TRANSFER \(car)")
        if showroomCars.count < showroomCapacity {
            if let index = stockCars.firstIndex(of: car) {
                stockCars.remove(at: index)
                if !car.isServiced {
                    self.presaleService(&car)
                }
                showroomCars.append(car)
                print("Машина \(car) перемещена со стоянки в шоурум!")
            } else {
                print("Не найдена машина")
            }
        } else {
            print("В шоуруме закончились места, оставляем машину на стоянке!")
            if !car.isServiced {
                self.presaleService(&car)
            }
        }
    }
    
    func sellCar(_ car: inout Cars) {
        if car.accessories.isEmpty || car.accessories == ["Аптечка", "Огнетушитель"] {
            self.offerAccesories(["Тонировка", "Сингнализация", "Спортивные диски"])
        }
        self.addToShowroom(&car)
        if let index = showroomCars.firstIndex(of: car) {
            print("Машина \(car) продана клиенту!")
            showroomCars.remove(at: index)
        }
    }
    
    func orderCar() {
        if !cars.isEmpty{
            stockCars.append(cars.randomElement()!)
            print("Машина с завода заказана и ожидает на парковке автосалона!")
        }
    }
}

var bmw1 = Cars(model: "X6", color: "Black", buildDate: 2022, price: 79000, accessories: [], isServiced: false)
var bmw2 = Cars(model: "X6", color: "White", buildDate: 2021, price: 69000, accessories: [], isServiced: false)
var bmw3 = Cars(model: "X6", color: "Red", buildDate: 2022, price: 58000, accessories: [], isServiced: false)
var bmwDealer = Dealer(name: "BMW", slogan: "Жрем масло!", showroomCapacity: 2)
print(bmwDealer.name)
print(bmwDealer.slogan)
bmwDealer.cars = [bmw1, bmw2, bmw3]
bmwDealer.orderCar()
bmwDealer.orderCar()
bmwDealer.orderCar()
bmwDealer.orderCar()
bmwDealer.orderCar()
bmwDealer.orderCar()
bmwDealer.orderCar()
bmwDealer.orderCar()
bmwDealer.orderCar()
bmwDealer.stockCars
bmwDealer.showroomCars

//Часть 4.
protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer()
}


extension Dealer: SpecialOffer {
    func addEmergencyPack() {
        toInstal += ["Аптечка", "Огнетушитель"]
    }
    
    func makeSpecialOffer() {
        if !stockCars.isEmpty {
            var i = stockCars.count - 1
            while i != 0 {
                var car = stockCars[i]
                if car.buildDate < 2022 {
                    print("Машина старше 2022 года найдена!")
                    self.addEmergencyPack()
                    print(toInstal)
                    self.addToShowroom(&car)
                }
                i -= 1
            }
            i = stockCars.count - 1
            while i != 0 {
                var car = stockCars[i]
                if car.buildDate < 2022 {
                    car.price *= 0.85
                    print("Скидка применена!")
                }
                i -= 1
            }
        } else {
            print("Нет машин на парковке!")
        }
        if !showroomCars.isEmpty {
            var i = showroomCars.count - 1
            while i != 0 {
                var car = showroomCars[i]
                if car.buildDate < 2022 {
                    print("Машина старше 2022 года найдена!")
                    self.addEmergencyPack()
                    self.presaleService(&car)
                }
                i -= 1
            }
            i = showroomCars.count - 1
            while i != 0 {
                var car = showroomCars[i]
                if car.buildDate < 2022 {
                    car.price *= 0.85
                    print("Скидка применена!")
                }
                i -= 1
            }
        } else {
            print("Нет машин в шоуруме!")
        }
    }
}

bmwDealer.makeSpecialOffer()
bmwDealer.stockCars
bmwDealer.showroomCars

print("DONE!")
