import UIKit

var greeting = "Hello, playground"

//Множества - неупорядоченная коллекция уникальных однотипных значений
var countries: Set = ["Россия", "Беларусь", "Бразилия", "Узбекистан", "Грузия"]
print(countries)

countries.forEach { country in
    print(country)
}

countries.insert("Греция")
print(countries)
let addGermanyRes = countries.insert("Германия")
addGermanyRes.inserted
addGermanyRes.memberAfterInsert
let count = 45
//countries.insert(count)
countries.insert("Бразилия")
print(countries)
countries.remove("Германия")
print(countries)

let mappedCountries = countries.map { country in
    "Государство \(country)"
}

let sortedCountries = countries.sorted { first, last in
    first > last
}

print(sortedCountries)

let filteredCountries = countries.filter { country in
    country.first == "Г"
}

countries.count
countries.isEmpty
//countries.removeAll()


//Методы множеств
let sng: Set = ["Россия", "Беларусь", "Казахстан", "Армения", "Таджикистан"]
let briks: Set = ["Бразилия", "Индия", "Китай", "Россия", "ЮАР"]

//1. Объединение
let unitedCountries = sng.union(briks)
print(unitedCountries)

//2. Вычитание
let subtractedSng = sng.subtracting(briks)
print(subtractedSng)

//3. Симметрическая разность
let uniqueCountries = sng.symmetricDifference(briks)
print(uniqueCountries)

//4. Пересечение
let intersectedCountries = sng.intersection(briks)
print(intersectedCountries)

//Insert в массиве:
//1. Создаётся новый массив с пустым элементом посередине
//2. Добавляется значение
//3. Пересохраняется массив в старый массив
//4. Новый массив удаляется


var subscribers = ["Вася", "Петя", "Федя"]
var observers: Set = ["Вася", "Петя", "Федя"]

var name = "Петя"
var index: Int? = nil

for ss in subscribers.enumerated() {
    if ss.element == name {
        index = ss.offset
    }
}

subscribers.remove(at: index!)

observers.remove(name)





//Словари (Dictionary) - коллекция неуникальных однотипных значений, условно упорядоченная по уникальному однотипному ключу. Коллекция, которая хранит пары ключ-значение

var forest: [String: Int] = [
    "Дуб": 15,
    "Берёза": 30,
    "Ель": 22,
    "Сосна": 12,
    "Пихта": 6,
    "Клён": 12
]

print(forest)
let treesCount = forest["Баобаб"]
forest["Кедр"] = 8
print(forest)
forest["Пихта"] = 10
print(forest)
forest["Дуб"]! += 5
print(forest)
forest.removeValue(forKey: "Кедр")
print(forest)

let trees = forest.map { (tree, count) in
    tree
}

let counts = forest.map { element in
    element.value
}

let trees2 = Array(forest.keys)
let counts2 = Array(forest.values)

let treesDescription = forest.map { element in
    "\(element.key) - \(element.value) шт."
}

print(treesDescription)

let shuffledTrees = forest.shuffled()
shuffledTrees[0].key

let sortedTrees = forest.sorted { firstTree, lastTree in
    firstTree.value > lastTree.value
}

print(sortedTrees)

let isDict: [Bool? : String] = [true: "Да",
                                false: "Нет",
                                nil: "Да нет"]

struct User: Hashable {
    let name: String
    var age: Int
}

let users: [User: Int] = [:]


//В словаре типа [String:(pwd: String, name: String)] логины хранятся в качестве ключей, а кортеж из паролей и имен пользователей - в качестве значений. При авторизации пользователя данные формируются в виде кортежа (login: String, pass: String) и сравниваются с соответствующими значениями в словаре.



var db: [String: (pwd: String, name: String)] = [
    "vasya": ("1234", "Василий"),
    "arkasha": ("9876", "Аркадий")
]

//Задание1: В консоль в случае корректной авторизации должно вывестись приветствие вида "Привет, Вася!".
let authForm = (login: "vasya", pass: "45678")
let authCondition = db[authForm.login]?.pwd == authForm.pass
authCondition ? print("Привет, \(db[authForm.login]!.name)!") : print("Неверный логин или пароль")

//Задание2: Напишите логику, регистрирующую нового пользователя
let regForm = (login: "vasya", pass: "45678", name: "Ксюша")
if !(db.keys.contains(regForm.login)) {
    db[regForm.login] = (regForm.pass, regForm.name)
} else {
    print("Такой пользователь уже есть!")
}

let authForm2 = (login: "kseniya", pass: "45678")
let authCondition2 = db[authForm2.login]?.pwd == authForm2.pass
authCondition2 ? print("Привет, \(db[authForm2.login]!.name)!") : print("Неверный логин или пароль")


//Задание 3: Написать логику изменения пароля. Старый пароль, новый пароль 2 раза. Новый пароль должен быть не короче 6 символов, и не совпадать со старым



// УПРАВЛЕНИЕ ПОТОКОМ
//Циклы
//Цикл while (цикл с условием)

//while (выполняется условие) {
//    //надо что-то делать
//}

var age = 5

while age < 18 {
    print("Нельзя тебе пиво пить ещё!")
    age += 1
}

print("Наконец-то дождался!")


age = 15

repeat {
    
    age += 1
    if age == 20 { continue }
    print(age)
    
} while age < 22


print("Конец")








