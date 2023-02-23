import UIKit

class Animal {
    
    var energy: Int
    var weight: Int
    var currentAge: Int = 0
    let maxAge: Int
    let name: String
    
    var isTooOld: Bool { currentAge >= maxAge }
    init(energy: Int,
         weight: Int,
         maxAge: Int,
         name: String) {
        self.energy = energy
        self.weight = weight
        self.maxAge = maxAge
        self.name = name
    }
    
    func sleep() {
        energy += 5
        currentAge += 1
        print("\(name) спит")
    }
    func food() {
        energy += 3
        weight += 1
        tryIncAge()
        print("\(name) ест")
    }
    func move() {
        guard !isTooOld else {
            print("\(name) хотело подвигаться, но оно слишком старо для этого дерьма!")
            return
        }
        guard energy >= 5 else {
            print("\(name) хотело подвигаться, но сил нет и оно уснуло!")
            return
//            sleep()
            
        }
        guard weight >= 1 else {
            print("\(name) хотело подвигаться, но оно слишком голодное и решило поесть!")
            return
//            food()
        }
        energy -= 5
        weight -= 1
        tryIncAge()
        print("\(name) двигается")
    }
    func tryIncAge() {
        if Bool.random() {
            currentAge += 1
        }
    }
    func sex() -> Animal {
        let animal = Animal(energy: Range(1...10).randomElement()!, weight: Range(1...5).randomElement()!, maxAge: maxAge, name: name)
        print("Родилось \(animal.name)! Энергия: \(animal.energy). Вес: \(animal.weight).")
        return animal
    }
}
//        По желанию: добейтесь, чтобы дополнительное сообщение выводилось только если выполнилась родительская реализация.
class Bird: Animal {
    override func move() {
        super.move()
//        print("Летит")
    }
    override func sex() -> Bird {
        let animal = Bird(energy: Range(1...10).randomElement()!, weight: Range(1...5).randomElement()!, maxAge: maxAge, name: name)
        print("Родилось \(animal.name)! Энергия: \(animal.energy). Вес: \(animal.weight).")
        return animal
    }
}
class Fish: Animal {
    override func move() {
        super.move()
//        print("Плывет")
    }
    override func sex() -> Fish {
        let animal = Fish(energy: Range(1...10).randomElement()!, weight: Range(1...5).randomElement()!, maxAge: maxAge, name: name)
        print("Родилось \(animal.name)! Энергия: \(animal.energy). Вес: \(animal.weight).")
        return animal
    }
}
class Dog: Animal {
    override func move() {
        super.move()
//        print("Бежит")
    }
    override func sex() -> Dog {
        let animal = Dog(energy: Range(1...10).randomElement()!, weight: Range(1...5).randomElement()!, maxAge: maxAge, name: name)
        print("Родилось \(animal.name)! Энергия: \(animal.energy). Вес: \(animal.weight).")
        return animal
    }
}

class NatureReserve {
    var animals: [Animal] = []
}

let bird1 = Bird(energy: 4, weight: 5, maxAge: 3, name: "Птица-Один")
let bird2 = Bird(energy: 6, weight: 3, maxAge: 3, name: "Птица-Два")
let bird3 = Bird(energy: 7, weight: 4, maxAge: 3, name: "Птица-Три")
let bird4 = Bird(energy: 2, weight: 1, maxAge: 3, name: "Птица-Четыре")
let bird5 = Bird(energy: 8, weight: 2, maxAge: 3, name: "Птица-Пять")
let fish1 = Fish(energy: 4, weight: 4, maxAge: 2, name: "Рыба-Один")
let fish2 = Fish(energy: 6, weight: 2, maxAge: 2, name: "Рыба-Два")
let fish3 = Fish(energy: 3, weight: 3, maxAge: 2, name: "Рыба-Три")
let dog1 = Dog(energy: 9, weight: 7, maxAge: 4, name: "Собака-Один")
let dog2 = Dog(energy: 8, weight: 6, maxAge: 4, name: "Собака-Два")
let animal1 = Animal(energy: 9, weight: 7, maxAge: 3, name: "Животное-Один")
let animal2 = Animal(energy: 7, weight: 6, maxAge: 3, name: "Животное-Два")
let animal3 = Animal(energy: 8, weight: 6, maxAge: 3, name: "Животное-Три")
let animal4 = Animal(energy: 4, weight: 8, maxAge: 3, name: "Животное-Четыре")
let animal5 = Animal(energy: 5, weight: 3, maxAge: 3, name: "Животное-Пять")

let park = NatureReserve()
park.animals = [bird1, bird2, bird3, bird4, bird5, fish1, fish2, fish3, dog1, dog2, animal1, animal2, animal3, animal4, animal5]

for _ in 1...10 {
    park.animals.forEach { animal in
        let action = Range(1...4).randomElement()!
        if action == 1 {
            animal.sleep()
        } else if action == 2 {
            animal.food()
        } else if action == 3 {
            animal.move()
        } else if action == 4 {
            park.animals.append(animal.sex())
        }
    }
    var temp: [Animal] = []
    park.animals.forEach { animal in
        if !animal.isTooOld {
            temp.append(animal)
        }
    }
    park.animals = temp
    print(park.animals.count)
}
