class Player {
    // Свойства
    let name: String
    var level: Int = 1
    
    // Инициализаторы
    init (name: String) {
        self.name = name
    }
    
    init (name: String = "Гость", level: Int = 0){
        self.name = name
        self.level = level
    }
    
    // Методы
    func printInfo () {
        print("Имя игрока: \(name). Уровень: \(self.level)")
    }
    
    func levelUp (count: Int) {
        self.level += count
    }
    
    func levelDown (count: Int) {
        guard count < self.level else {
            self.level = 0
            return
        }
        
        self.level -= count
    }
    
}

// Экземпляр класса
var player1 = Player(name: "Егор")
player1.printInfo()
player1.levelDown(count: 5)
player1.printInfo()

// Экземпляр класса
var player2 = Player(name: "Федор")
player2.printInfo()

var player3 = Player()
player3.printInfo()

var player4 = Player(name: "Алиса", level: 5)
player4.printInfo()

player1.level = 4
player1.level
player1.printInfo()

player1.levelUp(count: 7)
player1.printInfo()

var players: [Player] = [player1,
                         player2,
                         player3,
                         player4]

for player in players {
    print("\(player.name) уровень: \(player.level)")
}
