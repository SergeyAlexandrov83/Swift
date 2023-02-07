import UIKit

// 1. Представим банк, в котором алгоритм начисления процента по вкладу зависит от суммы вклада. В функцию в качестве параметра будет подаваться число (сумма вклада), а также количество лет. При значении меньше 10000, будет начислено 5% ежегодно, если значение находится в диапазоне от 10000 до 50000 — 7% ежегодно, если больше 50000, то 10% ежегодно. Отработав, функция должна вернуть общую сумму с начисленными процентами.
func earings(sum: Int, years: Int) -> Int {
    var summary = sum
    switch summary {
    case  ..<10000:
        for _ in 1...years {
            summary += summary / 100 * 5
        }
    case 10000...50000:
        for _ in 1...years {
            summary += summary / 100 * 7
        }
    default:
        for _ in 1...years {
            summary += summary / 100 * 10
        }
    }
    return summary
}

print(earings(sum: 45000, years: 5))
print(earings(sum: 59000, years: 10))
print(earings(sum: 5000, years: 1))

// 2. Стрелок стреляет в мишень. Диаметр центрального круга (10-ки) - 1 см, толщина каждого кольца мишени - 1 см, всего областей мишени 10 (9 колец и один круг - 10-ка, совмещённая с центром координатной плоскости). Известны координаты 5-ти попаданий. Посчитать сумму выбитых очков. Возможно попадания в «Молоко»
let resultCoord = [(3.5 , 6.1), (2.9, 1.1), (1.4, 1.3), (0.1, 0.3), (8.7, 14.9)]

func scoreCount(coord: (Double, Double)) -> Int {
    let lenght = Int(sqrt(pow(coord.0, 2) + pow(coord.1, 2)))
    var score = 11 - lenght
    if score < 0 {
        score = 0
    }
    return score
}

var totalScore = 0
resultCoord.forEach { shootCoord in
    totalScore += scoreCount(coord: shootCoord)
}
print(totalScore)

// 3. Напишите функцию, которая вычисляет  и возвращает заданное количество процентов (целочисленное) от заданного числа
func percentBy(number: Double, percent: Int) -> Double {
    return number * Double(percent) / 100
}
print(percentBy(number: 45000.0, percent: 20))

// 4. Напишите функцию, предназначенную для вычисления количества пробелов в переданной в качестве параметра строке.
func countOfSpaces(string: String) -> Int {
    var count = 0
    string.forEach{char in
        char == " " ? count += 1 : ()
    }
    return count
}
print(countOfSpaces(string: "Мой дядя самых честных правил, и всех нечесных на ___ он отправил.."))

// 5. Напишите функцию, которая вычисляет и возвращает отдельно две суммы элементов массива имеющих, четное значение и нечетное
let nums = [3, 7, 16, 26, 18, 13, 9, 91, 71, 33]
func sumOfOddNEven(array: [Int]) -> [String: Int] {
    var oddSum: Int = 0
    var evenSum: Int = 0
    array.forEach { num in
        if num % 2 == 0 {
            evenSum += num
        } else {
            oddSum += num
        }
    }
    return ["Odd": oddSum, "Even": evenSum]
}

print(sumOfOddNEven(array: nums))

// 6. Написать функцию isPrime, принимающую 1 аргумент — число от 0 до 1000, и возвращающую True, если оно простое, и False - иначе.
func isPrime(num: Int) -> Bool {
    var count = 0
    for i in 2...num / 2 + 1 {
        if num % i == 0 {
            count += 1
        }
    }
    let prime = count == 0 ? true : false
    return prime
}

print(isPrime(num: 13))
print(isPrime(num: 8))
print(isPrime(num: 10000))

// 7. Человек в мебельном магазине хочет купить письменный стол. Он может донести его до собственной машины сам, если вес стола не превышает 40 кг либо попросить грузчиков, если его вес больше. Однако, если стол в упаковке по одной из сторон больше 140 см, а по другой - больше 70 см, придётся заказывать доставку, так как стол в собственную машину не поместится. Напишите функцию, которая принимает вес и габариты стола и сообщает, как именно будет доставлен стол - собственноручно, с помощью грузчиков или с помощью доставки?
func delivery(weight: Int, lenght: Int, hight: Int) {
    let weightCond = weight <= 40
    let lenghtCond = lenght <= 140
    let hightCond = hight <= 70
    switch (weightCond, lenghtCond, hightCond) {
    case (true, true, true):
        print("Коробку взял и пошел отсюда! Быстро!")
    case (false, true, true):
        print("Нужны грузчики! Увезет сам!")
    case(_, false, _):
        print("По длине не влезет! Оформляем доставку!")
    case(_, _, false):
        print("По ширине не влезет! Оформляем доставку!")
    }
}

delivery(weight: 75, lenght: 50, hight: 60)
delivery(weight: 75, lenght: 160, hight: 60)
delivery(weight: 75, lenght: 50, hight: 80)
delivery(weight: 35, lenght: 50, hight: 60)

// 8. Создать функцию, принимающую в себя массив результатов каких-либо измерений (дробные числа), вычисляющую среднее значение и возвращающую массив отклонений результатов от среднего значения.
let someMetrics = [10.3, 42.1, 31.4, 23.8, 31.7, 23.0, 1.1, 27.6]
func medianArray(array: [Double]) -> [Double] {
    var arraySum: Double = 0
    array.forEach { num in
        arraySum += num
    }
    let mid = arraySum / Double(array.count)
    var medArr: [Double] = []
    array.forEach { num in
        medArr.append(Double(String(format: "%.2f", num - mid))!) // Сначала дабл в строку, стоб отформатировать, потом обратно форс-анврапом, чтоб убрать ""! Лол)) Надо не забыть спросить как это по человечески делать))))
    }
    return medArr
}

print(medianArray(array: someMetrics))
