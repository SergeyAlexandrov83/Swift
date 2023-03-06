import UIKit

//Кортеж (tuple) - значение, которое представлено группой значений

var brush: (Int, String, Double) = (12, "Red", 0.8)
            //0     1       2
brush = (5, "Green", 0.3)
brush.1 = "Yellow"
brush.1 = "Black"

var (width, _, alpha) = brush
width = 15
brush

brush.2 = 0.7
alpha

let notes = (bio: 4, geo: 5, eng: 4, math: 3, hist: 4)
notes.math

let user = (login: "Vasya", pin: 9876)

var bankCard = (pin: 1234, balance: 15000)
let sum = 18000
let pinPad = 1234

let buyCond = sum <= bankCard.balance && pinPad == bankCard.pin

buyCond ? bankCard.balance -= sum : print("Покупка не совершена")
bankCard.balance


// Последовательность (Range) - набор значений, который определяется начальной и конечной точкой

// ... - ClosedRange - замкнутая последовательность
// ..< - Range - полузамкнутая последовательность

let closedRange = 1...12
closedRange.lowerBound
closedRange.upperBound
let reversedRange = closedRange.reversed()
print(closedRange)
print(reversedRange)
//closedRange.forEach { num in
//    print(num)
//}
//
//reversedRange.forEach { num in
//    print(num)
//}

closedRange.contains(10)
closedRange ~= 10
closedRange.starts(with: 4...6)
closedRange.overlaps(20...40)


//КОЛЛЕКЦИЯ - набор однотипных значений

//Массивы - коллекция неуникальных однотипных значений, упорядоченных по целочисленному индексу. Индекс начинается с 0

var array1: Array<Int> = []
var array2: [Int] = []
var array3 = [Int]()

var zoo = ["Заяц", "Волк", "Лев", "Медведь", "Крокодил", "Олень"]
let hare = zoo[0]
let bear = zoo[3]
//let pisec = zoo[8] - Fatal error: Index out of range
zoo.indices
zoo.count
array2.count
zoo.isEmpty
array2.isEmpty
zoo.count
zoo[0] = "Кролик"
zoo.count
zoo.append("Жираф")
zoo.count
zoo.insert("Тигр", at: 3)
zoo.count
let deer = zoo.remove(at: 6)
zoo.count
var zoo2 = ["Обезьяна", "Попугай", "Удав"]
zoo += zoo2
zoo2.removeAll()
zoo2.isEmpty
zoo2.count
let firstItem = zoo.first
print(firstItem)
let boa = zoo.last
let bunny = zoo.removeFirst()
zoo.count
let boa2 = zoo.removeLast()
zoo.count
//zoo2.removeLast() - Fatal error: Can't remove last element from an empty collection
//zoo.insert("Тигр", at: 9) Fatal error: Array index is out of range

let mauses = Array(repeating: "Мышь", count: 8)
zoo += mauses
zoo.shuffle()
zoo.shuffle()
zoo.shuffle()
zoo.shuffle()
let shuffledZoo = zoo.shuffled()
zoo.removeAll { animal in
    animal.count <= 4
}
zoo

//Фильтрация
let filteredZoo = zoo.filter { animal in
    animal.first == "П"
}


//Сортировка

zoo.sort()
zoo.sort { firstAnimal, lastAnimal in
    firstAnimal < lastAnimal
}

// Ёлка, Ель, Ёж
// Ель, Ёж, Ёлка,


//Маппинг

let symblolsCount = zoo.map { animal in animal.count }
symblolsCount

var numbers = [3,4,6,2,4,8,2]
numbers.sort { $0 > $1 }
numbers.sort(by: <)

//forEach
zoo.forEach { animal in
    print(animal)
}

let countAnimals = [2,3,2,4,6]

zoo.indices.forEach { index in
    print("\(zoo[index]) - \(countAnimals[index]) шт.")
}

let countries = ["Россия", "Беларусь", "Грузия", "Польша"]
let capitals = ["Москва", "Минск", "Тбилиси", "Варшава"]

countries.indices.forEach { index in
    print("\(capitals[index]) - столица государства \(countries[index])")
}

typealias KM = Double
typealias CapitalCountry = (country: String, capital: String)

var capitalsCountires: [CapitalCountry] = [
    ("Россия", "Москва"),
    ("Беларусь", "Минск"),
    ("Армения", "Ереван"),
    ("Германия", "Берлин")]



capitalsCountires[2].capital

let london: CapitalCountry = ("Великобритания", "Лондон")
capitalsCountires.append(london)


capitalsCountires.forEach { cc in
    print("\(cc.capital) - столица государства \(cc.country)")
}


let n = [[45,64,56], [45,89,34]]
n.forEach { numbs in
    numbs.forEach { num in
        print(num)
    }
}













//Множества

//Словари










