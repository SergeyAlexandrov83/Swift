import Cocoa

// Equatable - равно/не равно
// Comparable - сравниваемые сопоставляемые < > <= >= == !=
// CustomStringConvertible - могут быть представленны в виде строки
// Numerics - все числа


// Generics - обобщенные типы данных

func addInts(a: Int, b: Int) -> Int{
    return a + b
}

func addDoubles(a: Double, b: Double) -> Double{
    return a + b
}

func add<T: Numeric>(a: T, b: T) -> T {
    return a + b
}

add(a: 56, b: 23)
add(a: 56.4, b: 23.9)

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
    
    var books = [Book]()
    
    func store(item: Book) {
        books.append(item)
    }
    
    func retrieve(index: Int) -> Book? {
        guard index < books.count else {
            return nil
        }
        return books[index]
    }
}

class Case<Item>: Storage {
    
    var items = [Item]()
    func store(item: Item) {
        items.append(item)
    }
    
    func retrieve(index: Int) -> Item? {
        guard index < items.count else {
            return nil
        }
        return items[index]
    }
}

struct Clothes {
    let brent: String
    let price: Int
    let size: String
}

let tShort = Clothes(brent: "Henderson", price: 1500, size: "XXL")
let shoes = Clothes(brent: "Nike", price: 100, size: "43")

let clothCase = Case<Clothes>()
clothCase.store(item: tShort)
clothCase.store(item: shoes)

clothCase.items.count
clothCase.items.last?.price
clothCase.items.last?.brent

//STACK - последний вошел - первый вышел
//API стека
//Контейнер - массив записей
//push - положить в стек
//рор - достать последний элемент стека
//isEmpty - пустой ли стек
//size - размер стека
//top - верхний элемент стека

struct Stack<T> {
    
    private var container = [T]()
    
    var isEmpty: Bool {
        return self.container.isEmpty
    }
    
    var size: Int {
        return self.container.count
    }
    
    var top: T? {
        return self.container.last
    }
    
    mutating func push(_ element: T) {
        self.container.append(element)
    }
    
    mutating func pop() -> T? {
        if !self.isEmpty {
            return container.removeLast()
        } else {
            return nil
        }
    }
}

var stack = Stack<String>()
var array = Array<String>()

stack.push("Анна Каренина")
stack.push("Кот Леопольд")
stack.push("Бурятина")
stack.push("Идиот")

stack.size
stack.isEmpty
stack.top
stack.pop()
stack.top
stack.size
stack.pop()
stack.pop()
stack.pop()
stack.size
stack.isEmpty

let aaray = Array<String>()



