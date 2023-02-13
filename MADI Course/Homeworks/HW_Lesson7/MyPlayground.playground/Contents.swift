import UIKit

// 1. Создать функцию, которая принимает в себя имя пользователя и замыкание, которое распечатывает в консоль строку - приветствие пользователя. Создать три замыкания: Первое - распечатывает строку приветствия для нового пользователя, второе - для гостя, третье - для старого пользователя. Проверить работу всего кода вызовом функции.
func user(name: String, closure: (String) -> (String)) {
    print(closure(name))
}

let newUser = { (name: String) -> (String) in
    return "Welcome, \(name)!"
}
let guestUser = { (name: String) -> (String) in
    return "Hello, guest! Nice to meet you, \(name)."
}
let oldUser = { (name: String) -> (String) in
    return "Hi, man! Let's chill, \(name)!"
}

user(name: "Fedya", closure: newUser)
user(name: "Fedya", closure: guestUser)
user(name: "Fedya", closure: oldUser)

// 2. Создать функцию, которая принимает в себя длину и ширину прямоугольника и замыкание-действие типа (Double, Double) -> Double и возвращает дробное число. Создать два замыкания-действия, которые вычисляют площадь и периметр. вызвать функцию и проверить работу кода

func rect(lenght: Double, hight: Double, closure: (Double, Double) -> (Double)) -> Double {
    closure(lenght, hight)
}

let ploshad = { (lenght: Double, hight: Double) -> (Double) in
    return lenght * hight
}
let perimetr = { (lenght: Double, hight: Double) -> (Double) in
    return (lenght + hight) * 2
}

rect(lenght: 3, hight: 4, closure: ploshad)
rect(lenght: 3, hight: 4, closure: perimetr)


// 3. Реализовать три замыкания, которые принимают два числа и возвращают Bool. Первое вычисляет, может ли первое число быть нацело поделено на второе. Второе вычисляет, имеют ли они хотя бы один общий делитель, отличный от 1 и самих этих чисел. Третье вычисляет, чётная ли сумма этих двух чисел. Реализуйте функцию, которая принимает два числа и такого типа замыкание, внутри себя реализует его и возвращает результат в виде будимого значения
func isProverka(a: Int, b: Int, closure: (Int, Int) -> Bool) -> Bool {
    closure(a, b)
}
let divide = { (a: Int, b: Int) -> Bool in
    return (a % b) == 0
}
let delitel = { (a: Int, b: Int) -> Bool in
    var i = 2
    var flag = false
    while i <= b / 2 {
        if b % i == 0 {
            flag = true
            break
        }
    }
    return flag
}
let chetnayaSum = { (a: Int, b: Int) -> Bool in
    return (a + b) % 2 == 0
}

isProverka(a: 12, b: 6, closure: chetnayaSum)
isProverka(a: 12, b: 6, closure: delitel)
isProverka(a: 12, b: 6, closure: divide)

// 4. Составить замыкание для поиска четырехзначных чисел, которые при делении на 133 дают в остатке 125, а при делении на 134 дают в остатке 111
let megaSearch: () = {
    for i in 1000...9999 {
        if i % 133 == 125 && i % 134 == 111 {
            print(i)
        }
    }
}()

megaSearch

// 5. Даны два слова. Создать замыкание, которая определит, можно ли из букв первого из них получить второе. Каждая буква второго слова должна входить в первое слово столько же раз или меньше, чем и во втором.
let bukvy = { (wrdOne: String, wrdTwo: String) -> Bool in
    var first = wrdOne
    var second = wrdTwo
    var flagLetter = true
    for char in second {
        if !first.contains(char) {
            flagLetter = false
            break
        } else {
            first.remove(at: first.firstIndex(of: char)!)
        }
    }
    return flagLetter
}

bukvy("aaabbbccc", "cccaaabbb")
bukvy("aaabbbcc", "bbbaaac")
bukvy("aaabbbc", "bbbaaacc")
bukvy("aaabbbcc", "bbbaaacd")

// 6. Создать функцию, которая принимает в себя строку и замыкание типа (String) -> (Bool), реализующую внутри себя принятое замыкание и печатающую результат в консоль. Создать замыкания типа (String) -> (Bool):
func checkString(str: String, closure: (String) -> Bool) {
    print(closure(str))
}
let string = "ABC DEF GH"
// ⁃ Проверяет, чётное ли количество символов в строке, за исключением пробелов
let isOdd = { (stroka: String) -> Bool in
    return stroka.filter({$0 != " "}).count % 2 == 0
}
// ⁃ Проверяет, является ли строка палиндромом (читается в в прямом и обратном порядке одинаково)
let isPoly = { (stroka: String) -> Bool in
    var poly = String(stroka.reversed())
    return stroka == poly
}
// ⁃ Проверяет, есть ли в строке символы кроме букв и пробелов
let isOnlySpaces = { (stroka: String) -> Bool in
    var spaceFlag = true
    for char in stroka {
        if !char.isWhitespace {
            spaceFlag = false
            break
        }
    }
    return spaceFlag
}
// Вызвать функцию, протестировав её с разными строками и замыканиями
checkString(str: string, closure: isOdd)
checkString(str: string, closure: isPoly)
checkString(str: string, closure: isOnlySpaces)

// 7. Реализовать функцию, принимающую в себя дробное число Double и возвращающую дробное число. Создать замыкания типа (Double) -> Double:
// Если в функцию передано отрицательное число, поменять знак на противоположный (взять число по модулю)
func abyrvalg(gran: Double, closure: (Double) -> Double) -> Double {
    var granPositive = gran
    if gran < 0 {
        granPositive = gran * (-1)
    }
    return closure(granPositive)
}
// ⁃ Вычисляет и возвращает площадь граней куба со стороной, переданной в качестве параметра
let ploshadGraney = { (gran: Double) -> Double in
    return gran * gran * 6
}
// ⁃ Вычисляет периметр квадрата со стороной, переданной в качестве параметра
let perimetrKvadrata = { (gran: Double) -> Double in
    return gran * 4
}
// ⁃ Вычисляет объём шара с радиусом, переданным в качестве параметра
let obyemShara = { (radius: Double) -> Double in
    return 3 / 4 * Double.pi * radius * radius * radius
}
// ⁃ Вычисляет площадь сферы  с диаметром, переданным в качестве параметра
let ploshadLenina = { (diam: Double) -> Double in
    return 4 * Double.pi * diam * diam
}
// Вызвать функцию, протестировав её с разными числами и замыканиями
abyrvalg(gran: 10, closure: ploshadGraney)
abyrvalg(gran: -10, closure: ploshadGraney)
abyrvalg(gran: 10, closure: perimetrKvadrata)
abyrvalg(gran: 10, closure: obyemShara)
abyrvalg(gran: 10, closure: ploshadLenina)






