import Cocoa

let vkData = "19067"
let fbData = "13400"
let instData = "_10045"
let youTubeData = "10$0d00"
let webSiteData = "I0I12"
var succsesSum: Int = 0


// Задача 1

//Механизм force unwrapping
succsesSum = 0
if Int(vkData) != nil {
    succsesSum += Int(vkData)!
    
}
if Int(fbData) != nil {
    succsesSum += Int(fbData)!
    
}
if Int(instData) != nil {
    succsesSum += Int(instData)!
    
}
if Int(youTubeData) != nil {
    succsesSum += Int(youTubeData)!
    
}
if Int(webSiteData) != nil {
    succsesSum += Int(webSiteData)!
    
}
print("Сумма удачно извлеченных значений: ", succsesSum)

//Механизм optional binding
succsesSum = 0
if let data = Int(vkData) {
    succsesSum += data
} else {
    succsesSum += 0
    
}
if let data = Int(fbData) {
    succsesSum += data
} else {
    succsesSum += 0
    
}
if let data = Int(instData) {
    succsesSum += data
} else {
    succsesSum += 0
    
}
if let data = Int(youTubeData) {
    succsesSum += data
} else {
    succsesSum += 0
    
}
if let data = Int(webSiteData) {
    succsesSum += data
} else {
    succsesSum += 0
    
}
print("Сумма удачно извлеченных значений: ", succsesSum)

//Механизм nil coalescing
succsesSum = 0
let data1 = Int(vkData) ?? 0
succsesSum += data1
let data2 = Int(fbData) ?? 0
succsesSum += data2
let data3 = Int(instData) ?? 0
succsesSum += data3
let data4 = Int(youTubeData) ?? 0
succsesSum += data4
let data5 = Int(webSiteData) ?? 0
succsesSum += data5
print("Сумма удачно извлеченных значений: ", succsesSum)


// Задача 2
var isConfirm: Bool = Bool.random()
if let value = Int(vkData) {
    print(isConfirm ? "Ты подтвердил оплату на сумму \(value)" : "Платеж отменен")
} else {
    print("Упс… Нам жаль, что-то пошло не так, попробуйте позже")
}


// Задача 3*
var dataArray = [vkData, fbData, instData, youTubeData, webSiteData]
succsesSum = 0

for item in dataArray {
    if let data = Int(item) {succsesSum += data
    } else {succsesSum += 0}
}
print("Сумма удачно извлеченных значений: ", succsesSum)
