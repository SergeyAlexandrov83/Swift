import Cocoa

// Замыкания

//1. Глобальные функции
//2. Вложенные функции
//3. Замыкающие выражения

//{ (параметры) -> ReturnType In
//    //Тело замыкания
//}

let greeting = {
    print("Hello, world!")
}

greeting()

let message = { (user: String?, text: String) in
    
    if let user = user {
        print("\(user), \(text)")
    } else {
        print(text)
    }
}

message("Vasya", "Hello! How are you?")
message(nil, "Hello everyone!")

let sum = { (x: Int, y: Int) -> Int in
    let sum = x + y
    
    return sum
}

sum(5, 67)

let diff = { (x: Int, y: Int) -> Int in
    let diff = x - y
    
    return diff
}

func operation(_ a: Int, _ b: Int, _ actions: (Int, Int) -> Int) {
    let result = actions(a, b)
    print(result)
}
operation(15, 43) { a, b in
    a * b
}

operation(60, 20, diff)
operation(60, 20, sum)

operation(60, 30) { x, y in
    return x / y
}

operation(34, 12) { x, y in
    x * x - y * y * y
}

// Создать функцию, которая принимает в себя прямоугольник (его ширину и высоту) и замыкание-действие типа (Double, Double) -> Double и возвращает дробное число. Создать два замыкания-действия, которые вычисляют площадь и периметр. вызвать функцию и проверить работу кода

let area = { (lenght: Double, width: Double) -> Double in
    return lenght * width
}

let perimeter = { (lenght: Double, width: Double) -> Double in
    return ((lenght * 2) + (width * 2))
}

func rectangle(a:Double, b:Double, action: (Double, Double) -> Double) -> Double {
    let result = action(a, b)
    return result
}

rectangle(a: 6, b: 4, action: perimeter)
rectangle(a: 6, b: 4, action: area)

//Ярлык аргумента и имя параметра

func summa(first number1: Int, second number2: Int) -> Int {
    let result = number1 + number2
    return result
}

summa(first: 45, second: 12)
//-------------------------------------------------------------
func summa2(_ number1: Int, _ number2: Int) -> Int {
    let result = number1 + number2
    return result
}

summa2(45, 12)






