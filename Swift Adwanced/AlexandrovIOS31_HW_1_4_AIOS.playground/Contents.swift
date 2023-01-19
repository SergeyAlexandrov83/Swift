// Задание 1
enum TVChannels: String {
    case channel1 = "Discovery"
    case channel2 = "RT"
    case channel3 = "MTV"
}

struct TVEphir


class TV {
    let marknmodel: [String: String]
    var isOnOff: Bool
    var curentChanel: TVChannels = .channel1
    
    init(marknmodel: [String: String],
         isOnOff: Bool) {
        self.marknmodel = marknmodel
        self.isOnOff = isOnOff
    }
    
    func turnTVOnOff() {
        if !isOnOff {
            isOnOff = true
            print("ТВ Включен!")
        } else {
            isOnOff = false
            print("ТВ Выключен!")
        }
    }
    
    func whatsOnTV() {
        if isOnOff {
            print(curentChanel.rawValue)
        } else {
            print("TV is OFF!")
        }
    }
    
    func changeChannel(button: Int) {
        if isOnOff {
            switch button {
            case 1:
                curentChanel = .channel1
            case 2:
                curentChanel = .channel2
            case 3:
                curentChanel = .channel3
            default:
                print("Такой канал не настроен!")
            }
            print("Канал \(curentChanel.rawValue) включен!")
            whatsOnTV()
        } else {
            print("ТВ выключен!")
        }
    }
}


let oldTV = TV(marknmodel: ["SONY": "KD-80"], isOnOff: false)
oldTV.whatsOnTV()
oldTV.turnTVOnOff()
oldTV.whatsOnTV()
oldTV.changeChannel(button: 2)
oldTV.changeChannel(button: 3)
oldTV.turnTVOnOff()
oldTV.whatsOnTV()


// Задание 2
struct Settings {
    var volume: Double
    var colourPicture: Bool
}
    
class NewTV: TV {
    var settings = Settings(volume: 0, colourPicture: true)
    
    init(settings: (volume: Double, colourPicture: Bool),
         marknmodel: [String: String], isOnOff: Bool) {
        self.settings.volume = settings.volume
        self.settings.colourPicture = settings.colourPicture
        super.init(marknmodel: marknmodel, isOnOff: isOnOff)
    }
    
    func changeSettings (volume: Double, colourPicture: Bool){
        settings.volume = volume
        settings.colourPicture = colourPicture
    }
    
    override func whatsOnTV() {
        super.whatsOnTV()
        if isOnOff {
            switch settings.volume {
            case 0.0...1.0:
                if settings.colourPicture {
                    print("Громкость \(settings.volume), изображение цветное")
                } else {
                    print("Громкость \(settings.volume), изображение черно-белое")
                }
            default:
                print("Вне допустимых пределов громкости!")
            }
        }
    }
}

var modernTV = NewTV(settings: (volume: 0.7, colourPicture: true), marknmodel: ["SONY" : "KD-100"], isOnOff: false)
modernTV.whatsOnTV()
modernTV.turnTVOnOff()
modernTV.whatsOnTV()
modernTV.changeSettings(volume: 0.3, colourPicture: false)
modernTV.whatsOnTV()
modernTV.changeChannel(button: 2)
modernTV.turnTVOnOff()
modernTV.whatsOnTV()


// Задание 3
enum VideoOutput {
    case tvChannel(TVChannels)
    case HDMI
}

class TVwithHDMI: NewTV {
    var output = VideoOutput.tvChannel(.channel1)
    override init(settings: (volume: Double, colourPicture: Bool),
                  marknmodel: [String : String], isOnOff: Bool) {
        super.init(settings: settings, marknmodel: marknmodel, isOnOff: isOnOff)
    }

    func changeOutput() {
        switch output {
        case VideoOutput.tvChannel(_):
            output = VideoOutput.HDMI
            print("Смотрим HDMI")
        case VideoOutput.HDMI:
            output = VideoOutput.tvChannel(.channel1)
            print("Смотрим TV")
        }
    }
    override func whatsOnTV() {
        switch output {
        case .tvChannel(_):
            print("Идет трансляция телевизионных каналов")
            super.whatsOnTV()
        case .HDMI:
            print("Подключен HDMI")
        }
    }
}

var superTV = TVwithHDMI(settings: (volume: 1, colourPicture: true), marknmodel: ["SONY" : "KD-500"], isOnOff: true)

superTV.whatsOnTV()
superTV.changeOutput()
superTV.whatsOnTV()
