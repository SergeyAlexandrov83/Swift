import UIKit
import Darwin

//Swift - ЯП:
/*
Строго-типизированный
Многопоточный
Компилируемый
Высокоуровневый
Мультипарадигмарный (ООП, ПОП, ФОП, ПроцОП)
Императивный
*/

//Константы и переменные
var temperature = -5
let cityName = "Москва"
temperature = 8
//cityName = "London" - ERROR! Нельзя менять значение константы

//Правила именования:
//Правила хорошего тона:
//- используем только латиницу
//- используем lowerCamelCase для значений и UpperCamelCase для типов
//- только осмысленные именования

//Синтаксические:
//начинаем имя только с буквы или с _
//используем символы Unicode кроме спецсимволов ($%#^$*(%^)
//не используем ключевые слова языка

//let func = 0 - ERROR

//Базовые типы
//Int - Целое число
Int8.min
Int8.max
Int16.min
Int16.max
Int32.min
Int32.max
Int64.min
Int64.max
Int.min
Int.max
//UInt8
//UInt16
//UInt32
//UInt64
UInt.min
UInt.max
let bones1 = Int.random(in: 1...6)
let bones2 = Int.random(in: 1...6)
Int.zero
Int.bitWidth

let number = 35
number.isMultiple(of: 5)
number.distance(to: 25)
number.description
//Простейшие арифметические операции
let number2 = 18
number + number2
number - number2
number * number2
let divide = number / number2
let ostatok = number % number2

let n = 45

//Double - дробное число
let floatNumber: Float = 3.14151817898765096798658765845
let doubleNumber: Double = 3.14151817898765096798658765845
//let float80Number: Float80 =  3.14151817898765096798658765845
let num = 45.8

Double.random(in: 23...78)
Double.pi
let minRes = Double.minimum(34, 12)
let maxRes = Double.maximum(34, 12)

let double = 36.9
double.squareRoot()
let roundedDouble = double.rounded()

let pi = Double.pi
print(pi)
print(String(format: "%.4f", pi))

double.isEqual(to: 45)
double.isLess(than: 70)
double.isLessThanOrEqualTo(36.9)


//String - Строка
var hello = "Hello"
var name = "Vasya"

//Конкатенация - это сложение строк
let greeting1 = hello + ", " + name + "!"

//Интерполяция - включение в строку значений и выражений
let greeting2 = "\(hello), \(name)!"
let mult = "\(5) * \(3) = \(5 * 3)"

hello.count
name.count
hello.isEmpty
hello.append("!")
hello.first
hello.last
hello.uppercased()
hello.lowercased()

//Bool - Булево значение (true / false)
let isEmpty: Bool = false
let isFull = !isEmpty
isEmpty.description
let bool = Bool()
let randomBool = Bool.random()
var isOn = true
isOn.toggle()
isOn.toggle()
isOn.toggle()
isOn.toggle()
isOn.toggle()

let title = "Евгений Онегин"
let author: String = "А.С.Пушкин"

//Character
let bigA = "A"
let bigB: Character = "B"
let five: Character = "5"
bigB.isCased
bigB.isLetter
bigB.isNumber
bigB.isLowercase
bigB.isUppercase
bigB.isWhitespace
bigB.isCurrencySymbol


//Жизненный цикл экземпляра (константы / переменной)
//1. Объявление (Declaration). Присваивается имя, признак изменяемости и тип. Выделяется память
let brend: String
//2. Инициализация. Связываем имя и значение
brend = "Apple"
//3. Использование. Проведение действий над значением
print(brend)
//4. Удаление. Освобождение памяти от значения. После удаления значение недоступно


//Строгая типизация:
//1. Типы значений известны на этапе объявления (декларирования)
//2. Типы неизменны
var myNumber = 5
//myNumber = 6.89 - ERROR!
//3. Разрешены только явные преобразования типов.
var n1 = 6
var n2 = 5.8
let doubleRes = Double(n1) + n2
let intRes = n1 + Int(n2)
let result = 6 + 5.8
//4. Обязательно сгенерится ошибка на этапе компиляции (BuildTime)
//BuildTime - на этапе сборки
//RunTime - на этапе исполнения
//Index out of range
