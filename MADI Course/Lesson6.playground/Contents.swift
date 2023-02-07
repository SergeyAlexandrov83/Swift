import UIKit

//Функция - обособленный исполняемый блок кода, который может использоваться многократно в разных частях программы

//func funcName(param1: Type, param2: Type, ...) -> ReturnType {
//    //действия с параметрами для получения возвращаемого значения
//      return returnValue
//}

//1. Функция ничего не принимает и ничего не возвращает

// () -> ()        () -> Void
func sayHello() {    //Void - пустота
    print("Привет!")
}

sayHello()
sayHello()
sayHello()
sayHello()
sayHello()

//2. Функция имеет параметры и не имеет возвращаемого значения

//(String) -> ()
func tellHello(name: String) {
    print("Привет, \(name)!")
}

tellHello(name: "Вася")
tellHello(name: "Ирина")
tellHello(name: "Анатолий")
tellHello(name: "Аркаша")
tellHello(name: "Алина")

//Параметры функции
//Параметры по умолчанию

//(String, Int, String) -> ()
func aboutCar(title: String, number: Int, color: String = "Жёлтый") {
    print("За вами приехала машина: \(color) \(title). Гос. номер: \(number)")
}

aboutCar(title: "Hyundai Solaris", number: 456)
aboutCar(title: "Kia Optima", number: 287, color: "Белый")

//Множественный параметр
func sum(numbers: Int...) {
    let s = numbers.reduce(0, +)
    print(s)
}

sum(numbers: 3,56,43,21,67)

//Параметр-массив
func mult(numbers: [Int]) {
    let s = numbers.reduce(1, *)
    print(s)
}

mult(numbers: [4,3,2,1])

let numbers = [4,6,8,9,5,4,3]
mult(numbers: numbers)

//reduce - метод коллекции, который призван представить коллекцию в виде одного значения
let summa = numbers.reduce(0) { partialResult, number in
    partialResult + number
}

print(summa)


//Ярлык аргумента и имя параметра
func factor(of number: Int) {
    let f = (1...number).reduce(1, *)
    print(f)
}
factor(of: 5)

//4! = 1 * 2 * 3 * 4
//(didSelectRow row: Int)

func aboutUser(name: String, from hometown: String) {
    print("Привет, \(name) из \(hometown)!")
}

aboutUser(name: "Геральд", from: "Ривии")

//Пропуск ярлыка аргумента
func aboutPerson(_ name: String, _ age: Int) {
    print("\(name): \(age) лет")
}

aboutPerson("Аркадий", 57)

//Выходной (сквозной) параметр
var password: String = ""
var name: String = ""

func setValue(value: String, whereTo: inout String) {
    whereTo = value
}

setValue(value: "SanFranCisco", whereTo: &password)
password
setValue(value: "Вася", whereTo: &name)
name


//Возвращаемое значение - значение, которое функция выдаёт в результате своей работы



//3. Функция ничего не принимает, но возвращает значение

//() -> Double
func pi() -> Double {
    return 3.14
}

let radius = 4.0
let circle = pi() * radius
let numberPi = pi()

//4. Общий - функция и принимает и возвращает значения

//(Double, Double) -> Double
func rect(lenght: Double, width: Double) -> Double {
    let s = lenght * width
    return s
}

let square = rect(lenght: 23, width: 52)

//Неявный возврат - в функции, в которой 1 строка можно не писать return
func rectShort(lenght: Double, width: Double) -> Double { lenght * width }

rectShort(lenght: 12, width: 25)

//Возврат кортежа
func round(radius: Double) -> (square: Double, circleLenght: Double) {
    let square = pi() * radius * radius
    let l = pi() * radius * 2
    return (square, l)
}

let roundResult = round(radius: 6)
roundResult.circleLenght
roundResult.square


//Возврат массива
func getWords(str: String) -> [String] {
    let words = str.components(separatedBy: " ")
    return words
}

let words = getWords(str: "Уж небо осенью дышало")


//Функциональный тип (тип функции) - состоит из типов принимаемых и типов возвращаемых значений

let getWordsLet = getWords
getWordsLet("Мой дядя самых честных правил")

let car: (color: String,
          title: String,
          number: Int,
          price: Int,
          wheelDiam: Int) = ("Зелёный",
                             "BMW",
                             458,
                             5_670_000,
                             17)

typealias Car = (color: String,
                 title: String,
                 number: Int,
                 price: Int,
                 wheelDiam: Int)

func taxiDesc(car: Car) -> String { "\(car.color) \(car.title) гос. номер \(car.number)"
}

func saleDesc(car: Car) -> String { "\(car.color) \(car.title) гос. номер \(car.number). радиус колёс - \(car.wheelDiam). Стоит всего \(car.price)₽"
}

func aboutCar(car: Car,
              description: (Car) -> (String) = taxiDesc(car:)) {
    print(description(car))
}

aboutCar(car: car, description: saleDesc)
aboutCar(car: car)
aboutCar(car: car)



//2. Спортсмен-лыжник начал тренировки, пробежав в первый день некоторое количество километров(beginKm: Double). Каждый следующий день (days: Int) он увеличивал длину пробега на некоторое количество процентов (percent: Double) от пробега предыдущего дня. Написать функцию, которая считает и возвращает суммарное пройденное расстояние (distance: Double) в зависимости от принятых в функцию данных: beginKm: Double, percent: Double, days: Int.

func distance(beginKm: Double, days: Int, percent: Double) -> Double {
    var dist = beginKm
    var currentDist = beginKm
    
    if days > 0 {
        if days != 1 {
            for _ in 2...days {
                currentDist *= (1 + percent / 100)
                dist += currentDist
            }
            return dist
        } else {
            return dist
        }
    } else {
        return 0
    }
}

let dist = distance(beginKm: 8, days: 3, percent: 5)

//guard - "Защитник"
//1 нет блока для true
//2 Есть блок else. else обязательный. Из else обязательно нужно выполнить ранний возврат

func sumPath(beginKm: Double, days: Int, percent: Double) -> Double {
    var dist = beginKm
    var currentDist = beginKm
    
    guard days > 0 else { return 0 }
    guard days != 1 else { return dist }

    for _ in 2...days {
        currentDist *= (1 + percent / 100)
        dist += currentDist
    }
    return dist
}

//Cпособы извлечения из-под опционала
// ! - прямое извлечение


// ?? - опциональное связывание


//if let(var)

let userName: String? = "Васёк"
if let userName = userName {
    print(userName)
}

if let userName {
    print(userName)
}



//guard let(var)

func getAge(year: Int?) -> String {
    guard let year else { return "Возраст не указан" }
    return "Возраст \(2023 - year) лет"
}

getAge(year: 1978)
getAge(year: nil)












userName ?? userName














