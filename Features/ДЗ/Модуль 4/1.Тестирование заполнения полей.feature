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
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'         |
		| '10'  | 'Розничный покупатель' |
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	И поле с именем "Partner" заполнено
	И поле с именем "Agreement" заполнено
	И в поле с именем 'Partner' я ввожу текст ''
	И я перехожу к следующему реквизиту
	И элемент формы с именем "LegalName" не доступен
	И Я закрываю окно 'Заказ покупателя (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'



	
	
		
