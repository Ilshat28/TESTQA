﻿#language: ru

@tree

Функционал: Проверка сумм долга в разных источниках


Сценарий: Проверка сумм долга в разных источниках 
*В спраочнике контрагенты
И В командном интерфейсе я выбираю 'Компания' 'Все справочники'
И я нажимаю на кнопку с именем 'СправочникКонтрагентыОткрытьСписок'
И в таблице "Список" я активизирую поле с именем "Взаиморасчеты"
И я запоминаю строку "0" в переменную "Сума"
И Я запоминаю значение выражения '?($Сума$ = "", 0, Число(СтрЗаменить($Сума$, " ", "")))' в переменную  "Сумма" 
И для каждой строки таблицы "Список" я выполняю в обратном порядке
	И я запоминаю значение поля "Долг (+ нам, - мы)" таблицы "Список" как "Сумма15"
	И Я запоминаю значение выражения '?($Сумма15$ = "", 0, Число(СтрЗаменить($Сумма15$, " ", "")))' в переменную  "Сумма2" 
	И я запоминаю значение выражения '$Сумма$+$Сумма2$' в переменную "Сумма"
*В Отчете
Дано Я открываю навигационную ссылку "e1cib/data/Справочник.ВариантыОтчетов?ref=803174d02b7dfd8c11e5514d3d30e072"
Когда открылось окно 'Остатки по взаиморасчетам'
И у поля с именем "СтрокаОтбораРасширеннаяПодсказка" я нажимаю гиперссылку 'СК'
Тогда открылось окно 'Изменение варианта отчета "Остатки по взаиморасчетам"'
И я перехожу к закладке с именем "СтраницаПараметровВывода"
И в таблице "КомпоновщикНастроекНастройкиПараметрыВывода" я перехожу к строке:
	| 'Параметр'                               |
	| 'Расположение общих итогов по вертикали' |
И в таблице "КомпоновщикНастроекНастройкиПараметрыВывода" я выбираю текущую строку
И в таблице "КомпоновщикНастроекНастройкиПараметрыВывода" из выпадающего списка с именем "КомпоновщикНастроекНастройкиПараметрыВыводаЗначение" я выбираю точное значение 'Начало'
И в таблице "КомпоновщикНастроекНастройкиПараметрыВывода" я завершаю редактирование строки
И я нажимаю на кнопку с именем 'ЗавершитьРедактирование'
Тогда открылось окно 'Остатки по взаиморасчетам'
И я нажимаю на кнопку с именем 'Сформировать'
И я запоминаю значение ячейки табличного документа "ОтчетТабличныйДокумент" "R2C4" в переменную "Итог"
И Я запоминаю значение выражения '?($Итог$ = "", 0, Число(СтрЗаменить($Итог$, " ", "")))' в переменную  "Итого" 
И выражение внутреннего языка '$Сумма$ = $Итого$' Истинно


		

		
	
	
	



