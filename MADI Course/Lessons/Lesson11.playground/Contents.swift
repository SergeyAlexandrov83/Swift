import UIKit

//Протокол - абстрактный тип данных в Swift; набор требований, необходимых для реализации у тех сущностей, которые подписаны под этот протокол

protocol BankClient {
    var fullName: String { get }
    var balance: Int { get }
}

class Company: BankClient {
    let title: String
    let form: String
    var fullName: String { "\(form) \(title)" }
    var balance: Int
    var director: String
    
    init(title: String, form: String, director: String) {
        self.title = title
        self.form = form
        self.balance = 0
        self.director = director
    }
}

struct Person: BankClient {
    var firstName: String
    var fatherName: String
    var surName: String
    var fullName: String {"\(surName) \(firstName) \(fatherName)"}
    var balance: Int = 0
}

var vasya = Person(firstName: "Василий", fatherName: "Петрович", surName: "Пупкин", balance: 5000)
let beeline = Company(title: "Вымпелком", form: "ПАО", director: "Аркадий")

vasya.fullName
vasya.balance

beeline.balance
beeline.fullName

var clients: [BankClient] = [vasya, beeline]

let messages = clients.map { client in
    var name = ""
    if let client = client as? Person {
        name = client.firstName
    } else if let client = client as? Company {
        name = client.director
    }
    
    return "Уважаемый \(name)! В праздники платежи между банками не ходют!"
}

messages.forEach {print($0)}

class Auto {
    var title: String
    init(title: String) {
        self.title = title
    }
}

class Bus: Auto {
    let maxPeople: Int
    
    init(title: String, maxPeople: Int) {
        self.maxPeople = maxPeople
        super.init(title: title)
    }
}

class Trailer: Auto {
    let lifting: Int
    
    init(title: String, lifting: Int) {
        self.lifting = lifting
        super.init(title: title)
    }
}

let ikarus = Bus(title: "ИКАРУС", maxPeople: 54)
let kamaz = Trailer(title: "KamAZ", lifting: 5000)
let man = Bus(title: "MAN", maxPeople: 48)
let maz = Trailer(title: "MAZ", lifting: 4500)

//IKARUS может перевозить 54 человека
//MAZ может перевозить 4500 кг груза

let autos: [Auto] = [ikarus, kamaz, man, maz]

autos.forEach { auto in
    if let bus = auto as? Bus {
        print("\(bus.title) может перевозить \(bus.maxPeople) человек(а)")
    } else if let trailer = auto as? Trailer {
        print("\(trailer.title) может перевозить \(trailer.lifting) кг груза")
    }
}

protocol Substance {
    init(title: String, dencity: Double)
    init(title: String, volume: Double, weight: Double)
}

class Water: Substance {
    let title: String
    let dencity: Double
    
    required init(title: String, dencity: Double = 1000) {
        self.title = title
        self.dencity = dencity
    }
    
    required init(title: String, volume: Double, weight: Double) {
        self.title = title
        self.dencity = weight / volume
    }
}

protocol MFD {
    var symbolsCount: Int { get }
    
    init(title: String)
    
    func copy(text: String) -> String
    func printing(text: String)
    func counting(count: Int)
}

class HewlettPackard: MFD {
    var title: String
    var symbolsCount: Int = 0
    
    required init(title: String) {
        self.title = title
    }
    
    func copy(text: String) -> String {
        counting(count: text.count)
        return text
    }
    
    func printing(text: String) {
        print(text)
        counting(count: text.count)
    }
    
    func counting(count: Int) {
        self.symbolsCount += count
    }
}

let hp = HewlettPackard(title: "mf-3456")
hp.symbolsCount
hp.printing(text: "Уж небо осенью дышало")
hp.symbolsCount
let copy = hp.copy(text: "Мой дядя самых честных правил")
hp.symbolsCount

protocol FullyNamed {
    var fullName: String { get }
}


protocol Location {
    var lon: Double { get }
    var lat: Double { get }
}

protocol ConcertPlace: FullyNamed, Location {
    var places: Int { get }
    func concert(band: String)
}

struct Stadium: ConcertPlace {
    var places: Int
    var fullName: String
    var lon: Double
    var lat: Double
    
    func concert(band: String) {
        print("Проходит концерт группы \(band)")
    }
}

let luzha = Stadium(places: 7000, fullName: "Лужники", lon: 34.567, lat: 23.456)
luzha.concert(band: "Король и шут")

func anons(place: FullyNamed & Location, eventTitle: String) {
    print("На площадке \(place.fullName) пройдёт мероприятие \(eventTitle)")
}

struct Cafe: FullyNamed, Location {
    var fullName: String
    var lon: Double
    var lat: Double
}


let cafe = Cafe(fullName: "Кофейня 3в1", lon: 45.6, lat: 34.8)

