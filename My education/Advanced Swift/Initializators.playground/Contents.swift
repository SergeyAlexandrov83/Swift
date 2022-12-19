// Инициализаторы

class Car {
    
    let brandAndModel: String
    let wheelsCount: Int
    var color = "White"
    
    // Инициализатор по умолчанию
    init(brandAndModel: String, wheelsCount: Int = 4) {
        self.brandAndModel = brandAndModel
        self.wheelsCount = wheelsCount
    }
    
    // Memberwise-инициализатор
    init(brandAndModel: String, wheelsCount: Int, color: String) {
        self.brandAndModel = brandAndModel
        self.wheelsCount = wheelsCount
        self.color = color
    }
    
    // Failale-инициализатор
    init?(brand: String, model: String, wheelsCount: Int) {
        
        if wheelsCount < 4 {
            return nil
        } else {
            self.wheelsCount = wheelsCount
            self.brandAndModel = "\(brand) \(model)"
        }
    }
    
    // "Удобный" инициализатор
    convenience init(brandAndModel: String, colour: String) {
        self.init(brandAndModel: brandAndModel)
        self.color = colour
    }
}

let mers = Car(brandAndModel: "Mercedes-Benz AMG")
let audi = Car(brandAndModel: "Audi A4", wheelsCount: 6)
let honda = Car(brandAndModel: "Honda Accord", colour: "Red")
