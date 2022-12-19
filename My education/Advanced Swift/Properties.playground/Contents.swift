/*
 менеджер по продажам
 
 звонков не менее 130
 план продаж не менее 300000
 за каждый звонок 50р
 +12% от продаж
 - штрафы
 */

class SalesManager {
    
    // СВОЙСТВА ТИПА
    // Хранимые (статическик) - не могут наследоваться
    static var phoneModel = "iPhone SE 2"
    
    // Вычисляемые(классовые) - могут наследоваться
    class var companyTitle: String { return "MADI.SPACE" }
    
    // СВОЙСТВА ЭКЗЕМПЛЯРА
    // Хранимые свойства (stored properties)
    var salaryBase = 15000
    var calls = 0 {
        // Отрабатывает перед тем как новое значение salesAmount будет установлено
        willSet {
            print("Вы совершили \(newValue) звонков. Предыдущее значение \(calls)")
        }
        // Отрабатывает когда новое значение уже установлено
        didSet {
            if calls >= 130 {
                print("KPI по звонкам выполнен! Количество звонков: \(calls)")
            }
        }
    }
    var salesAmount = 0 {
        // Отрабатывает перед тем как новое значение salesAmount будет установлено
        willSet {
            print("Вы продали товара на \(newValue) рублей. Предыдущее значение \(salesAmount)")
        }
        // Отрабатывает когда новое значение уже установлено
        didSet {
            if salesAmount >= 300000 {
                print("KPI по продажам выполнен! Сумма продаж: \(salesAmount)")
            }
        }
    }
    var sanctionsAmount = 0
    
    // "Ленивые свойсва" - что-то массивное
    lazy var userAva = "Some pic"
    
    // Вычисляемые свойства (computed properties)
    var motivation: Int {
        if calls >= 130 && salesAmount >= 300000 {
            let motiv = self.calls * 50 +
            (salesAmount * 12 / 100)
            return motiv
        } else {
            return 0
        }
    }
    
    var salary: Int {
        var result = salaryBase + motivation - sanctionsAmount
        guard result >= salaryBase / 2 else {
            result = salaryBase / 2
            return result
        }
        return result
    }
}

let fedya = SalesManager()
// lazy свойство nil - к нему не обращались!

fedya.motivation
fedya.salaryBase
fedya.salary

SalesManager.phoneModel
SalesManager.phoneModel = "iPhone XR"
SalesManager.phoneModel

fedya.userAva
// Появилось lazy свойство!!
fedya
fedya.salesAmount = 30000
fedya.salesAmount += 400000
fedya.calls = 40
fedya.calls = 100
