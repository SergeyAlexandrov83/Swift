//protocol Flying {
//    func fly(from: String, to: String)
//}
//
//protocol Carrier {
//    func load()
//    func refuel()
//}
//
//class Bird: Flying {
//    func fly(from: String, to: String) {}
//}
//
//class Airplane: Flying, Carrier {
//
//    func fly(from: String, to: String) {}
//    func load() {}
//    func refuel() {}
//}

//Задача 1
//Абстракция
//Инкапсуляция
//Наследование
//Полиморфизм
protocol Instruments {
    func fly(from: String, to: String)
}

protocol Band {
    func load()
    func refuel()
}

class Bird: Flying {
    func fly(from: String, to: String) {}
}

class Airplane: Flying, Carrier {

    func fly(from: String, to: String) {}
    func load() {}
    func refuel() {}
}



//Задача 2
//Класс
// Класс - Холодильник
//Объект
//Свойства объектов
//Методы
