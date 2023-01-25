import UIKit

//1. Есть массив целых чисел, надо проверить, сумма первого и последнего элементов делится ли на 5-й элемент. Если да, то первый элемент сделать такой же как 3й, а 4й поменять местами со 2м. Программа должна отработать без ошибки при любом количестве элементов

var intArray: [Int] = [4, 8, 5, 2, 1, 1, 5, 9, 0, 5]
let arrayLenght = intArray.count
if arrayLenght < 5 {
    print("Слишком мало элементов в массиве для выполнения условий задачи!")
} else {
    let sumFirstNLast = intArray.first! + intArray.last!
    if sumFirstNLast % intArray[4] == 0 {
        intArray[0] = intArray[2]
        let temp = intArray[3]
        intArray[3] = intArray[1]
        intArray[1] = temp
    }
}
intArray

//2. В строковом массиве содержатся два элемента - марки автомобилей. Требуется проверить, в алфавитном ли порядке они расположены. Если нет, поменять их местами. Также требуется вывести в консоль название автомобиля с минимальным количеством символов
var carMarks: [String] = ["Tesla", "Niva"]
if carMarks[0] > carMarks[1] {
    var temp = carMarks[0]
    carMarks[0] = carMarks[1]
    carMarks[1] = temp
}
carMarks
if carMarks[0].count < carMarks[1].count {
    print(carMarks[0])
} else {
    print(carMarks[1])
}

//3. Есть массив с цифрами от 2 до 9. Требуется, используя этот массив, вывести произвольную строку из таблицы умножения
var digitRange = 2...9
let multipleArgument = digitRange.randomElement()!
digitRange.forEach { digit in
    print("\(digit) * \(multipleArgument) = \(digit * multipleArgument)")
}

//4. Два человека соревнуются в троеборье, которое состоит из подтягивания, подъёмов туловища и приседаний. Результаты записываются в виде кортежей отдельно для каждого игрока. За 1 подтягивание атлет получает 70 очков, за подъём туловища - 45 очков, а за приседание - 50 очков. Создайте такие кортежи и заполните их значениями. Определите победителя в состязании.
let firstMan = (15, 30, 34)
let secondMan = (17, 27, 38)
let points = (70, 45, 50)
let firstManPoints = firstMan.0 * points.0 + firstMan.1 * points.1 + firstMan.2 * points.2
let secondManPoints = secondMan.0 * points.0 + secondMan.1 * points.1 + secondMan.2 * points.2
firstManPoints > secondManPoints ? print("Первый мужик - красава!") : print("Второй мужик - красава!")

//5. Данные об успеваемости учеников по математике хранятся в массиве кортежей в формате Фамилия - оценка. Требуется:
var mathArray = [("Иванов", 4), ("Петров", 5), ("Сидоров", 3), ("Тимофеев", 5), ("Харитонов", 2)]
//    -  Отсортировать массив по успеваемости в порядке от лучших оценок к худшим
mathArray.sort { firstStud, lastStud in
    firstStud.1 > lastStud.1
}
//    -  Отсортировать массив в обратном алфавитном порядке
mathArray.sort { firstStud, lastStud in
    firstStud.0 > lastStud.0
}
//    -  Сформировать массив проблемных учеников, у которых оценки ниже, чем «4»
var troubleStuds: [(String, Int)] = []
mathArray.forEach { stud in
    if stud.1 < 4 {
        troubleStuds.append(stud)
    }
}
troubleStuds
//    -  Найти средний балл в классе
let studsCount = mathArray.count
var rateSum = 0
mathArray.forEach { stud in
    rateSum += stud.1
}
rateSum
let middleRate = Double(rateSum) / Double(studsCount)

//6.  Покупатель стоит на кассе с корзинкой продуктов. Корзинка представлена в виде массива. Элемент массива - кортеж, содержащий в себе название, цену и количество продукта данной позиции.
var shopingBucket: [(name: String, price: Double, count: Double)] = []
shopingBucket.append((name: "Milk", price: 97.80, count: 2))
shopingBucket.append((name: "Bread", price: 34.55, count: 1))
shopingBucket.append((name: "Beer", price: 145, count: 6))
//    -  Посчитайте стоимость продуктов в корзине.
var shopingBill: Double = 0
var maxPrice: Double = 0
var maxPricePos = shopingBucket[0]
shopingBucket.forEach { position in
    var pricePos = position.count * position.price
    shopingBill += pricePos
    if pricePos > maxPrice {
        maxPrice = pricePos
        maxPricePos = position
    }
}
print("На кассу: \(shopingBill)")
//    -  Определите, за какой из продуктов покупатель заплатит больше всего.
print("Самая высокая стоимость у: \(maxPricePos.name) и стоило: \(maxPrice)")
//    -  Отсортируйте продукты в порядке убывания стоимости
shopingBucket.sort { firstPos, lastPos in
    firstPos.count * firstPos.price > lastPos.count * lastPos.price
}
shopingBucket

//7. Есть три массива - массив с фамилиями учеников, массив с их оценками по математике и массив с их оценками по биологии. Заранее известно, что количество элементов во всех массивах одинаковое. Требуется получить массив, содержащий строки вида: «Пупкин получил 5 по математике и 3 по биологии»
let studsArray = ["Пупкин", "Иванов", "Петров", "Сидоров"]
let mathRates = [5, 4, 5, 3]
let bioRates = [3, 5, 5, 3]

var finalArray: [String] = []
studsArray.forEach { stud in
    var index = studsArray.firstIndex(of: stud)!
    finalArray.append("\(studsArray[index]) получил \(mathRates[index]) по математике и \(bioRates[index]) по биологии")
}
finalArray
