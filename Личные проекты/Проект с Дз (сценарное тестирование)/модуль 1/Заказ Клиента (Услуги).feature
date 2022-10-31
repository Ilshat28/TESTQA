﻿#language: ru

@tree

Функционал: добавлении Услуги в документ Заказ (подсистема Продажи) с добавлением  некоторого количества услуг

Как Тестировщик я хочу
создпние документа Заказ с добавлением  некоторого количества услуг
чтобы проверить, что документ проводится 
Контекст : 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: <описание сценария>
*Путь к документу
И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
Тогда открылось окно 'Заказы покупателей'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Заказ покупателя (создание)'
*Заполнение обязательных реквезитов	
И я нажимаю кнопку выбора у поля с именем "Контрагент"
Тогда открылось окно 'Контрагенты: Покупатели'
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Заказ покупателя (создание) *'
И в табличном документе 'ТаблицаДляПросмотра' я перехожу к ячейке "R1C1"
И я нажимаю кнопку выбора у поля с именем "ДатаОтгрузки"
И в поле с именем 'ДатаОтгрузки' я ввожу текст '17.05.2022'
*Заполнение ТЧ	
И я нажимаю на кнопку с именем 'ЗапасыДобавить'
И в таблице "Запасы" я нажимаю кнопку выбора у реквизита с именем "ЗапасыНоменклатура"
Тогда открылось окно 'Номенклатура'
И в таблице "СписокЗапасы" я перехожу к строке :
	| 'Наименование' |         
	| 'Доставка Почтой РОСИИ'| 

И в таблице "СписокЗапасы" я выбираю текущую строку
Тогда открылось окно 'Заказ покупателя (создание) *'
И в таблице "Запасы" я активизирую поле с именем "ЗапасыКоличество"
И в таблице "Запасы" в поле с именем 'ЗапасыКоличество' я ввожу текст '4,000' 
// Здесь можно ввести любое значение
И в таблице "Запасы" я завершаю редактирование строки
*Проверка, что количество ввелось 
И я запоминаю значение поля "ЗапасыКоличество" таблицы "Запасы" как "$Количество$"
Тогда таблица "Запасы" стала равной:
	| 'Количество' |
	| '$Количество$'      |
*Проведение Документа
И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна 'Заказ покупателя (создание) *' в течение 20 секунд
