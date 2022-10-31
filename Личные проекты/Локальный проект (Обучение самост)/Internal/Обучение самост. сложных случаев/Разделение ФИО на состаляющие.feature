﻿#language: ru

@tree

Функционал: Разделение ФИО на состовляющие


Сценарий: Разделение ФИО на состовляющие
	И я запоминаю строку "Иванов Иван Иванович" в переменную "СтрокаФИО"
	И Я запоминаю значение выражения 'СтрРазделить($СтрокаФИО$, " ")' в переменную "МассивФИО"

	И я запоминаю строку "0" в переменную "Итератор"
	И я запоминаю строку "" в переменную "ИтоговоеФИО"
	И для каждого значения "ЧастьФИО" из таблицы в памяти "МассивФИО"
		Если 'Число($Итератор$) < 2' Тогда
			Тогда Я запоминаю значение выражения '$ИтоговоеФИО$ + $ЧастьФИО$' в переменную "ИтоговоеФИО"
			И Я запоминаю значение выражения 'Число($Итератор$ + Число(1))' в переменную "Итератор"
			Если 'Число($Итератор$) < 2' Тогда
				Тогда Я запоминаю значение выражения '$ИтоговоеФИО$ + " "' в переменную "ИтоговоеФИО"
	
	И я выполняю код встроенного языка
	|'Сообщить("$ИтоговоеФИО$")'|