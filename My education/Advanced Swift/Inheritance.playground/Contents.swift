//  Наследование

class Vehicle {
    
    let brand: String
    let massa: Int
    
    init(brand: String, massa: Int) {
        self.brand = brand
        self.massa = massa
    }
    
    
    func go() {
        print("It's going!")
    }
}

let vehicle = Vehicle(brand: "Forward", massa: 12)
vehicle.massa
vehicle.brand
vehicle.go()

class Car: Vehicle {
    
    let carType: String
    let enginePower: Int
    
    init(brand: String, massa: Int, carType: String, enginePower: Int) {
        
        self.carType = carType
        self.enginePower = enginePower
        
        super.init(brand: brand, massa: massa)
        
    }
    
    func klakson() {
        print("Beep-beep!")
    }
}

let bmw = Car(brand: "BMW", massa: 1500, carType: "City", enginePower: 300)
let audi = Car(brand: "Audi", massa: 1600, carType: "City", enginePower: 220)

var cars: [Car] = [bmw, audi]

final class SportCar: Car {
    
    let maxSpeed: Int
    
    init(brand: String, massa: Int, enginePower: Int, maxSpeed: Int)  {
        
        self.maxSpeed = maxSpeed
        super.init(brand: brand, massa: massa, carType: "Sport Car", enginePower: enginePower)
    }
}

//class SuperSportCar: SportCar {
//    //  А низзя! :)
//}

let ferrari = SportCar(brand: "Ferrari", massa: 1800, enginePower: 430, maxSpeed: 340)
let porshe = SportCar(brand: "Porsche", massa: 1700, enginePower: 370, maxSpeed: 320)

bmw.massa
bmw.go()
bmw.klakson()
bmw.carType
ferrari.carType

cars.append(ferrari)
cars.append(porshe)

//cars[3].maxSpeed - пользоваться  не можем массив имеет свойства класса Car

cars[3].carType
cars[2].klakson()

(cars[3] as! SportCar).maxSpeed
// (cars[0] as! SportCar).maxSpeed - ошибка обычная машина - это не спорт-кар!

(cars[0] as? SportCar)?.maxSpeed

// Как достать из массива только спортивные машины?

var sportCars = [SportCar]()
for car in cars {
    if car is SportCar {
        sportCars.append((car as! SportCar))
    }
}

for sportCar in sportCars {
    print(sportCar.brand)
}
