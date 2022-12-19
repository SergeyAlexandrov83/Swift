import Cocoa

enum Country {
    case russia
    case usa
    case england
}

enum Genre {
    case rock
    case pop
    case rap
}

class Artist {
    let name: String
    let country: Country
    let genre: Genre
    lazy var tracksList: [String] = []
    
    init(name: String, country: Country, genre: Genre) {
        self.name = name
        self.country = country
        self.genre = genre
    }
    
    func writeTrack(_ trackName: String) {
        tracksList.append(trackName)
        print("Artist \(self.name) make track \(trackName)")
        
    }
    
    func playTrack(_ trackName: String) {
        if tracksList.contains(trackName) {
            print("Artist \(self.name) play track \(trackName)")
        } else {
            print("Stop singing other people's songs!")
        }
    }
}

final class Metallica: Artist {
    lazy var albums: [String] = []
    
    func writeAlbum(_ albumName: String) {
        albums.append(albumName)
    }
    
    override func writeTrack(_ trackName: String) {
        super.writeTrack(trackName)
        print("And this track is awesome!")
    }
    
    override func playTrack(_ trackName: String) {
        super.playTrack(trackName)
        print("And peoples like it!")
    }
}

final class Morgenshtern: Artist {
    lazy var money: [Int] = []
    
    func makeMoney(_ howMany: Int) {
        money.append(howMany)
    }
    
    override func writeTrack(_ trackName: String) {
        super.writeTrack(trackName)
        print("And this track is bad!")
    }
    
    override func playTrack(_ trackName: String) {
        super.playTrack(trackName)
        print("Why peoples like it?")
    }
}

final class KDA: Artist {
    lazy var clip: [String] = []
    
    func makeClip(_ clipName: String) {
        clip.append(clipName)
    }
    
    override func writeTrack(_ trackName: String) {
        super.writeTrack(trackName)
        print("Let's code next one!")
    }
    
    override func playTrack(_ trackName: String) {
        super.playTrack(trackName)
        print("And DANCE!")
    }
}

// Правильно ли я понимаю, что сложить в список нужно объекты, а не классы?
let metallica = Metallica(name: "Metallica", country: .usa, genre: .rock)
let morgenshtern = Morgenshtern(name: "Morgenshtern", country: .russia, genre: .rap)
let kda = KDA(name: "K/DA", country: .usa, genre: .pop)
var artistaList: [Artist] = []
artistaList.append(metallica)
artistaList.append(morgenshtern)
artistaList.append(kda)
print(artistaList)

// Понимаю тему на 3 из 5 - нужно больше практики, реального применения, написания работающего кода, а не сферических коней в вакууме. Например, за время прохождения модуля Advanced Swift мы реально могли бы написать цельную программу - музыкальная картотека, которая бы работала в целом - позволяла бы создавать объекты, добавлять их в различные списки и выдавать некие подборки - не знаю, я не методолог, не мне судить, но ООП в целом комплексная тема - написание большого проекта разбитого на модули согласно темам лекций - на мой взгляд отличная идея!
// Узнал - что изучать тему наследования и переопределения лучше на сторонних площадках - понятно, что это вкусовщина и мне просто может на "заходить" преподаватель, но мне реально не хватает практических примеров на лекциях Сергея Котова - вместо пространых рассуждений, на мой взгляд, гораздо эффективнее было бы запустить Xcode и вместе со студентами написать код с простыми примерами, попутно объясняя что и как - тем самым проведя студентов через все ошибки и подводные камни - повторюсь - все это вкусовщина...
