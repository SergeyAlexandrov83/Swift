import UIKit
// Задание 1:
print("Задание 1")
var userOne: (film: String, num: Int, dish: String) = ("The Lord of the Rings", 13, "Steak")
print("Данные первого пользователя: любимый фильм - \(userOne.film), любимое число - \(userOne.num), любимое блюдо - \(userOne.dish)")
let (favoriteFilm, luckyNumber, likeDish) = userOne
print("Значение переменных: \(favoriteFilm), \(luckyNumber), \(likeDish)")
var userTwo: (film: String, num: Int, dish: String) = ("Matrix", 7, "Pasta")
print("Данные второго пользователя: любимый фильм - \(userTwo.film), любимое число - \(userTwo.num), любимое блюдо - \(userTwo.dish)")
var temp = userOne
userOne = userTwo
userTwo = temp
print("Данные первого пользователя после обмена: любимый фильм - \(userOne.film), любимое число - \(userOne.num), любимое блюдо - \(userOne.dish)")
print("Данные второго пользователя после обмена: любимый фильм - \(userTwo.film), любимое число - \(userTwo.num), любимое блюдо - \(userTwo.dish)")
var numsCortage = (userOne.num, userTwo.num, userOne.num - userTwo.num)
print("Кортеж с любимыми числами: Первое число - '\(numsCortage.0)', Второе число - '\(numsCortage.1)', Разница чисел - '\(numsCortage.2)'")


// Задание 2:
print("Задание 2")
var note = ["Ivan Ivanov": ["History": 5, "Physics": 5, "Chemistry": 5]]
print(note)


// Задание 3:
print("Задание 3")
typealias Chessman = [String: (alpha:Character, num: Int)?]
var chessmans: Chessman = [:]
chessmans.updateValue(("H", 5), forKey: "White_king")
chessmans.updateValue(("A", 4), forKey: "Black_queen")
chessmans.updateValue((nil), forKey: "Black_pawn")
var key: String = "Black_pawn"
if let info = chessmans[key]! {
    print("Фигура \(key) стоит на координатах \(info.alpha)-\(info.num)")
} else {
    print("Фигуры \(key) нет на шахматной доске")
}


// Задание 4*:
print("Задание 4*")
for figure in chessmans.keys {
    if let info = chessmans[figure]! {
        print("Фигура \(figure) стоит на координатах \(info.alpha)-\(info.num)")
    } else {
        print("Фигуры \(figure) нет на шахматной доске")
    }
}
