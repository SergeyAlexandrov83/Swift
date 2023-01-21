import UIKit
// Задача 1
// Вокруг дачи построили забор. Длина забора составляет X метров, высота - Y метров. Сын, Отец и Дочь вышли красить забор. Сын покрасил A метров забора, Дочь покрасила B метров забора. A и B - неотрицательрные, A + B < X. Отец покрасил остальной забор. Определите, какую площадь забора (в кв.м.) покрасил Отец.
let borderLenght = 100 // X
let borderHeight = 2 // Y
let sonDoneWork = 30 // A
let daughterDoneWork = 25 //B
if sonDoneWork < 0 || daughterDoneWork < 0 || sonDoneWork + daughterDoneWork > borderLenght {
    print("Введены некорректные данные!")
} else {
    let fatherDoneWork = (borderLenght - sonDoneWork - daughterDoneWork) * borderHeight
    print("Отец покрасил \(fatherDoneWork)кв.м забора")
}

// Задача 2
// Пилот формулы 1 завершил гонку за три часа, проехав 90 кругов. Его средняя скорость составила 180 км/ч. Какова длина одного круга? Ответ в километрах.
let raceTime = 3
let circlesDone = 90
let middleSpeed = 180
let totalDist = raceTime * middleSpeed
let circleLenght = totalDist / circlesDone
print("Длинна круга \(circleLenght)км")

// Задача 3
// Из пункта А и В навстречу друг другу выехали два поезда. Первый состав двигался со скоростью 140 км/ч. Они встретились в точке С через 3 часа. С какой скоростью двигался второй состав, если расстояние между пунктами было 960 км?
let firstTrainSpeed = 140
let time = 3
let distFromAtoB = 960
let firstTrainDist = firstTrainSpeed * time
let secondTrainDist = distFromAtoB - firstTrainDist
let secondTrainSpeed = secondTrainDist / time
print("Скорость второго состава \(secondTrainSpeed)км/ч")

// Задача 4
//Дано два числа a и b. Найдите гипотенузу треугольника с заданными катетами.
let numberA = 5
let numberB = 6
let hypotenuza = Double((numberA * numberA) + (numberB * numberB)).squareRoot()
print("Длинна гипотинузы ~", String(format: "%.2f", hypotenuza))

// Задача 5
// N школьников делят K яблок поровну, неделящийся остаток остается в корзинке. Сколько яблок достанется каждому школьнику? Сколько яблок останется в корзинке?
let hungryMans = 10 // N
let apples = 35 // K
let applesToPerson = apples / hungryMans
print("Каждому достанется \(applesToPerson) шт")
let applesToStay = apples % hungryMans
print("В корзине останется \(applesToStay) шт")

// Задача 6
// В автомобиле масло требуется менять либо раз в 10000 км, либо раз в полгода, в зависимости от того, что происходит чаще. Дано количество месяцев эксплуатации и пробег автомобиля. Вычислите требуемое количество раз замены масла.
let mounthToUse = 30
let totalDistance = 180000
let halfYearOilChange = mounthToUse / 6
let tenThousenKMOilChange = totalDistance / 10000
print("Масло поменять придется \(halfYearOilChange > tenThousenKMOilChange ? halfYearOilChange : tenThousenKMOilChange) раз")

// Задача 7
// Представьте службу такси, которая рассчитывает стоимость по следующему принципу: 1 км пути стоит 30 рублей, а одна минута поездки стоит 40 рублей. Стоимость поездки равна той из сумм, которая окажется больше. Дано расстояние и время поездки. Рассчитайте стоимость поездки
let oneKM = 30
let oneMin = 40
let driveDist = 18
let driveTime = 26
print("Стоимость поездки равна \(driveDist * oneKM > driveTime * oneMin ? driveDist * oneKM : driveTime * oneMin)! Поставьте 5 звезд!")

// Задача 8
// Билет в аквапарк стоит 700 рублей за 2 часа и 1100 за 4 часа. Опоздание оплачивается отдельно из расчёта 100 рублей за каждые 10 минут. Дано количество минут, которое посетитель провёл в аквапарке (от 120 до 240). Найдите наименьшую стоимость, которую он заплатит за посещение аквапарка.
let twoHoursTicket = 700
let fourHoursTicket = 1100
let tenMinutesPrice = 100
let aquaTime = 160
if aquaTime < 120 || aquaTime > 240 {
    print("Введены некорректные данные!")
} else {
    let bill = aquaTime < 130 ? twoHoursTicket : aquaTime > 160 ? fourHoursTicket : (aquaTime - 120) / 10 * tenMinutesPrice + twoHoursTicket
    print("На кассу \(bill)")
}

// Задача 9
// Пирожок в столовой стоит a рублей и b копеек. Определите, сколько рублей и копеек нужно заплатить за n пирожков.
let pirojokCount = 12 // n
let rubPrice = 15 // a
let kopPrice = 30 // b
let totalKopBill = kopPrice * pirojokCount % 100
let totalRubBill = rubPrice * pirojokCount + kopPrice * pirojokCount / 100
print("Школа стала богаче на \(totalRubBill) руб \(totalKopBill) коп")

// Задача 10
// Даны значения двух моментов времени, принадлежащих одним и тем же суткам: часы, минуты и секунды для каждого из моментов времени. Известно, что второй момент времени наступил не раньше первого. Определите, сколько часов, минут и секунд прошло между двумя моментами времени.
let firstHours = 7
let firstMins = 15
let firstSec = 34
let secondHours = 23
let secondMins = 46
let secondSec = 59
print("Разница составляет \(secondHours - firstHours)ч \(secondMins - firstMins)м \(secondSec - firstSec)с")
