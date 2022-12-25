import Cocoa

protocol Car {
    var model: String { get }
    var color: String { get }
    var buildDate: Int { get }
    var price: Double { get set }
    var accessories: [String] { get set }
    var isServiced: Bool { get set }
    var VIN: Int { get }
}

protocol Dealership {
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [Car] { get set }
    var showroomCars: [Car] { get set }
    var cars: [Car] { get set }
    
    func offerAccesories(_: [String]) -> [String]
    func presaleService(_: inout Car)
    func addToShowroom(_: inout Car)
    func sellCar(_: inout Car)
    func orderCar(_ : carFabric)
}

struct Cars: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Double
    var accessories: [String]
    var isServiced: Bool
    var VIN: Int
}

final class carFabric {
    let name: String
    var usedVINs: [Int] = []
    var model: [String]
    var color: [String]
    var buildDate: [Int]
    
    init(name: String, model: [String], color: [String], buildDate: [Int]) {
        self.name = name
        self.model = model
        self.color = color
        self.buildDate = buildDate
    }
    
    private func randomVIN(_ usedVINs: inout [Int]) -> Int { // +1 не интересно
        let min: UInt32 = 10000
        let max: UInt32 = 99999
        while true {
            let vin = Int(arc4random_uniform((max - min) + 1) + min)
            if !usedVINs.contains(vin) {
                usedVINs.append(vin)
                return vin
            }
        }
    }
    
    private func randomPrice() -> Double {
        let min: UInt32 = 3000000
        let max: UInt32 = 20000000
        let price = Double(arc4random_uniform((max - min) + 1) + min)
        return price
    }
    
    func randomCarGen() -> Car {
        var car = Cars(model: model.randomElement()!, color: color.randomElement()!, buildDate: buildDate.randomElement()!, price: randomPrice(), accessories: [], isServiced: false, VIN: randomVIN(&usedVINs))
        return car
    }
}

class Dealer: Dealership {
    let name: String
    let slogan: String
    var showroomCapacity: Int
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars: [Car] {
        get {
            stockCars + showroomCars
        }
        set {
            stockCars + showroomCars
        }
    }
    
    init(name: String, slogan: String, showroomCapacity: Int) {
        self.name = name
        self.slogan = slogan
        self.showroomCapacity = showroomCapacity
    }
    
    func offerAccesories(_ offer: [String]) -> [String] {
        print("Клиент согласился купить \(offer)")
        return offer
    }
    
    func presaleService(_ car: inout Car) {
        if !car.isServiced {
            car.isServiced = true
            print("Предпродажная подготовка проведена")
        } else {
            print("Предпродажная подготовка не требуется")
        }
    }
    
    func addToShowroom(_ car: inout Car) {
        if showroomCars.count < showroomCapacity {
            if let index = stockCars.firstIndex(where: {$0.VIN == car.VIN}) {
                stockCars.remove(at: index)
            }
            self.presaleService(&car)
            showroomCars.append(car)
        } else {
            if let index = stockCars.firstIndex(where: {$0.VIN == car.VIN}) { // Вот где была зарыта собака, надо было перезаписать объект!
                stockCars.remove(at: index)
            }
            self.presaleService(&car)
            print("В шоуруме закончились места, оставляем машину на стоянке!")
            stockCars.append(car)
        }
    }
    
    func sellCar(_ car: inout Car) {
        if car.accessories.isEmpty || car.accessories == ["Аптечка", "Огнетушитель"] {
            let offer = self.offerAccesories(["Тонировка", "Сингнализация", "Спортивные диски"])
            car.accessories += offer
        }
        self.presaleService(&car)
        print(car)
        if let index = stockCars.firstIndex(where: {$0.VIN == car.VIN}) {
            stockCars.remove(at: index)
        }
        if let index = showroomCars.firstIndex(where: {$0.VIN == car.VIN}) {
            showroomCars.remove(at: index)
        print("Машина успешно продана!")
        }
    }
    
    func orderCar(_ fabric: carFabric) { // Указываем с какой фабрики мы хотим автомобиль и получаем рандомную машину - параметры задаются фабрикой
        var car = fabric.randomCarGen()
        stockCars.append(car)
        print("Машина \(car.model) - \(car.VIN) с фабрики \(fabric.name) успешно доставлена и ожидает на стоянке автосалона!")
    }
}

protocol SpecialOffer {
    func addEmergencyPack() -> [String]
    func makeSpecialOffer()
}

extension Dealer: SpecialOffer {
    func addEmergencyPack() -> [String] {
        let emergencyPack = ["Аптечка", "Огнетушитель"]
        return emergencyPack
    }
    
    private func specialOffer(_ carArray: [Car]) {
        if !carArray.isEmpty {
            var i = carArray.count - 1 // Зато удаление безопасное!
            while i != -1 {
                var car = carArray[i]
                if car.buildDate < 2022 {
                    print("Машина старше 2022 года найдена!")
                    let emergencyPack = self.addEmergencyPack()
                    car.accessories += emergencyPack
                    print("Добавили аптечку и огнетушитель!")
                    car.price *= 0.85
                    print("Скидка применена!")
                    self.addToShowroom(&car)
                }
                i -= 1
            }
        }
    }
    
    func makeSpecialOffer() {
        specialOffer(stockCars)
        specialOffer(showroomCars)
    }
}

// Создаем пару фабрик
let fabric1 = carFabric(name: "Афтовас", model: ["LADA", "MOSKVICH", "VOLGA"], color: ["GREEN", "YELLOW", "BLUE"], buildDate: [2020, 2021])
let fabric2 = carFabric(name: "Вася-перекуп Inc.", model: ["MERCEDES", "LEXUS", "BMW"], color: ["BLACK", "WHITE", "RED"], buildDate: [2021, 2022])

// Диллерский центр
let autoSale = Dealer(name: "Super Auto", slogan: "Упрявляй ведром!", showroomCapacity: 3)

// Закажем несколько машин
autoSale.orderCar(fabric1)
autoSale.orderCar(fabric1)
autoSale.orderCar(fabric1)
autoSale.orderCar(fabric1)
autoSale.orderCar(fabric1)
autoSale.orderCar(fabric2)
autoSale.orderCar(fabric2)
autoSale.orderCar(fabric2)
autoSale.orderCar(fabric2)
autoSale.orderCar(fabric2)
autoSale.stockCars

// Спецпредложение Activated!
autoSale.makeSpecialOffer()
autoSale.stockCars
autoSale.showroomCars

// Продадим машину?
var carToSale = autoSale.showroomCars[0] // А как то по человечески указывать объект можно?
autoSale.sellCar(&carToSale)
autoSale.stockCars
autoSale.showroomCars
