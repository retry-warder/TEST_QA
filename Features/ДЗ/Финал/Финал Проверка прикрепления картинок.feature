﻿#language: ru

@tree

Функционал: Проверка возможности прикрепления файла картинки.

Как Администратор я хочу
Проверита возможности прикрепления файла картинки к товару
чтобы можно было посмотреть как выглядит товар 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий 

Сценарий: Прикрепления файла картинки
	И я запоминаю значение выражения '0' в переменную "СуффиксНаименования"	
	И я делаю 5 раз
		И я запоминаю значение выражения '$СуффиксНаименования$ + 1' в переменную "СуффиксНаименования"
		И я запоминаю значение выражения '"_Тест_" + $СуффиксНаименования$'  в переменную "Наименование"
		Если существует элемент справочника "ХранимыеФайлы" с реквизитами Тогда
			| 'Наименование' | '$Наименование$' | 
			и я удаляю запись из таблицы "Справочник.ХранимыеФайлы" с реквизитами
			| 'Наименование' | '$Наименование$' |
		Если существует элемент справочника "Товары" с реквизитами Тогда
			| 'Наименование' | '$Наименование$' | 
			и я удаляю запись из таблицы "Справочник.Товары" с реквизитами
			| 'Наименование' | '$Наименование$' |
		И я запоминаю значение выражения '"e1cib/data/Справочник.Товары?ref=" + СтрЗаменить(Новый УникальныйИдентификатор,"-","")'  в переменную "Тест_УИД"
		И я запоминаю значение выражения '$Наименование$ + " (Товар)"'  в переменную "НаименованиеОкна"
		И я запоминаю значение выражения '$Наименование$ + " (Файл)"'  в переменную "НаименованиеОкнаФайла"
		И я запоминаю значение выражения '$КаталогПроекта$\Picture\$Наименование$.png'  в переменную "ИмяФайла"
		И я проверяю или создаю для справочника "Товары" объекты:
			| 'Ссылка' | 'ПометкаУдаления' | 'ЭтоГруппа' | 'Наименование'   | 'Вид'                    |
			| "$Тест_УИД$"  | 'False'           | 'False'     | "$Наименование$" | 'Enum.ВидыТоваров.Товар' |
		И Я открываю навигационную ссылку "$Тест_УИД$"
		Когда открылось окно '$НаименованиеОкна$'
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		Тогда открылось окно 'Файлы'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Когда открылось окно 'Файл (создание)'
		И в поле с именем 'Наименование' я ввожу текст "$Наименование$"
		И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
		И я выбираю файл "$ИмяФайла$"							
		Когда открылось окно '$НаименованиеОкнаФайла$'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		Тогда открылось окно 'Файлы'
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно '$НаименованиеОкна$ *'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'


