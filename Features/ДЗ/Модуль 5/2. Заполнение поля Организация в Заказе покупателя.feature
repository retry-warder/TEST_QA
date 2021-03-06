#language: ru

@tree

Функционал: ДЗ проверка доступности элементов формы

Как Мастер пользователь я хочу
проверить доступность и отоборажения элементов формы 
чтобы убедиться, что я верно усвоил урок
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий 

Сценарий: ДЗ проверка элементов форм документа Заказ покупателя
И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
Когда открылось окно 'Заказы покупателей'
И я нажимаю на кнопку с именем 'FormCreate'
Тогда открылось окно 'Заказ покупателя (создание)'
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	Тогда открылось окно 'Соглашения'
	И в таблице "List" я перехожу к строке:
		| 'Вид'     | 'Вид взаиморасчетов' | 'Код' | 'Наименование' |
		| 'Обычное' | 'По соглашениям'     | '10'  | 'Test'         |
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
		Если поле с именем "Company" не заполнено Тогда
			Когда открылось окно 'Заказ покупателя (создание) *'
			И я нажимаю кнопку выбора у поля с именем "Company"
			Тогда открылось окно 'Организации'
			И в таблице "List" я перехожу к строке:
				| 'Код' | 'Наименование'           |
				| '2'   | 'Собственная компания 2' |
			И в таблице "List" я активизирую поле с именем "Description"
			И в таблице "List" я выбираю текущую строку
	И Я закрываю окно 'Заказ покупателя (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'


	
	
		
