﻿#language: ru

@tree

Функционал: Проверка Итого количество док. Заказ Поставщикам
Как Тестировщик я хочу проверить
создпние документа Заказ поставщикам  и  Сумму Итого коичество
чтобы проверить, что сумма итого = колличеству номенклатуры в док.

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание док и заполнение количества номенклатуры
И создание документа  Заказ поставщику и заполнение шапки
*первая номенклатура в ТЧ
	И я нажимаю на кнопку с именем 'Добавить'
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита с именем "ЗапасыНоменклатура"
	Тогда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я выбираю текущую строку
	И в таблице "Запасы" я активизирую поле с именем "ЗапасыКоличество"
	И в таблице "Запасы" в поле с именем 'ЗапасыКоличество' я ввожу текст '12,000'
	И в таблице "Запасы" я активизирую поле с именем "ЗапасыЦена"
	И в таблице "Запасы" в поле с именем 'ЗапасыЦена' я ввожу текст '100,00'
	И я запоминаю значение поля "ЗапасыКоличество" таблицы "Запасы" как "Количество1Ном"
	И Я запоминаю значение выражения '?($Количество1Ном$ = "", 0, Число(СтрЗаменить($Количество1Ном$, " ", "")))' в переменную  "Количество1Ном"
	И в таблице "Запасы" я завершаю редактирование строки
*первая номенклатура в ТЧ
	И я нажимаю на кнопку с именем 'Добавить'
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита с именем "ЗапасыНоменклатура"
	Тогда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я перехожу к строке:
		| 'Артикул'   | 'Ед.изм' | 'Наименование'    | 'Остаток' | 'Учетная р.' |
		| '1.191-502' | 'шт'     | 'Bosch BGS 32000' | '1,000'   | '4 861'      |
	И в таблице "СписокЗапасы" я выбираю текущую строку
	И в таблице "Запасы" я активизирую поле с именем "ЗапасыКоличество"
	И в таблице "Запасы" в поле с именем 'ЗапасыКоличество' я ввожу текст '10,000'
	И в таблице "Запасы" я активизирую поле с именем "ЗапасыЦена"
	И в таблице "Запасы" в поле с именем 'ЗапасыЦена' я ввожу текст '10,00'
	И я запоминаю значение поля "ЗапасыКоличество" таблицы "Запасы" как "Количество2Ном"
	И Я запоминаю значение выражения '?($Количество2Ном$ = "", 0, Число(СтрЗаменить($Количество2Ном$, " ", "")))' в переменную  "Количество2Ном"
	И в таблице "Запасы" я завершаю редактирование строки	
		
*Проверка, что колиичество двух номенклатур = сумме Итог Количество
	И выражение внутреннего языка '$Количество2Ном$+$Количество1Ном$ = 10+12' Истинно         
*Проверка, что колиичество при удалении = сумме Итог Количество
	И в таблице "Запасы" я перехожу к строке:
		| 'N' |
		| '2' |
	И в таблице "Запасы" я активизирую поле с именем "ЗапасыНоменклатура"
	И я выбираю пункт контекстного меню с именем 'ЗапасыКонтекстноеМенюУдалить' на элементе формы с именем "Запасы"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
  	И я запоминаю значение поля "ЗапасыКоличество" таблицы "Запасы" как "Количество3Ном"
	И Я запоминаю значение выражения '?($Количество3Ном$ = "", 0, Число(СтрЗаменить($Количество3Ном$, " ", "")))' в переменную  "Количество3Ном"
	И в таблице "Запасы" я завершаю редактирование строки
	И выражение внутреннего языка '$Количество1Ном$ = $Количество3Ном$' Истинно      
	
*Проведение док.
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		
