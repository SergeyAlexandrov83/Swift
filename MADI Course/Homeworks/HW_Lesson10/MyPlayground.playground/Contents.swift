import UIKit

//1. Создайте структуру Блюдо со свойствами Название, массив ингредиентов, цена.
struct Food {
    let name: String
    let ingr: [String]
    var price: Int
    
    //Создайте метод в этой структуре, который печатает состав блюда в консоль.
    func ingrPrint() {
        print(ingr)
    }
}
//Создайте структуру «Позиция в заказе» со свойствами Блюдо, и вычисляемым свойством сумма записи.
struct posInOrder {
    var food: Food
    var orderSum: Int { food.price }
}
//Создайте класс Официант.
class garson {
    //Объявите ему свойство Заказ (массив позиций в заказе)
    var order: [posInOrder] = []
    //приватное вычисляемое свойство Сумма чека,
    private var checkSum: Int {
        var sum = 0
        order.forEach { posInOrder in
            sum += posInOrder.orderSum
        }
        return sum
    }
    
//Методы Добавить позицию в заказ,
    func inOrder(addPos: posInOrder) {
        order.append(addPos)
    }
//Удалить позицию из заказа,
    func outOrder(delPos: posInOrder) {
        if let index = order.firstIndex(where: { $0.food.name == delPos.food.name }) {
            order.remove(at: index)
        }
    }
//Изменить позицию в заказе,
    func changePos(addPos: posInOrder, delPos: posInOrder) {
        inOrder(addPos: addPos)
        outOrder(delPos: delPos)
    }
//Подытожить заказ (перечислить наименования и количества блюд).
    func needMoreTips() {
        var dictOrder: [String: Int] = [:]
        order.forEach { pos in
            if dictOrder.keys.contains(pos.food.name) {
                dictOrder[pos.food.name]! += 1
            } else {
                dictOrder[pos.food.name] = 1
            }
        }
        dictOrder.forEach { pos in
            print("Название: \(pos.key) - \(pos.value)шт")
        }
    }
//Выставить счёт.
    func checkPls() {
        var sum = 0
        order.forEach { pos in
            sum += pos.orderSum
        }
        print("На кассу: \(sum)")
    }
}


//2. Создайте перечисление, содержащее размеры одежды (XXS, XS, XS, S, M, L, XL). Перечисление содержит свойство getDescription, возвращающее строку "Взрослый размер», а для размера XXS - “Детский размер”.  Также перечисление должно содержать чистое значение euroSize(32, 34, 36, 38, 40, 42), соответствующее каждому размеру. Создайте инициализатор, принимающий на вход euroSize.
enum Sizes: Int {
    case XXS = 32
    case XS = 34
    case S = 36
    case M = 38
    case L = 40
    case XL = 42
    
    var getDescription: String {
        switch self {
            
        case .XXS:
            return "Детский размер"
        case .XS:
            return "Взрослый размер»"
        case .S:
            return "Взрослый размер»"
        case .M:
            return "Взрослый размер»"
        case .L:
            return "Взрослый размер»"
        case .XL:
            return "Взрослый размер»"
        }
    }
    
//    var euroSize: Int {
//        switch self {
//
//        case .XXS:
//            return 32
//        case .XS:
//            return 34
//        case .S:
//            return 36
//        case .M:
//            return 38
//        case .L:
//            return 40
//        case .XL:
//            return 42
//        }
//    }
    
    init(euroSize: Int) {
        switch euroSize {
        case 32: self = .XXS
        case 34: self = .XS
        case 36: self = .S
        case 38: self = .M
        case 40: self = .L
        case 42: self = .XL
        default:
            self = .XL
        }
    }
}


//3. Создайте перечисление Направление с кейсами направо, налево и назад, с чистыми строковыми значениями.
enum Direction: String {
    case onRight = "Направо"
    case onLeft = "Налево"
    case back = "Назад"
}
//Создайте перечисление Действие с кейсами идти (ассоциированное значение дистанция в метрах), бежать(ассоциированные значения дистанция в метрах и скорость), повернуть(ассоциированное значение - направление типа Направление), остановиться.
enum Action {
    case walk(dist: Int)
    case run(dist: Int, speed: Int)
    case turn(dir: Direction)
    case stop
    
    //Создайте в перечислении Действие вычисляемое свойство Описание, которое печатает строки вида:
    //Идти 200 метров
    //Бежать 400 метров со скоростью 12 км/ч
    //Повернуть направо
    //Остановиться
    var discription: String {
        switch self {
            
        case .walk(dist: let dist):
            return "Идти \(dist) метров"
        case .run(dist: let dist, speed: let speed):
            return "Бежать \(dist) метров со скоростью \(speed) км/ч"
        case .turn(dir: let dir):
            return "Повернуть \(dir)"
        case .stop:
            return "Остановиться"
        }
    }
}

