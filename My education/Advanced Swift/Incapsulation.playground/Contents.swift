class Wallet {
    static let shared = Wallet() // SingleTone
    
    private var balance = 0
    
    private init() { }
    
    func add(cash: Int) {
        self.balance += cash
        print(self.balance)
    }
    
    func withdraw(cash: Int) -> Int{
        guard cash <= balance else {
            return 0
        }
        balance -= cash
        return cash
    }
    
    func getBalance() -> Int {
        return self.balance
    }
}

//var wallet = Wallet()
//
//wallet.add(cash: 5000)
//wallet.withdraw(cash: 10000) // Не получится!
//wallet.withdraw(cash: 3000)
//wallet.withdraw(cash: 3000) // Не получится
//wallet.withdraw(cash: 2000)
//print(wallet.getBalance())

class Shop {
    
    var wallet = Wallet.shared
}

class Job {
    
    var wallet = Wallet.shared
    
    //var wallet2 = Wallet() - запрещаем приватным инициализатором
}

var aushan = Shop()

var fabrica = Job()

fabrica.wallet.add(cash: 15000)
let checkSum = aushan.wallet.withdraw(cash: 3000)

print(checkSum)
fabrica.wallet.getBalance()
aushan.wallet.getBalance()

class Person {
    
    let wallet = Wallet.shared
    var goods = [String]()
    
    private func get(goods: String) {
        self.goods.append(goods)
        print("Товар \(goods) куплен")
    }
    
    private func give(money: Int) {
        self.wallet.withdraw(cash: money)
        print("Сумма чека \(money) рублей")
    }
    
    func buy(goods: String, price: Int) {
        
        guard price <= wallet.getBalance() else {
            return
        }
        get(goods: goods)
        give(money: price)
    }
}

let vasya = Person()
print(vasya.goods)
vasya.wallet.getBalance()

fabrica.wallet.add(cash: 80000)
vasya.wallet.getBalance()

vasya.buy(goods: "iPhone 13 mini", price: 69990)
vasya.wallet.getBalance()
vasya.buy(goods: "Beer", price: 650)
vasya.goods
vasya.wallet.getBalance()

