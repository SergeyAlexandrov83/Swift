1. Создать класс Клиент Банка. Задать ему свойства Наименование, баланс счёта, e-mail, телефон. Клиентами банка могут быть как физические, так и юридические лица. Создайте инициализатор, который принимает наименование клиента целиком и контактные данные. Баланс счёта в этом случае должен быть равен 0. Создайте «удобные» инициализаторы, которые принимают либо Фамилию, имя, отчество для физ. лиц, либо форму собственности (ООО, ПАО, АО) для юридических лиц, а также начальный баланс счёта клиента. Проинициализируйте класс. Создайте три экземпляра класса, используя разные инициализаторы. Добавьте их в массив Клиенты Банка. 

 2. Создайте класс Программист, объявите целочисленное свойство - опыт в годах, строковое свойство Специализация и строковое свойство - Квалификация. Создайте инициализатор, который принимает в себя опыт в годах и специализацию. Квалификация определяется в инициализаторе следующим образом: Стажёр 0-1 год, Junior 1-3 года, Middle - 3-5 лет, Senior - от 5 лет.  

 3. Создать класс Круг с хранимым свойством Радиус. Добавить ему вычисляемые свойства - длина окружности и площадь круга. Добавить метод "Вытянуть в цилиндр", который принимает высоту цилиндра и возвращает объем цилиндра 

 4. Создать класс Кофе-машина 
Определить хранимые свойства:
 ⁃ Марка (константа)
 ⁃ Мощность (константа)
 ⁃ Гарантированный ресурс (в кружках кофе, константа, приватная)
 ⁃ Выработанный ресурс (в кружках кофе переменная, приватная)
Определить вычисляемое свойство - остаток ресурса (Гарантированный минус выработанный)
Определить методы, отвечающие за кипячение воды и за подсчёт количества приготовленных кружек кофе. Первый принтит в консоль «Вода горячая», а второй добавляет к выработанному ресурсу +1  и выводит в консоль сообщение типа «Вы приготовили 15 из 300 гарантированных кружек кофе». Если кружек больше 300, тогда метод выдаэт предупреждение, что нужно обслуживание кофе-машины
Определить метод, отвечающий за процесс приготовления кофе, который включает в себя вызов двух методов, описанных выше, и принт «Ваш кофе готов!»
Определить метод обслуживания кофе-машины, который обнуляет гарантированный счётчик
