import Cocoa

//Часть 1.
protocol Car {
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
    var accessories: [String] = []
    var isServiced: Bool
}

class Dealer: Dealership {
    var name: String
    var showroomCapacity: Int
    var stockCars: [Cars] = []
    var showroomCars: [Cars] = []
    var cars: [Cars] = []
    
    init(name: String, slogan: String, showroomCapacity: Int) {
        self.name = "\(name) - \(slogan)"
        self.showroomCapacity = showroomCapacity
    }
    
    func offerAccesories(_ accessories: [String]) {
        print("Клиент согласился купить \(accessories)")
    }
    
    func presaleService(_ car: inout Cars) {
        print("Предпродажная подготовка проведена")
        if car.accessories .isEmpty {
            car.accessories = ["Тонировка", "Сингнализация", "Спортивные диски"]
            print("Установлено дополнительное оборудование!")
            print(car.accessories)
        }
        car.isServiced = true
    }
    
    func addToShowroom(_ car: inout Cars) {
        if let index = stockCars.firstIndex(of: car) {
            stockCars.remove(at: index)
        }
        self.presaleService(&car)
        showroomCars.append(car)
        print("Машина \(car) перемещена со стоянки в шоурум!")
    }
    
    func sellCar(_ car: inout Cars) {
        if let index = stockCars.firstIndex(of: car) {
            stockCars.remove(at: index)
            showroomCars.append(car)
            print("Машина \(car) перемещена со стоянки в шоурум!")
        }
        if car.accessories .isEmpty {
            self.offerAccesories(["Тонировка", "Сингнализация", "Спортивные диски"])
            self.presaleService(&car)
        }
            print("Машина \(car) продана клиенту!")
    }
    
    func orderCar() {
        stockCars.append(cars[0])
    }
}

var bmw = Cars(model: "X6", color: "Black", buildDate: 2022, price: 48000, accessories: [], isServiced: false)
var bmwDealer = Dealer(name: "BMW", slogan: "Жрем масло!", showroomCapacity: 1)
print(bmwDealer.name)
bmwDealer.cars.append(bmw)
bmwDealer.orderCar()
bmwDealer.sellCar(&bmw)

//Часть 4.
protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer()
}


extension Dealer: SpecialOffer {
    func addEmergencyPack() {
        print("Аптечка и огнетушитель добавлены! Вопрос только куда?")
    }
    
    func makeSpecialOffer() {
        for car in stockCars {
            if car.buildDate < 2022 {
                car.price = car.price * 0.85
                self.addEmergencyPack()
                self.addToShowroom(car)
            }
        }
        for car in showroomCars {
            if car.buildDate < 2022 {
                car.price = car.price * 0.85
                self.addEmergencyPack()
            }
        }
    }
}
