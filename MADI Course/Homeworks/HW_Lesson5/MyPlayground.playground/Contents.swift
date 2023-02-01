import UIKit
// 1. Известно число жителей, проживающих в каждом доме улицы. Нумерация домов проведена подряд. Дома с нечетными номерами расположены на одной стороне улицы, с четными — на другой. На какой стороне улицы проживает больше жителей? Использовать только один оператор цикла.
let housePopulaton = [150, 174, 138, 143, 156, 164, 144, 123, 175, 145]
var oddPopulation = 0
var evenPopulation = 0
for (index, pop) in housePopulaton.enumerated() {
    if index == 0 || index % 2 == 0 {
        evenPopulation += pop
    } else {
        oddPopulation += pop
    }
}
oddPopulation
evenPopulation
oddPopulation > evenPopulation ? print("На нечетной стороне жителей больше!") : print("На четной стороне жителей больше!")

// 2. Известны данные о количестве осадков, выпавших за каждый день марта. Верно ли, что осадков не было 10 дней в месяц?
let marchPrecipitation = [true, true, false, false, false, true, false, false, false, false] // Мне правда лень писать 31 раз были осадки или нет...
var count = 0
for day in marchPrecipitation {
    count = day ? count + 1 : 0
    if count == 10 {
        break
    }
}
if count == 10 {
    print("Это правда!")
} else {
    print("Это не правда!")
}

// 3. Известны стоимости (в долларах) нескольких марок легковых автомобилей и мотоциклов. Верно ли, что средняя стоимость автомобилей превышает среднюю стоимость мотоциклов более чем в 3 раза?
let motoPrices = [6700, 9800, 7500, 4500, 12800]
let carPrices = [24600, 48000, 43499, 64000, 38000]
var midMoto = 0
var midCar = 0
for price in motoPrices {
    midMoto += price
}
midMoto /= motoPrices.count
for price in carPrices {
    midCar += price
}
midCar /= carPrices.count
print(midCar / 3 > midMoto)

// 4. Известен возраст группы людей в списке. Какой человек указан в списке раньше: самый старший или самый молодой?
let peoplesAge = [23, 12, 45, 34, 25, 39] // Через max и min решать нельзя?
var maxAgeIndex = 0
var maxAge = peoplesAge[maxAgeIndex]
var minAgeIndex = 0
var minAge = peoplesAge[minAgeIndex]
for (index, age) in peoplesAge.enumerated() {
    if age > maxAge {
        maxAge = age
        maxAgeIndex = index
    }
    if age < minAge {
        minAge = age
        minAgeIndex = index
    }
}
minAgeIndex < maxAgeIndex ? print("Самый молодой") : print("Самый старый")

//5. Размеры нескольких параллелепипедов (длина, ширина, высота) хранятся в массиве кортежей. Определить:
let figures = [(3, 5, 7), (2, 3, 8), (4, 7, 6), (8, 9, 3)]
var max = 0
var min = 9999
var numberOfMax = 0
var numbarOfMin = 0
for (index, figure) in figures.enumerated() {
    var value = figure.0 + figure.1 + figure.2
    if value > max {
        max = value
        numberOfMax = index
    }
    if value < min {
        min = value
        numbarOfMin = index
    }
}
//а) максимальный объем фигуры;
print(max)
//б) минимальный объем фигуры;
print(min)
//в) номер фигуры, имеющей максимальный объем;
print(numberOfMax)
//г) номер фигуры, имеющей минимальный объем.
print(numbarOfMin)

//6. В некотором году (назовем его условно первым) на участке в 100 гектаров средняя урожайность ячменя составила 20 центнеров с гектара. После этого каждый год площадь участка увеличивалась на 5%, а средняя урожайность на 2%. Определить:
var year = 1
var field = 100.0
var profit = 20.0
var sumProfit = 20.0
var neededProfitYear = 0
var neededFieldYear = 0
while sumProfit <= 800.0 {
    year += 1
    field *= 1.05
    profit *= 1.02
    //а) в каком году урожайность превысит 22 центнера с гектара;
    if profit > 22.0 && neededProfitYear == 0{
        print("Урожайность превысила 22 центнера с гектара: \(year)")
        neededProfitYear = year
    }
    //б) в каком году площадь участка станет больше 120 гектаров;
    if field > 120.0 && neededFieldYear == 0{
        print("Площадь участка станла больше 120 гектаров: \(year)")
        neededFieldYear = year
    }
    sumProfit += profit
    //в) в каком году общий урожай, собранный за все время, начиная с первого года, превысит 800 центнеров.
}
print("Happy new year! \(year)")

//7. Определить количество элементов массива, значение которых больше соседних элементов
let taskArray = [2, 4, 3, 7, 5, 9, 5, 7, 3, 0, 6]
var countElement = 0
for (index, element) in taskArray.enumerated() {
    switch index {
    case 0:
        if element > taskArray[index + 1] {
            countElement += 1
        }
    case 1..<taskArray.count - 1:
        if taskArray[index - 1] < element && element > taskArray[index + 1] {
            countElement += 1
        }
    case taskArray.count - 1:
        if element > taskArray[index - 1] {
            countElement += 1
        }
    default:
        print("Что-то пошло не так, Нео, проснись!")
    }
}
print(countElement)

//8. Найти среднее арифметическое четных положительных элементов массива, стоящих на нечетных позициях
let nextTaskArray = [2, 4, 3, 7, 5, 9, 5, 7, 4, 3, 7, 5, 9, 5, 7, 4, 3, 7, 5, 9, 5, 7]
var sumOfElements = 0.0
var countOfEven = 0
for element in nextTaskArray.enumerated() {
    if element.0 % 2 != 0 && element.0 > 0 {
        if element.1 % 2 == 0 {
            sumOfElements += Double(element.1)
            countOfEven += 1
        }
    }
}
let midOfChtoToTam = sumOfElements / Double(countOfEven)
print(midOfChtoToTam)
