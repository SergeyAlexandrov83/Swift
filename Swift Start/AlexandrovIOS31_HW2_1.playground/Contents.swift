import Cocoa

// Задание 1
let january: String = "Январь"
let february: String = "Февраль"
let march: String = "Март"
let april: String = "Апрель"
let may: String = "Май"
let june: String = "Июнь"
let july: String = "Июль"
let august: String = "Август"
let september: String = "Сентябрь"
let october: String = "Октябрь"
let november: String = "Ноябрь"
let december: String = "Декабрь"

var selectedMonth: String = january

if selectedMonth == "Январь" {
    var workDays: Int = 31-8-8
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Февраль" {
    var workDays: Int = 29-8-1
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Март" {
    var workDays: Int = 31-8-1
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Апрель" {
    var workDays: Int = 30-8
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Май" {
    var workDays: Int = 31-8-1
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Июнь" {
    var workDays: Int = 30-8-1
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Июль" {
    var workDays: Int = 31-8
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Август" {
    var workDays: Int = 31-8
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Сентябрь" {
    var workDays: Int = 30-8
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Октябрь" {
    var workDays: Int = 31-8
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Ноябрь" {
    var workDays: Int = 30-8-1
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
} else if selectedMonth == "Декабрь" {
    var workDays: Int = 31-8
    print("В месяце \(selectedMonth) \(workDays) рабочих дней")
}


// Задание 2
selectedMonth = february

switch selectedMonth {
    case "Январь":
        var workDays: Int = 31-8-8
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Февраль":
        var workDays: Int = 29-8-1
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Март":
        var workDays: Int = 31-8-1
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Апрель":
        var workDays: Int = 30-8
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Май":
        var workDays: Int = 31-8-1
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Июнь":
        var workDays: Int = 30-8-1
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Июль":
        var workDays: Int = 31-8
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Август":
        var workDays: Int = 31-8
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Сентябрь":
        var workDays: Int = 30-8
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Октябрь":
        var workDays: Int = 31-8
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Ноябрь":
        var workDays: Int = 30-8-1
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
    case "Декабрь":
        var workDays: Int = 31-8
        print("В месяце \(selectedMonth) \(workDays) рабочих дней")
default:
    print("Такого месяца не существует!")
}


//Задание 3
var isHoliday: Bool = Bool.random()
isHoliday == true ? print("Это рабочий день") : print("Это выходной день")


// Задание 4*
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
print(Month.march.discription)
