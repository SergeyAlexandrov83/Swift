import Cocoa

// Создание ошибки

enum AuthError: Error {
    case wrongPassword
    case dataNotExist
    case serverLost
}

// Проброс ошибки
func auth(login: String, pwd: String) throws -> String {
    let trueLogin = "Vasya"
    let truePass = "123"
    
    guard login == trueLogin else {
        throw AuthError.dataNotExist
    }
    
    guard pwd == truePass else {
        throw AuthError.wrongPassword
    }
    
    print("Привет, админ!")
    
    return "Ok"
}

// do-catch

//do {
//    try auth(login: "Fedya", pwd: "4567")
//} catch AuthError.dataNotExist {
//    print("Данные не существуют!")
//} catch AuthError.wrongPassword {
//    print("Не верный пароль!")
//} catch {
//    print("Какая-то еще ошибка!")
//}
//
//do {
//    try auth(login: "Vasya", pwd: "4567")
//} catch AuthError.dataNotExist {
//    print("Данные не существуют!")
//} catch AuthError.wrongPassword {
//    print("Не верный пароль!")
//} catch {
//    print("Какая-то еще ошибка!")
//}
var string = ""
do {
    string = try auth(login: "Vasya", pwd: "123")
} catch AuthError.dataNotExist {
    string = ("Данные не существуют!")
} catch AuthError.wrongPassword {
    string = ("Не верный пароль!")
} catch {
    string = ("Какая-то еще ошибка!")
}

string


// Конвертация в опционал

try? auth(login: "Vasya", pwd: "123456")


// Утверждение безошибочности

try! auth(login: "Vasya", pwd: "123456") // заявился песец
