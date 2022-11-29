protocol Flying {
    func fly(from: String, to: String)
}

protocol Carrier {
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

//Задача 1
//Абстракция
//Инкапсуляция
//Наследование
//Полиморфизм
//
//Задача 2
//Класс
//Объект
//Свойства объектов
//Методы
