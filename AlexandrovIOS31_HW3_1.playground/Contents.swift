import Cocoa

// Задание 1:
var boys: [String] = ["Sergey", "Vadim"]
var girls: [String] = ["Olga", "Marina", "Svetlana"]
var students: [String] = girls
for student in boys {
    students.insert(student, at: 0)
}
print("Список студентов: \(students)")


// Задание 2:
students.sort()
print("Список студентов в алфавитном порядке: \(students)")


// Задание 3:
var A: [Int] = [5, 3, 1, 4, -2, -4, 2, -1, 0]
A.sort(by: {$1 < $0})
var filtredA = A.filter({$0 > 0})
print("Отфильтрованный список: \(filtredA)")


// Задание 4*:
var nums: [Int] = [1, 2, 3, 4, 7, 8, 15]
var key: Int = 6

// Вариант решения №1: Не оптимальный
print("Вриант решения №1")
for indexFirst in 0 ..< nums.count {
    for indexSecond in (indexFirst + 1) ..< nums.count {
        if (nums[indexFirst] + nums[indexSecond]) == key {
            print("Числа с индексом \(indexFirst) (Число: \(nums[indexFirst])) и индексом \(indexSecond) (Число: \(nums[indexSecond])) в сумме дают искомое число: \(key)")
        }
    }
}

// Вариант решения №2: Оптимальный, но требует сортировки массива, если он не отсортирован изначально
// Если необходимо вывести все пары чисел, а не только первое попавшееся - убираем break
print("Вриант решения №2")
//nums.sort(by: {$0 < $1})
var leftIndex: Int = 0
var rightIndex: Int = nums.count - 1
while leftIndex < rightIndex {
    var sum: Int = nums[leftIndex] + nums[rightIndex]
    if sum == key {
        print("Числа с индексом \(leftIndex) (Число: \(nums[leftIndex])) и индексом \(rightIndex) (Число: \(nums[rightIndex])) в сумме дают искомое число: \(key)")
        break
    }
    if sum < key {
        leftIndex += 1
    } else {
        rightIndex -= 1
    }
}

