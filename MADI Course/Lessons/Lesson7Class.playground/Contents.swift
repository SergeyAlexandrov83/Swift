import UIKit

// ООП - Объектно-ориентированное программирование
// Модели - типы данных
// Объекты - экземпляры данных
// Класс это ссылочный тип данных(описание объекта)

class Teapot {
    //Свойства - константы или переменные, которые хранят или вычисляют состояние объекта или типа
    let title: String
    var price: Int
    let color: String
    let power: Int
    let isElectrical: Bool
    let volume: Double
    var waterTemp: Int = 23
    
    
    var waterVolume: Int
    
    
    
    
    
    
    //Инициализаторы - методы типа, которые создают экземпляр этого типа
    init(title: String, price: Int, color: String, power: Int, isElectrical: Bool, volume: Double, waterVolume: Int) {
        self.title = title
        self.price = price
        self.color = color
        self.isElectrical = isElectrical
        self.power = power
        self.volume = volume
        self.waterVolume = waterVolume
    }
    
    
    
    
    
    
    //Методы - функции, которые аасоциированы с экземпляром или типом
    func boil() {
        self.waterTemp = 100     // или без self, компилятор поймет
        
    }
    
    func about() -> String {
        " \(isElectrical ? "Электрический" : "Газовый") \(title). Цвет \(color). Цена: \(price)."
    }
}

//func addWater(amount: Double) {
//    if amount <= volume - waterVolume) {
//        waterVolume += amout
//        print("Воды в чайнике теперь \(waterVolume)")
//    } else {
//        waterVolume = volume
//        print("Выключи воду")
//    }
//}



// self - неявно заданное свойство экземпляра, которое ссылается на сам экземпляр. Мое



let scarlett = Teapot(title: "Scarlett",
                    price: 2300,
                    color: "Черный",
                    power: 1800,
                    isElectrical: true,
                    volume: 1.8)


let tefal = Teapot(title: "Tefal",
                   price: 5400,
                   color: "White",
                   power: 2500,
                   isElectrical: true,
                   volume: 2.1)

let teapot: [Teapot] = [            // массив типа чайник
    scarlett,
    tefal
]

for teapot in teapot {
    print("\(teapot.color) Чайчник \(teapot.title) стоит \(teapot.price)BYN.")
}


scarlett.about()
tefal.about()
