// Задание 1 Именнованные типы

// enum
// Месяцы в году - их 12 и это явное перечисление.
enum Month {
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december

    var discription: String {
        switch self {
        case .january: return "Январь"
        case .february: return "Февраль"
        case .march: return "Март"
        case .april: return "Апрель"
        case .may: return "Май"
        case .june: return "Июнь"
        case .july: return "Июль"
        case .august: return "Август"
        case .september: return "Сентябрь"
        case .october: return "Октябрь"
        case .november: return "Ноябрь"
        case .december: return "Декабрь"
        }
    }
}

// struct
// Медицинская карта - никогда не знаешь, чего туда запишут..
struct MedicalCard {
    let name: String
    let age: String
    let anamnesis: String
    let diagnosis: String
}

// class
// Цитируя Леонида Якубовича: "А-а-а-а-автомобиль!!"
class Automobile {
    var manufacturer = "Ferrary"
    var color = "red"
    func startEngine() {
        
    }
    func drive() {
        
    }
}

// protocol
// "Летать" и не важно кому летать, как говорится: "Ёж - птица гордая, пока не пнешь - не полетит.."
protocol Fly {
    var whereToFly: String { get }
    func howToFly()
    }


// Задание 2 Композиция и Агрегация

// Примеры композиции:
// 1. Компания и должности - при ликвидации компании все должности исчезают вместе с ней.
// 2. Папка и файлы в ней - удаляем папку - файлы следом летят в корзину.
// 3. Чат в мессенджере - удалили чат - исчезли сообщения (но это не точно)

// Примеры агрегации:
// 1. Компания и люди в ней работающие - компанию ликвидировали - люди остались, просто разошлись по своим делам.
// 2. Игра и сохранения - игру удалили - сохранения никуда не делись.
// 3. Автомобильный завод Marussia - завода нет, машины видел своими глазами.
