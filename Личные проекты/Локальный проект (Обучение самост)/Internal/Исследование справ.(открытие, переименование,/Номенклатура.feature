﻿#language: ru

@tree

Функционал: Проверка текущего справочника( открытие, переименование нужных полей, отчеты, печ.формы, другое)
Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Как Админ я хочу
проверить установку цены из справочника и загрузку фото
чтобы найти всевозможные баги 

Сценарий: Исследования справочника : Номенклатура
Дано Я открываю навигационную ссылку "e1cib/list/Справочник.Номенклатура"
И в таблице "СписокЗапасы" я выбираю текущую строку
И я запоминаю значение поля "Наименование" как "Наимен"
И В текущем окне я нажимаю кнопку командного интерфейса 'Цены'
И в таблице "Список" я перехожу к строке:
	| 'Вид цен'   |
	| 'Розничная' |
И в таблице "Список" я выбираю текущую строку
И в поле с именем 'Цена' я ввожу текст '1 000,00'
И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
И я жду закрытия окна 'Цена номенклатуры *' в течение 5 секунд
И элемент формы с именем "ДинамикаИзмененияЦены" доступен

И В текущем окне я нажимаю кнопку командного интерфейса 'Файлы'
И таблица "Список" содержит строки:
	| 'Наименование'     |
	| '$Наимен$' |

И я закрываю все окна клиентского приложения














