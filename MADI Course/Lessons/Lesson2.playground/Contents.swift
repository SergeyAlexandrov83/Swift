import Cocoa

// Опциональные тапы данных
// Типа данных значение которого может отсутствовать
// nil - отсутствие значения

var wheelCount: Int? = nil
wheelCount = 8
print("Количество колес: \(wheelCount)")

var addWheelCount = 4

// wheelCount + addWheelCount ERROR!
//Unwrapping - прямое извлечение
wheelCount = nil
// print("Количество колес: \(wheelCount!)") FATAL ERROR!

// Опереторы и операции

// Оператор - это символ или группа символов который указывает компилятору на необходимость выполнения какого-то действия

// Операция - действие

// Операнд - значение, которое учавствует в операции

// Унарные
// ? - опционал
// |operand|! - прямое извлечение из-под опционала
// !|operand| - логическое НЕ (отрицание)
var isEmpty = false
var isFull = !isEmpty
// -|operand| - унарный минус
// +|operand| - унарный плюс

// Бинарные
// Оператор присваивания =
var number = 5
var number2 = 10
number2 = number // = это присвоение, а не равно
// Арифметические + - * / %
// Операторы составного присваивания += -= *= /= %=
var num = 15
var num2 = 5
//num = num / num2
num /= num2
num *= num2
num -= 5
num += 10
num %= 7
print(num)
//Операторы сравнения результат Bool
// > < == != >= <=
var moreThen = 5 > 8
var lessThan = 5 < 8
var lessThanOrEqual = 5 <= 8
var moreThanOrEqual = 5 >= 8
var equal = 5 == 8
var notEqual = 5 != 8

num
var double = 7.9
Double(num) > double
false == true
false != true

let name1 = "Vasya"
let name2 = "Вася"

name1 < name2
name1 > name2
// Буква Ё стоит перед А

// Логические операторы
// ! - НЕ
// || - ИЛИ
// && - И
let age = 12
let height = 110

let attractionCondition = age >= 10 && height >= 120

let isDeleted = false
let isComplited = true

let iaArchive = isDeleted || isComplited

// Опеарторы диапзона
// ... и ..<
// ... - замкнутый диапазон;
// ..< - полузамкнутый диапазон;

let range = 0...14 // - все числа от 0 до 14
let range2 = 0..<14 // - все числа от 0 до 13

// ~= - оператор принадлежности к диапазону
range ~= 8
range ~= 30
range2 ~= 14
range ~= 14
range ~= 0
range2 ~= 0

// Опциональное связывание - ??
let defaultName = "Гость"
//let name: String? = nil
let name: String? = "Аркадий"

let greeting = "Привет, \(name ?? defaultName)!"
print(greeting)

// Тернарный

// _ ? _ : _
// (Условие) ? (Действие (значение) если условие выполняется - true) : (Действие (значение) если условие не выполняется - false)

let textHeight = 70
let hasHeader = true
let subHeader = false

// Header height = 50

let cellHeight = textHeight + 20 + (hasHeader ? 50 : 0)
let cellHeight2 = textHeight + 20 + (hasHeader ? (subHeader ? 50 : 30) : 0)


let newAge = 30
newAge >= 18 ? print("Уже можно!") : ()

// За день машина проезжает n километров. Сколько целых дней нужно чтоб проехать маршрут m километров?

let kilometers = 4000
let kmPerDay = 700

let ostatok = kilometers % kmPerDay

let days = ostatok > 0 ? (kilometers / kmPerDay) + 1 : kilometers / kmPerDay

// Дано двузначное число Найти количество десятков в нем

let twoCharNum = 48
let tens = twoCharNum / 10

// Дано число n. С начала суток прошло n минут. Определите, сколько часов и минут будут показывать электронные часы в этот момент. Программа должна вывести два числа: количество часов (от 0 до 23) и количество минут (от 0 до 59). Минуты по необходимости дополняются нулями. Учтите, что число n может быть больше, чем количество минут в сутках.

let minutes = 34338
let usefullMinutes = minutes % (24 * 60)
let hours = usefullMinutes / 60
let mins = usefullMinutes % 60
let needZero: Bool = mins <= 10
let strMins = needZero ? "0\(mins)" : "\(mins)"


print("\(hours):\(strMins)")

// Длина Московской кольцевой автомобильной дороги — 109 километров. Байкер Вася стартует с нулевого километра МКАД и едет со скоростью v километров в час. На какой отметке он остановится через t часов?

let mkad = 109
let speed = 120
let time = 9
let direction = true

let dist = speed * time
let ost = dist % mkad

let note = direction ? ost : mkad - ost
