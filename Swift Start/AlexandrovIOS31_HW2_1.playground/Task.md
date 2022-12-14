История:

Вы – начинающий разработчик. Отдел бухгалтерии попросил сделать программу, которая в зависимости от выбранного месяца показывает количество рабочих дней.

Вводные данные: договоримся, что в каждом месяце всегда будет 8 выходных дней.
Для конкретных месяцев есть следующие допущения по выходным:
Январь дополнительно 8 выходных дней;
Февраль - дополнительно 1 день;
Март - дополнительно 1 день;
Май - дополнительно 1 день;
Июнь - дополнительно 1 день;
Ноябрь - дополнительно 1 день.

Задача 1

Использование конструкции if.
Первое, что вы решили попробовать, – реализовать задание через конструкцию if else.

Алгоритм выполнения задания с использованием конструкции if

Создайте 12 констант. Каждая константа содержит имя одного из месяцев, имена месяцев в константе пишутся на английском языке. Результат можно писать на любом языке, например:
let january = "Январь"
или
let january = "Січень"
или
let january = "January"
Создайте переменную selectedMonth, в нее вы будете передавать один из месяцев для проверки условия и выведения информации для бухгалтерии.
Создайте конструкцию if, которая будет проверять selectedMonth. В зависимости от того, какой месяц подставили в эту переменную, будет выводится информация о количестве рабочих дней в этом месяце.
Примечание: для того, чтобы проверить условие, можно воспользоваться оператором сравнения == (если selectedMonth содержит Январь, выводим информацию про этот месяц.)
Важно!

Проверка if должна проверять все месяцы в одной конструкции, схематично это будет выглядеть так:

if условие№1 {
    print(ответ для условия 1)
} else if условие№2 {
    print(ответ для условия 2)
}
У вас должна получиться одна конструкция содержащая варианты ответа для 12-и месяцев.
4. Ожидаемый результат – выведение в консоль информацию о количестве рабочих дней в месяце, например:

В январе 16 рабочих дней
Задача 2

Использование конструкции switch.
При реализации первого задания у вас получилась довольно большая конструкция. Увидев это, вы принимаете решение использовать конструкцию switch вместо if else для выполнения задания.

Алгоритм выполнения задания с использованием конструкции switch

У вас уже есть переменная, которая принимает месяц (selectedMonth) и 12 месяцев. Заново переменные создавать не нужно.
Создайте конструкцию switch. Проверяемый параметр – это selectedMonth. Конструкция switch должна содержать 12 кейсов, каждый кейс будет соответствовать своему месяцу.
Важно! Проверка switch должна обрабатывать все месяцы в одной конструкции, схематично это будет выглядеть так:
switch selectedMonth {
    case имяМесяца:
        print(ответ для первого месяца)
}
Ожидаемый результат – выведение в консоль информацию о количестве рабочих дней в месяце.
Задача 3

Использование тернарного оператора.
Еще до сдачи работы вам пришел запрос от бухгалтерии на дополнительную разработку.
Вам необходимо в зависимости от того выходной или рабочий день выводить в консоль запись:
Это рабочий день или Это выходной день.

В бухгалтерской программе каждый день помечен свойством isHoliday - тип Bool. Необходимо выводить соответствующую запись, когда это свойство true и false.

Алгоритм выполнения задания с использованием тернарного оператора

Создайте переменную isHoliday и передайте в нее любое значение true или false.
Создайте простую конструкцию тернарного оператора, которая будет выводить на печать информацию, какой это день.
Ожидаемый результат – выведение в консоль информацию о типе дня.
Схематично это будет выглядеть так:
условие1 ? (вариант ответа1) : (вариант ответа2)

Задача 4* (со звездочкой)

Ваши первый и второй вариант задачи проверил руководитель и предложил 12 переменных вынести в перечисление (enum) и сделать вычисляемое свойство перечисления, используя конструкцию switch.

Алгоритм выполнения задания со звездочкой

Материал для дополнительного изучения, чтобы выполнить задание со звездочкой:
https://swiftbook.ru/content/languageguide/enumerations/
https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
https://swiftbook.ru/content/languageguide/properties/
https://docs.swift.org/swift-book/LanguageGuide/Properties.html https://metanit.com/swift/tutorial/3.8.php

После изучения дополнительного материала создайте перечисление, содержащее 12 кейсов с именами месяцев.

Создайте в теле перечисления вычисляемое свойство description, в котором будет происходить преобразование кейсов в String значения.

Распечатайте один любой месяц, используя перечисление.

Подсказка
Схематично это будет выглядеть так:

enum Month {
   case january
   ...

   var description: String { 
        switch self { 
             case .january: return "Январь"
	    }
   }
} 
