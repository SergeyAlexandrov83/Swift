// Задание 1
enum Artists: String {
    case Metallica
    case Disturbed
    case LedZeppelin
}

enum Countrys: String {
    case Russia
    case England
    case USA
}

struct Tracks: Equatable {
    let name: String
    var artist: Artists
    let length: String
    let country: Countrys
}

// Задание 2
class Category: Equatable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.tracksList == rhs.tracksList
    }
    
    let categoryName: String
    lazy var tracksList: [Tracks] = []
    var tracksCount: Int {
        return tracksList.count
    }
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
    
    func add(track: Tracks) {
        self.tracksList.append(track)
    }
    
    func remove(track: Tracks) {
        if let index = self.tracksList.firstIndex(of: track) {
            self.tracksList.remove(at: index)
        }
    }
}

// Задание 3
class Library {
    let libraryName: String
    lazy var categoryList: [Category] = []
    var categoryCount: Int {
        return categoryList.count
    }
    
    init(libraryName: String) {
        self.libraryName = libraryName
    }
    
    func add(category: Category) {
        self.categoryList.append(category)
    }
    
    func transfer(track: Tracks, categoryToMove: Category) {
        for category in self.categoryList {
            category.remove(track: track)
        }
        categoryToMove.add(track: track)
    }
    
    func delete(_ cat: Category) {
        if let index = categoryList.firstIndex(where: {$0 == cat}) {
            categoryList.remove(at: index)
        }
    }
}


// Полигон
let track1 = Tracks(name: "Nothing else matters", artist: .Metallica, length: "5:43", country: .USA)
let track2 = Tracks(name: "Prayer", artist: .Disturbed, length: "3:52", country: .USA)

let metal = Category(categoryName: "Metal")
metal.add(track: track1)
metal.add(track: track2)
metal.categoryName
metal.tracksCount
metal.remove(track: track2)
metal.tracksCount
let rock = Category(categoryName: "Rock")
let library = Library(libraryName: "Music lists by category")
library.add(category: metal)
library.add(category: rock)
rock.tracksList
metal.tracksList
library.transfer(track: track1, categoryToMove: rock)
rock.tracksList
metal.tracksList
library.categoryList
library.delete(metal)
library.categoryList
