﻿#language: ru

@tree

Функционал: Проверка заполнения поля Организации в док. Заказ Покупателя если не указано в соглашении

Как Тестировшик я хочу
проверить заполнения поля Организации в док. Заказ Покупателя
чтобы  

Сценарий: Проверка заполнения поля Организации в док. Заказ Покупателя
*Создаю Заказ покупателя и ввожу соглашения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
*Проверка на заполнение поля "организации"
	Если элемент формы с именем "Company" имеет значение по шаблону "*" тогда
	Когда открылось окно 'Заказ покупателя (создание) *'		
	Иначе
		И я нажимаю кнопку выбора у поля с именем "Company"
		Тогда открылось окно 'Организации'
		И я нажимаю на кнопку с именем 'FormChoose'
		
		


			
		

	

	