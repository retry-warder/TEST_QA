#language: ru

@tree

Функционал: Создание документа заказ проверка заполнения суммы ТЧ

Как Менеджер по продажам я хочу
Создание Заказа
чтобы оформить заказ на Товар 
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий 
Сценарий: Создание документа на заказ услуги
*Открытие формы документа
	Когда В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'

	И Заполнение шапки заказа

*Заполнение ТЧ товары
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Йогурт'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И в таблице "Товары" я завершаю редактирование строки
	И я запоминаю значение поля "ТоварыТовар" таблицы "Товары" как "$ТоварыТовар$"
*Проверка рассчета суммы в строке табличной части
		И я запоминаю значение поля "ТоварыКоличество" таблицы "Товары" как "$ТоварыКоличество$"
		И я запоминаю значение поля "ТоварыЦена" таблицы "Товары" как "$ТоварыЦена$"	
		И я запоминаю значение поля "ТоварыСумма" таблицы "Товары" как "$ТоварыСумма$"	
		И Я запоминаю значение выражения 'Число($ТоварыСумма$)' в переменную "$ЧислоТоварыСумма$"
		И выражение внутреннего языка '$ТоварыКоличество$*$ТоварыЦена$=$ЧислоТоварыСумма$' Истинно
*Проверка суммы в табличной части
	И для каждой строки таблицы "Товары" я выполняю
		И я запоминаю значение поля "ТоварыКоличество" таблицы "Товары" как "$ТоварыКоличество$"
		И я запоминаю значение поля "ТоварыЦена" таблицы "Товары" как "$ТоварыЦена$"	
		И я запоминаю значение поля "ТоварыСумма" таблицы "Товары" как "$ТоварыСумма$"	
		И Я запоминаю значение выражения 'Число($ТоварыСумма$)' в переменную "$ЧислоТоварыСумма$"
		И выражение внутреннего языка '$ТоварыКоличество$*$ТоварыЦена$=$ЧислоТоварыСумма$' Истинно		
	И Проверка расчета итогового количества товаров по документу
*Номер
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля "Номер" как "$Номер$"
*Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание)" в течение 20 секунд
*Проверка создания документа
	И таблица "Список" содержит строки:
		|'Номер'|
		|"$Номер$"|
	

