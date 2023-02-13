import UIKit

// Замыкания (Closures) - блоки кода, которые могут испольховаться в программе многократно
// Функции - частный случай замыканий

// ЗАМЫКАНИЯ:
// Глобальная функция
// Вложенная функции - используют внешние переменные и константы
// Замыкающие выражения (closures) - не имеют имени, использует внешние значения

//Функция
func rect(a: Double, b: Double) -> Double {
    return a * b
}

//Замыкание
let rectangle = { (a: Double, b: Double) -> Double in
    return a * b
}

let rFunc = rect(a: 3, b: 4)
let rClos = rectangle(3, 4)


//{ (parameter: Type .....) -> ReturnType in
//    code
//    return value
//}

func sayHello() {
    print("Hi")
}





//Замыкания сохраняем в переменные или константы!!
let hello = {
    print("Hi")
}

hello()




//Последующее замыкание
func getUser(by id: String, completion: (String) -> ()) {           //Вызываем в функции замыкание, которое будет работать с Федей
    completion("Fedya")
}

getUser(by: "id") { userName in                     // Передали в комплишн федю, а дальше при вызове функции мы раскрыли комплишн
    print(userName)
}


func stringSolve(_ str: String,                 //Строка
                 closure: (String) -> Int)      //Замыкание
-> String {                                     //Строку возвращает
    let int = closure(str)
    return "Результат: \(int)"
}

let charsCount: (_ str: String) -> Int = { (str: String) -> Int in str.count
    return str.count
}

let whitespacesCount = { (str: String) -> Int in
    let spaces = str.filter { $0 == " " }           // { $0.isWhitespace}
    return spaces.count
}

let lettersCount = { (str: String) -> Int in
    let letters = str.filter { $0.isLetter }
    return letters.count
}

let onegin = "bla bla"
stringSolve(onegin, closure: charsCount)
stringSolve(onegin, closure: whitespacesCount)
stringSolve(onegin, closure: lettersCount)



stringSolve(onegin) { str in
    return str.filter { $0 == "Я" }.count
}




let personName: String = {
    let name = "Vasya"
    let lastName = "Petrov"
    return "\(name) \(lastName)"
}()

personName




// Краткая форма записи аргументов

func circle(radius: Double,
           closure: (Double) -> Double) {
    print(closure(radius))
}

circle(radius: 4) { rad in
    return Double.pi * rad * rad
}

circle(radius: 4) { rad in          // Краткая форма
    Double.pi * rad * rad
}






//$0
circle(radius: 4) { Double.pi * $0 * $0 }


func stol(width: Double,
          lenght: Double,
          weight: Double,
          check: (Double, Double, Double) -> String) {
    print(check(width, lenght, weight))
}

stol(width: 70, lenght: 150, weight: 30) {
    if [$0, $1].max()! <= 140 && [$0, $1].min()! <= 70 {
        if $2 < 30 {
            return "SAm dovezy"
        } else {
            return "Nyjni gryzchiki"
        }
    } else {
        return "Nyjna dostavka"
    }
}


stol(width: 70, lenght: 150, weight: 30) { width, lenght, weight in
    if [width, lenght].max()! <= 140 && [width, lenght].min()! <= 70 {
        if weight < 30 {
            return "SAm dovezy"
        } else {
            return "Nyjni gryzchiki"
        }
    } else {
        return "Nyjna dostavka"
    }
}
