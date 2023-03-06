import UIKit

//for - in - цикл с параметром

//for {имяПараметра} in {коллекция} {
//  действия с параметром
//
//}

//for-in со строкой
let str = "Уж небо осенью дышало"
//Итерация - это один проход цикла
for char in str {
    print(char)
}

//for-in с последовательностью
let range = 2..<20
for num in range {
    print("\(num) * \(num) = \(pow(Decimal(num), 2))")
}

let weights = [2.4, 3.5, 0.2, 0.8, 1.3]

var sumWeight = 0.0
for weight in weights {
    sumWeight += weight
}
sumWeight
sumWeight = 0

weights.forEach { weight in
    sumWeight += weight
}
sumWeight

let trees = ["Берёза", "Дуб", "Ясень", "Бук"]
//По индексу 0 расположено делево Берёза. Количество символов - 6

for (index, tree) in trees.enumerated() {
    print("По индексу \(index) расположено дерево \(tree). Количество символов - \(tree.count)")
}

trees.enumerated().forEach { (index, tree) in
    print("По индексу \(index) расположено дерево \(tree). Количество символов - \(tree.count)")
}


// for-in со Словарём
var sklad: [String: Int] = [
    "Шкаф навесной": 6,
    "Столешница": 3,
    "Шкаф напольный": 4,
    "Раковина": 7
]

for (thing, count) in sklad {
    print("\(thing) - \(count) шт.")
}

print("------------------")

sklad["Сушилка для посуды"] = 15
for (thing, count) in sklad {
    print("\(thing) - \(count) шт.")
}

for thing in sklad.values {
    print(thing)
}

for (thing, _) in sklad {
    print("\(thing)")
}

for (_, count) in sklad {
    print("\(count)")
}

for _ in 1...5 {
    print("Привет!")
}
(1...5).forEach { int in
    print(int)
}


//for-in с множеством
let mosMetro: Set = ["Курская", "Войковская", "Белорусская", "Ховрино", "Черкизовская"]
for station in mosMetro {
    print(station)
}


//Условные инструкции
//1 - if-else

//if условие1: Bool {
//    действие, если условие1 == true
//} else if условие2: Bool {
//    действие, если условие1 == false && условие2 == true
//} else {
//    Действие, если условие == false
//}

//Требуется определить, можно ли от шоколадки размером n × m долек отломить k долек, если разрешается сделать один разлом по прямой между дольками (то есть разломить шоколадку на два прямоугольника). Если можно, указать, по какой именно стороне. Если нельзя, указать причину, почему нельзя

let lenght = 8
let width = 4
let bricks = 13

let countCondition = bricks < lenght * width
let widthCondition = bricks % width == 0
let lenghtCondition = bricks % lenght == 0

if countCondition {
    if widthCondition && lenghtCondition {
        print("Можно и по длине, и по ширине")
    } else if widthCondition {
        print("Можно по ширине")
    } else if lenghtCondition {
        print("Можно по длине")
    } else {
        print("Нельзя ни по длине, ни по ширине")
    }
} else {
    print("Нельзя, потому что столько долек нет в школадке")
}

let array = [2,3,5,7,6,5]
var squares = [Int]()
for int in array {
    squares.append(int * int)
}
squares

var squares2 = array.map { $0 * $0 }
squares2

switch (countCondition, widthCondition, lenghtCondition) {
case (false, _, _):
    print("Нельзя, потому что столько долек нет в школадке")
case (_, true, true):
    print("Можно и по длине, и по ширине")
case (_, true, false):
    print("Можно по ширине")
case (_, false, true):
    print("Можно по длине")
default:
    print("Нельзя ни по длине, ни по ширине")
}







//Это отвлечённая тема - Замыкания и $
let triangle = (3,4,5)
let perim: (_ first: Int, _ second: Int, _ third: Int) -> Int = { $0 + $1 + $2 }

let perim2: (_ first: Int, _ second: Int, _ third: Int) -> Int = { x,y,z in
    x + y + z
}
    
let sum = perim(triangle.0, triangle.1, triangle.2)


//2 - switch - case - ветвление с параметром

var age = 12

switch age {
case ..<0 :
    print("Ещё не родился")
case 0...3:
    print("Младенец")
case 3...10:
    print("Ребёнок")
case 10...13:
    break
case 14...17:
    print("Несовершеннолетний с паспортом")
case let currentAge where currentAge < 70:
    print("Взрослый: \(age) лет")
case let currentAge where currentAge >= 70 && currentAge < 120:
    print("Пожилой: \(currentAge) лет")
default:
    break
}

for num in [1,2,3,4,5,6,7,9] {
    num % 2 == 0 ? print(num) : ()
}

let car = ("BMW", "Red")
let taxi = ("Hyundai", "Yellow")
let taxi2 = ("Peugeot", "Yellow")

car == taxi

switch car {
case (let brend, "Red"):
    print("Yellow Hyundai! Идеально!")
    fallthrough
case (let brend, "Yellow"):
    print("Можно в такси, жёлтый \(brend)")
case (let brend, let color):
    print("Не годится. \(color) \(brend) Надо перекрасить")
}

age = 14

switch age {
case 14:
    print("Нужно получить паспорт")
case 20, 45:
    print("Нужно поменять паспорт")
default: break
}

//1. Работает последовательно
//2. Выполняет только один кейс
//3. Обязан проверить все возможные значения






//3 - guard else





 
