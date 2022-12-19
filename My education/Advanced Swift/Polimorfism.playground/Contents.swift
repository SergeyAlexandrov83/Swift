// Полиморфизм - это способность классов-наследников переопределять свойства, методы и инициализаторы классов-родителей.

class Teacher {
    let name: String
    var description: String {
        return "Привет! Меня зовут \(name). Я - учитель."
    }
    
    init(name: String) {
        self.name = name
    }
    
    func teach() {
        print("Я учу людей прямо сейчас!")
    }
}

class IOSTeacher: Teacher {
    
    let speciality: String
    // Переопределение свойства
    override var description: String {
        return "Привет! Меня зовут \(name). Я учитель по IOS разработке! Моя специальность \(speciality)"
    }
    
    init(name: String, speciality: String) {
        self.speciality = speciality
        super.init(name: name)
    }
    // Переопределение инициализатора
    override init(name: String) {
        self.speciality = "Frontend"
        super.init(name: name)
    }
    
    func swiftCoding() {
        print("Я прогаю на Swift!")
    }
    // Переопределение
    override func teach() {
        print("Я учу людей iOS-разработке прямо сейчас!")
    }
    // Перегрузка функции
    func teach(hours: Int) {
        print("Я учу людей \(hours) часов")
    }
    
}

let teacer = Teacher(name: "Федя")
teacer.name
teacer.description
teacer.teach()

let iOSTeacher = IOSTeacher(name: "Влад", speciality: "Front")
iOSTeacher.speciality
iOSTeacher.name
iOSTeacher.teach()
iOSTeacher.swiftCoding()
iOSTeacher.description

let iOSTeacher2 = IOSTeacher(name: "Андрей")
iOSTeacher2.speciality
iOSTeacher2.description

iOSTeacher.teach()

iOSTeacher.teach(hours: 12)
