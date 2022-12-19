import Cocoa

// Задание 1

let algoritmOne = { (fuel: Double, distance: Double) -> Double in
    let result = fuel * distance
    return result
}

let algoritmTwo = { (fuel: Double, distance: Double) -> Double in
    let result = fuel * 200 - distance * distance
    return result
}

func oilTank(fuel: Double, distance: Double, actions: (Double, Double) -> Double) {
    let result = actions(fuel, distance)
    print(result)
}

oilTank(fuel: 2000.85, distance: 180.54,actions: algoritmOne)
oilTank(fuel: 2000.85, distance: 180.54,actions: algoritmTwo)


// Задание 2

let shortOne: (Double, Double) -> Double = { $0 * $1 }

let shortTwo: (Double, Double) -> Double = { $0 * 200 - $1 * $1 }

func shortOilTank(_ fuel:Double,_ distance:Double, _ actions: (Double, Double) -> Double) {
    let result = actions(fuel, distance)
    print(result)
}

shortOilTank(2000.85, 180.54, shortOne)
shortOilTank(2000.85, 180.54, shortTwo)

// Задание 3

oilTank(fuel: 2000.85, distance: 180.54, actions: { return $0 / $1 })

/*
func example(param: () -> Void) {
    // ...
}
    
example {
    // ...
}
 
Ключевое слово 'param' в примере исчезло, так как мы вынестли замыкание за вызывающие скобки, этот синтаксис называется trailing closure.
*/
