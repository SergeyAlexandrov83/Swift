//Задание 1

//Класс: сеть магазинов электроники
//Имеет публичный доступ, так как любой может воспользоваться им - прийти и купить что либо.
//Пример геттера: узнать цену товара, узнать есть ли товар в наличии
//Пример сеттера: создать заказ
//Пример публичного метода: заказать доставку товара домой
//Пример приватного метода: осуществить доставку, прием товара, организация демонстрационного зала

//Задание 2

class Example {
    func dosomething(_ source: Int) {

    }
    func dosomething(_ source: String) {

    }
    func dosomething(_ source: Bool) {

    }
}

//Задание 3

class Parent {
    func printHello() {
        print("Hello!")
    }
}

class Overrider: Parent {
    override func printHello() {
        super.printHello()
        print("Привет!")
    }
}
