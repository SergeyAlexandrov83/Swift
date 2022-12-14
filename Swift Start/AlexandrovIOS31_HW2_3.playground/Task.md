История:

Вы продолжаете работать начинающим разработчиком, в этот раз вам приходит задание обработать статистику получаемую с 5 разных сайтов.

Исходные данные:

let vkData = "19067"
let fbData = "13400"
let instData = "_10045"
let youTubeData = "10$0d00"
let webSiteData = "I0I12"
Пояснение к полученным данным:

Статистика с сайтов приходит в виде строки, содержащей цифры о количестве посетителей за выбранный период времени.
Так как данные приходят из сети, мог произойти сбой – вместе с цифрами могли поступить буквы или символы, такие данные считаются испорченными.
В реальной жизни вы не можете заранее знать, какие именно данные, с какого сайта поступили, поэтому необходимо каждую строку с данными проверить в отдельности, и только если данные были успешно считаны, вы сможете объединить их в единую статистическую информацию.

Задача 1

Тремя разными способами получите сумму удачно извлеченных значений из полученной статистики.

Алгоритм выполнения

Чтобы посчитать сумму, вам необходимо преобразовать строку в целочисленное значение типа данных Int(). Преобразование можно делать сразу в конструкции извлечения опционального значения.
Создайте переменную, в которую сможете в будущем записать сумму удачно извлеченных значений.
Решите это задание тремя способами: nil-coalescing, optional binding и forced unwrapping.
Важно: каждый способ должен проверить каждое из значений в отдельности.
У вас получится 15 проверок и 3 результата. Итоговые суммы должны совпадать.
Задача № 2

Ваше следующее задание – выведение информации пользователю после получения данных с сайта на оплату счета.
В зависимости от того, удалось считать данные (извлечь опциональное значение) и подтвердил ли пользователь обработку данных (true или false), необходимо вывести разный текст в консоль.

Алгоритм выполнения

Создайте переменную типа Bool, которая будет содержать ответ пользователя (например, isConfirm) и присвойте значение true или false.
Возьмите одну из констант из первой задачи (создавать заново необязательно, достаточно использовать уже созданное значение), например Int(vkData). Используя безопасное извлечение опционала с конструкцией if let, попробуйте извлечь опциональное значение, чтобы получить число.
Если значение удалось извлечь в области видимости if let, делаете проверку свойства isConfirm.
a. В случае true необходимо вывести в консоль текст: "Ты подтвердил оплату на сумму (необходимо подставить извлеченное значение)"
b. Если будет false, то вывести "Платеж отменен".
c. Если значение не удалось извлечь, то например, в случае с instData, необходимо вывести сообщение - "Упс… Нам жаль, что-то пошло не так, попробуйте позже".
Для тестирования своего решения попробуйте различные варианты входных данных. Вам как разработчикам важно сдать полностью работающую программу, учитывающую все приведенные исходы для пользователя.
Задача 3* (со звездочкой)

Ваше первое задание проверил ваш руководитель и попросил доработать ваше решение. Вам придется использовать массив, обход массива в цикле и безопасное извлечение с конструкцией if let.

Алгоритм выполнения

Посмотрите материалы для дополнительного изучения:
https://swiftbook.ru/content/languageguide/collection-types/ - все, что касается массива
https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html - раздел Array
https://swiftbook.ru/content/languageguide/control-flow/ - раздел про циклы For-in
https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html - раздел For-In Loops
Создайте новую переменную, к которой будете прибавлять удачно извлеченные значения.
Константы из первой задачи перенесите в массив.
Пройдитесь циклом по массиву, каждые элемент массива приведите к числу и попытайтесь извлечь опционал.
В случае успешного извлечения добавляете значение к общей сумме.
У вас должен получиться такой же результат как и в первой задаче.