anons(place: cafe, eventTitle: "Вечер поэзии")
anons(place: luzha, eventTitle: "Концерт группы Кипелов")




enum Point: String, CaseIterable {
    case north = "Север"
    case south = "Юг"
}


//Если get - обязателен Геттер, а Сеттер - по желанию
//Если get set - оба обязательны

protocol Round {
    var area: Double { get set }
}

struct Circle: Round {
    var radius: Double
    var area: Double {
        get { Double.pi * radius * radius }
        set { radius = sqrt(newValue / Double.pi) }
    }
}

//Делегат (Delegate)
//Делегатор - ставит задачу
//Тип делегата - протокол, которому должен соответствовать делегат
//Делегат

protocol AddProductDelegate {
    func addNewProduct(_ title: String)
}

class Cart: AddProductDelegate {
    var products: [String] = []
    
    func addNewProduct(_ title: String) {
        self.products.append(title)
    }
}

class FavoritesScreen: AddProductDelegate {
    var favorites: [String] = []
    
    func addNewProduct(_ title: String) {
        self.favorites.append(title)
    }
}

class ProductScreen {
    let title: String
    var delegate: AddProductDelegate?
    
    init(title: String) {
        self.title = title
    }
    
    func addToCart() {
        delegate?.addNewProduct(title)
    }
    
}

let whiskeyScreen = ProductScreen(title: "Jack Daniels")
let j7Screen = ProductScreen(title: "J7")
let laysScreen = ProductScreen(title: "Lay's")

let cartScreen = Cart()

whiskeyScreen.delegate = cartScreen
whiskeyScreen.addToCart()
cartScreen.products
j7Screen.delegate = cartScreen
j7Screen.addToCart()
cartScreen.products
laysScreen.delegate = cartScreen
laysScreen.addToCart()
cartScreen.products

let favoritesScreen = FavoritesScreen()
j7Screen.delegate = favoritesScreen
j7Screen.addToCart()
favoritesScreen.favorites
laysScreen.delegate = favoritesScreen
laysScreen.addToCart()
favoritesScreen.favorites





struct Product {
    var title: String
    var price: Int
}


protocol SaleDelegate {
    func sale(productTitle: String, count: Int) -> Int
}

class Buyer {
    var delegate: SaleDelegate?
    
    func buy(productTitle: String, count: Int) {
        if let cost = delegate?.sale(productTitle: productTitle, count: count) {
            print("Продукт \(productTitle) обошёлся мне в \(cost)₽")
        }
    }
}

class Seller: SaleDelegate {
    var products = [Product(title: "Соль", price: 24),
                    Product(title: "Кефир", price: 89),
                    Product(title: "Яйца", price: 112)]
    
    func sale(productTitle: String, count: Int) -> Int {
        guard let product = products.first(where: { product in
            product.title == productTitle
        }) else { return 0 }
        let cost = product.price * count
        return cost
    }
    
    func goToBuyer(buyer: Buyer) {
        buyer.delegate = self
    }
    
}

let seller = Seller()
let buyer = Buyer()
//
//buyer.buy(productTitle: "Кефир", count: 3)
//buyer.delegate = seller
//buyer.buy(productTitle: "Кефир", count: 2)

seller.goToBuyer(buyer: buyer)
buyer.buy(productTitle: "Соль", count: 3)






//Наблюдатель (Observer)



//Тип наблюдателя
protocol Observer {
    func didGet(newTask: String)
}

//Тип субъекта
protocol Subject {
    func add(_ observer: Observer)
    func remove(_ observer: Observer)
    func notification(task: String)
}

//Субъект
class Prorab: Subject {
    var observers = NSMutableSet()
    var task: String = "" {
        didSet {
            notification(task: task)
        }
    }
    
    func add(_ observer: Observer) {
        observers.add(observer)
    }
    
    func remove(_ observer: Observer) {
        observers.remove(observer)
    }
    
    func notification(task: String) {
        observers.forEach { ($0 as! Observer).didGet(newTask: task) }
    }
}


//Наблюдатели
class Worker: NSObject, Observer {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func didGet(newTask: String) {
        print("\(name): Делаю задачу - \(newTask)")
    }
}

class Director: NSObject, Observer {
    var journal: [String] = []
    
    func didGet(newTask: String) {
        journal.append(newTask)
    }
}

let dulin = Prorab()
let ravshan = Worker(name: "Равшан")
let djumshut = Worker(name: "Джумшут")
let mihalych = Director()

dulin.add(ravshan)
dulin.add(djumshut)
dulin.add(mihalych)

dulin.observers.count
dulin.task = "Покрасить телевизор"
dulin.task = "Повесить дверь над головой"
dulin.task = "Постирать магнитофон"

print(mihalych.journal)












