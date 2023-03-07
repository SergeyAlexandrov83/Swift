import UIKit

//Обобщённые типы данных (Generics)

func swapInts(number1: inout Int, number2: inout Int) {
    let temp = number1
    number1 = number2
    number2 = temp
}

var num1 = 34
var num2 = 21

swapInts(number1: &num1, number2: &num2)
num1
num2

func swapDoubles(number1: inout Double, number2: inout Double) {
    let temp = number1
    number1 = number2
    number2 = temp
}


func swap<MyType>(value1: inout MyType, value2: inout MyType) {
    let temp = value1
    value1 = value2
    value2 = temp
}

swap(value1: &num1, value2: &num2)

var name1 = "Вася"
var name2 = "Онотолей"
swap(value1: &name1, value2: &name2)
name1
name2


//Ограничение типа
func sum<Number: Numeric>(number1: Number, number2: Number) -> Number {
    return number1 + number2
}

let resultInt = sum(number1: 20, number2: 90)
let resultDouble = sum(number1: 23.56, number2: 12.9)
let resultUInt32 = sum(number1: UInt32(23), number2: UInt32(87))

//Numeric - все числа

//Comparable - Все сравниваемые на предмет < >
//Equatable - Все сопоставляемые (на предмет == !=)

enum IPhoneModel: String, CaseIterable {
    case fourteen = "14"
    case ftPlus = "14 Plus"
    case ftPro = "14 Pro"
    case ftProMax = "14 Pro Max"
    
}

struct IPhone: Comparable, Equatable, CustomStringConvertible {
    var model: IPhoneModel
    var hdd: Int
    var color: String
    
    var description: String {
        return "\(color) iPhone \(model.rawValue) \(hdd) ГБ HDD"
    }
    
    static func < (lhs: IPhone, rhs: IPhone) -> Bool {
        var firstIndex = 0
        var secondIndex = 0
        
        for (index, model) in IPhoneModel.allCases.enumerated() {
            if lhs.model == model { firstIndex = index}
            if rhs.model == model { secondIndex = index}
        }
        
        if firstIndex == secondIndex {
            return lhs.hdd < rhs.hdd
        } else {
            return firstIndex < secondIndex
        }
    }
    
    static func == (lhs: IPhone, rhs: IPhone) -> Bool {
        return lhs.model == rhs.model && lhs.hdd == rhs.hdd && lhs.color == rhs.color
    }
}

let ipPhone1 = IPhone(model: .fourteen, hdd: 256, color: "White")
let ipPhone2 = IPhone(model: .fourteen, hdd: 256, color: "White")

ipPhone1 == ipPhone2

print(ipPhone1)


//CustomStringConvertible - Все типы, которые могут быть представлены в виде строки

var array = [1,2,3,4,5]
print(array.description)
let number = 456
print(number)


class Person: CustomStringConvertible {
    let name: String
    var age: Int
    
    var description: String {
        return "Человек \(name). Возраст: \(age) лет"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let vasya = Person(name: "Вася", age: 34)
print(vasya)


protocol Storage {
    associatedtype Item
    func store(item: Item)
    func retrieve(index: Int) -> Item?
}

struct Book {
    let title: String
    let author: String
}

class BookCase: Storage {
    typealias Item = Book
    private(set) var storage = [Book]()
    
    func store(item: Book) {
        self.storage.append(item)
    }
    
    func retrieve(index: Int) -> Book? {
        guard storage.count > index else { return nil }
        return storage.remove(at: index)
    }
}

let bookCase = BookCase()
let warAndPeace = Book(title: "Война и Мир", author: "Л.Н. Толстой")
let onegin = Book(title: "Евгений Онегин", author: "А.С. Пушкин")
bookCase.store(item: warAndPeace)
bookCase.store(item: onegin)
bookCase.retrieve(index: 1)
bookCase.retrieve(index: 1)
bookCase.storage.count

class Trunk<Item>: Storage {
    private(set) var storage = [Item]()
    
    func store(item: Item) {
        self.storage.append(item)
    }
    
    func retrieve(index: Int) -> Item? {
        guard storage.count > index else { return nil }
        return storage.remove(at: index)
    }
}

struct Dress {
    let brend: String
    let size: Int
}

let dress1 = Dress(brend: "Gucci", size: 48)
let dress2 = Dress(brend: "Versace", size: 52)

let bookTrunk = Trunk<Book>()
let dressTrunk = Trunk<Dress>()

bookTrunk.store(item: onegin)
bookTrunk.store(item: warAndPeace)
dressTrunk.store(item: dress1)
dressTrunk.store(item: dress2)
let dress = dressTrunk.retrieve(index: 1)






//Stack
struct Stack<Element> {
    private var container = [Element]()
    
    var isEmpty: Bool { container.isEmpty }  //Проверка на пустоту
    var size: Int { container.count }   //Размер
    var top: Element? { container.last } //Верхний элемент

    mutating func push(_ element: Element) {  //Положить в стек
        container.append(element)
    }
    
    mutating func pop() -> Element? {  //Достать из стека
        if !isEmpty {
            return container.removeLast()
        } else {
            return nil
        }
    }
}

var booksStack = Stack<Book>()
booksStack.push(onegin)
booksStack.pop()
booksStack.push(onegin)
booksStack.push(warAndPeace)
booksStack.pop()
booksStack.pop()
booksStack.pop()

var intStack = Stack<Int>()

intStack.push(34)
intStack.push(14)
intStack.push(39)
intStack.push(23)
intStack.push(23)
intStack.push(23)
intStack.size
intStack.pop()
intStack.pop()
intStack.pop()

//print(intStack.top)


//Queue - очередь

struct Queue<Element> {
    private var container = [Element]()
    
    //Head
    var head: Element? { container.first }
    
    //Tail
    var tail: Element? { container.last }
    
    //isEmpty
    var isEmpty: Bool { container.isEmpty }
    
    //Size
    var size: Int { container.count }
    
    //enqueue
    mutating func enqueue(_ element: Element) {
        container.append(element)
    }
    
    //dequeue
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        return container.removeFirst()
    }
}

//Deque
struct Deque<Element> {
    //container
    private var container = [Element]()
    
    //head
    var head: Element? { container.first }
    //tail
    var tail: Element? { container.last }
    //size
    var size: Int { container.count }
    //isEmpty
    var isEmpty: Bool { container.isEmpty }
    
    //addFirst
    mutating func addFirst(_ element: Element) {
        container.append(element)
    }
    //addLast
    mutating func addLast(_ element: Element) {
        container.insert(element, at: 0)
    }
    //removeFirst
    mutating func removeFirst() -> Element? {
        guard !isEmpty else { return nil }
        return container.removeFirst()
    }
    //removeLast
    mutating func removeLast() -> Element? {
        guard !isEmpty else { return nil }
        return container.removeLast()
    }
}


var dequeStack = Deque<Int>()
dequeStack.isEmpty
dequeStack.addFirst(10)
dequeStack.addFirst(20)
dequeStack.addLast(30)
dequeStack.size
dequeStack.head
dequeStack.tail
dequeStack.removeFirst()
dequeStack.removeLast()























