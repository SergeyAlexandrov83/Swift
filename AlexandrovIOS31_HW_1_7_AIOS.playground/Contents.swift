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

// ?????????????????? ???? ?? ??????????????, ?????? ?????????????? ?? ???????????? ?????????? ??????????????, ?? ???? ?????????????
let metallica = Metallica(name: "Metallica", country: .usa, genre: .rock)
let morgenshtern = Morgenshtern(name: "Morgenshtern", country: .russia, genre: .rap)
let kda = KDA(name: "K/DA", country: .usa, genre: .pop)
var artistaList: [Artist] = []
artistaList.append(metallica)
artistaList.append(morgenshtern)
artistaList.append(kda)
print(artistaList)

// ?????????????? ???????? ???? 3 ???? 5 - ?????????? ???????????? ????????????????, ?????????????????? ????????????????????, ?????????????????? ?????????????????????? ????????, ?? ???? ?????????????????????? ?????????? ?? ??????????????. ????????????????, ???? ?????????? ?????????????????????? ???????????? Advanced Swift ???? ?????????????? ?????????? ???? ???????????????? ?????????????? ?????????????????? - ?????????????????????? ??????????????????, ?????????????? ???? ???????????????? ?? ?????????? - ?????????????????? ???? ?????????????????? ??????????????, ?????????????????? ???? ?? ?????????????????? ???????????? ?? ???????????????? ?????????? ???????????????? - ???? ????????, ?? ???? ??????????????????, ???? ?????? ????????????, ???? ?????? ?? ?????????? ?????????????????????? ???????? - ?????????????????? ???????????????? ?????????????? ?????????????????? ???? ???????????? ???????????????? ?????????? ???????????? - ???? ?????? ???????????? ???????????????? ????????!
// ?????????? - ?????? ?????????????? ???????? ???????????????????????? ?? ?????????????????????????????? ?????????? ???? ?????????????????? ?????????????????? - ??????????????, ?????? ?????? ???????????????????? ?? ?????? ???????????? ?????????? ???? "????????????????" ??????????????????????????, ???? ?????? ?????????????? ???? ?????????????? ???????????????????????? ???????????????? ???? ?????????????? ???????????? ???????????? - ???????????? ???????????????????? ??????????????????????, ???? ?????? ????????????, ?????????????? ?????????????????????? ???????? ???? ?????????????????? Xcode ?? ???????????? ???? ???????????????????? ???????????????? ?????? ?? ???????????????? ??????????????????, ?????????????? ???????????????? ?????? ?? ?????? - ?????? ?????????? ?????????????? ?????????????????? ?????????? ?????? ???????????? ?? ?????????????????? ?????????? - ?????????????????? - ?????? ?????? ????????????????????...
