import UIKit

//1 - Доделать задачу из аудитории
//В словаре типа [String:(pwd: String, name: String)] логины хранятся в качестве ключей, а кортеж из паролей и имен пользователей - в качестве значений. При авторизации пользователя данные формируются в виде кортежа (login: String, pass: String) и сравниваются с соответствующими значениями в словаре.

var db: [String: (pwd: String, name: String)] = [
    "vasya": ("1234", "Василий"),
    "arkasha": ("9876", "Аркадий")
]
////В консоль в случае корректной авторизации должно вывестись приветствие вида "Привет, Вася!".
//let authForm = (login: "vasya", pass: "45678")
//let authCondition = db[authForm.login]?.pwd == authForm.pass
//authCondition ? print("Привет, \(db[authForm.login]!.name)!") : print("Неверный логин или пароль")
////Напишите логику, регистрирующую нового пользователя
//let regForm = (login: "vasya", pass: "45678", name: "Ксюша")
//if !(db.keys.contains(regForm.login)) {
//    db[regForm.login] = (regForm.pass, regForm.name)
//} else {
//    print("Такой пользователь уже есть!")
//}
//
//let authForm2 = (login: "kseniya", pass: "45678")
//let authCondition2 = db[authForm2.login]?.pwd == authForm2.pass
//authCondition2 ? print("Привет, \(db[authForm2.login]!.name)!") : print("Неверный логин или пароль")
//Написать логику изменения пароля. Старый пароль, новый пароль 2 раза. Новый пароль должен быть не короче 6 символов, и не совпадать со старым
let changePassForm = (login: "vasya", oldPass: "1234", newPassOne: "4321", newPassTwo: "4321")
let authCond = db[changePassForm.login]?.pwd == changePassForm.oldPass
if authCond {
    if changePassForm.oldPass != changePassForm.newPassOne && changePassForm.newPassOne == changePassForm.newPassTwo {
        db[changePassForm.login]?.pwd = changePassForm.newPassOne
        print("Пароль успешно изменен!")
    } else {
        print("Что-то пошло не так! Проверьте правильность вводимых данных!")
    }
}

//2 Список продуктов, которые нужны для приготовления борща, представлен множеством borshProducts. Список имеющихся продуктов представлен множеством haveProducts. Требуется вывести список продуктов, которые нужно купить для приготовления борща.
var borshProducts: Set = [
    "Мясо",
    "Картофель",
    "Капуста",
    "Свекла",
    "Морковь",
    "Лук"
]
var haveProducts: Set = [
    "Мясо",
    "Капуста",
    "Лук"
]
var shopingList = borshProducts.subtracting(haveProducts)
print(shopingList)

//3. Ваcя живёт в квартире в центре Екатеринбурга. Дом, в котором находится его квартира, обслуживает несколько интернет-провайдеров. Ваня планирует переселиться в другой дом, который обслуживают другие провайдеры. Некоторые из провайдеров обслуживают оба дома.  Задача - проверить, к каким из провайдеров Ваня должен подключиться, чтобы после переезда не пришлось менять провайдера?
var firstProviders: Set = [
    "MTS",
    "Beeline",
    "Rostelecom",
    "Mannet",
    "IDK"
]
var secondProviders: Set = [
    "MTS",
    "Rostelecom",
    "NoOneKnowThisProvider",
    "ConnectionLost",
    "404"
]
var needToChoose = firstProviders.intersection(secondProviders)
print(needToChoose)

//4. Алина посетила два разных курса по веб-разработке. В каждом из курсов есть свой перечень тем для изучения. Некоторые темы могут повторяться. Задача - вывести полный перечень, который Алина освоила на обоих курсах.
var firstCourse: Set = [
    "HTML",
    "CSS",
    "JS",
    "GIT"
]
var secondCourse: Set = [
    "HTML",
    "CSS",
    "Python",
    "Figma"
]
var nowSheKnow = firstCourse.union(secondCourse)
print(nowSheKnow)

//5. Создать словарь Животных типа [String: Int], где ключ - Название животного, а значение - его вес в килограммах. Проверить, способен ли человек поднять одно из животных, имеющихся в словаре (порог поднятия считать равным 80 кг). Результат распечатать в консоль в виде: «Курица весит 3 кг. Я могу её поднять» или «Слон весит 1500 кг. Он слишком тяжёлый для меня»
var animals: [String: Int] = [
    "Слон": 1600,
    "Тигр": 230,
    "Обнзьяна": 45,
    "Удав": 12,
    "Опоссум": 2
]
animals.forEach { (key: String, value: Int) in
    if value <= 80 {
        print("\(key) весит \(value)кг. Я могу это поднять")
    } else {
        print("\(key) весит \(value)кг. Это слишком тяжело")
    }
}

//6. В кошельке (словарь) лежат банковские карты. Каждая из них имеет название (ключ), пин-код и сумму остатка. Владелец берёт одну из карт и производит оплату перечня товаров определённой стоимостью. Перечень товаров хранится в словаре типа [String:Int], где ключ - название товара, а значение - его стоимость. Оплата пройдёт успешно, если владелец карты вводит верный пин-код от выбранной им карты, а также если сумма остатка на карте не менее, чем сумма покупки. Выведите на консоль сообщение об успешной покупке или о невозможности произвести транзакцию.
var cards: [String: (pin: Int, cashSum: Int)] = [
    "Tinkoff": (1234, 150000),
    "Sber": (4321, 1000)
]

var shopingListToPay: [String: Int] = [
    "Steam Deck 512Gb": 68000,
    "microSD 512Gb": 6800
]

var sumToPay = 0
shopingListToPay.forEach { (key: String, value: Int) in
    sumToPay += value
}
print("К оплате: \(sumToPay)")
var payMethod = (card: "Tinkoff", pin: 1234)
var payCondition = cards[payMethod.card]?.pin == payMethod.pin
if payCondition {
    if cards[payMethod.card]!.cashSum >= sumToPay {
        print("Покупка успешно совершена!")
        cards[payMethod.card]!.cashSum -= sumToPay
        print("Осталось на балансе: \(cards[payMethod.card]!.cashSum)")
    } else {
        print("Недостаточно средств!")
    }
} else {
    print("Данные не верны!")
}

//7. В первый день спортсмен пробежал x километров, а затем он каждый день увеличивал пробег на 10% от предыдущего значения. По данному числу y определите номер дня, на который пробег спортсмена составит не менее y километров.
let y: Double = 100
var x: Double = 20
var totalDist = x
var count = 1
if x > y {
    print("On \(count) day!")
} else {
    while totalDist < y {
        x = x + x / 10
        totalDist += x
        count += 1
    }
    print("On \(count) day and he run", String(format: "%.2f", totalDist), "km")
}

//8. Вклад в банке составляет x рублей. Ежегодно он увеличивается на p процентов, после чего дробная часть копеек отбрасывается. Каждый год сумма вклада становится больше. Определите, через сколько лет вклад составит не менее y рублей.
var cashX = 800000
let rent = 14
var target = 10000000
var years = 0
while cashX < target {
    cashX += cashX / 100 * rent
    cashX = Int(cashX)
    years += 1
}
print("Накопится \(cashX) через \(years) лет")


