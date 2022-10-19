﻿#language: ru

@tree
@Маркинг
@Отчеты

Функционал: Отчет показывает КМ в остатках магазина Цветной
Как тестировшик с админскими правами я хочу
Проверить основной функционал отчета
чтобы быть уверенным, что отчет работает корректно
Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка  отчета учет КМ на магазине Цветной
*Формируем отчет                                
	Дано Я открываю навигационную ссылку "e1cib/data/Справочник.ВариантыОтчетов?ref=a0ae005056010f7f11ececfb2469266c"
	Когда открылось окно 'STZУчетКМнаМагазинеЦветной'
	И я нажимаю на кнопку с именем 'СформироватьОтчет'
*Проверяем, что отчет сворачивается и разворачивается по группам
	И я жду когда в табличном документе "ОтчетТабличныйДокумент" заполнится ячейка "R6C1" в течение 20 секунд		
	И я нажимаю на кнопку с именем 'СвернутьВсеГруппы'
	И в табличном документе "ОтчетТабличныйДокумент" я перехожу к ячейке содержащей текст "Товары легкой промышленности и одежда" по шаблону
	И я нажимаю на кнопку с именем 'РазвернутьВсеГруппы'
	И я запоминаю значение ячейки табличного документа "ОтчетТабличныйДокумент" "R6C1" в переменную "Артикул"
	И я запоминаю значение ячейки табличного документа "ОтчетТабличныйДокумент" "R20C1" в переменную "Артикул2"
	И я запоминаю значение ячейки табличного документа "ОтчетТабличныйДокумент" "R6C3" в переменную "Хар"
							
*Проверяем, что в отчете можно искать понаменклатурно
	И я изменяю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Использование'
	И в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Значение' я ввожу текст '$Артикул$'
	И я нажимаю на кнопку с именем 'СформироватьОтчет'
*Проверяем, что в отчете можно искать понаменклатурно и по характер
	И я устанавливаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Использование'
	И в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Значение' я ввожу текст '$Хар$'
	И я нажимаю на кнопку с именем 'СформироватьОтчет'
*Проверяем, что в отчете можно проваливаться в документ и спецификацию
	И в табличном документе 'ОтчетТабличныйДокумент' я перехожу к ячейке "R7C5"
	И пауза 5
	И в табличном документе 'ОтчетТабличныйДокумент' я делаю двойной клик на текущей ячейке
	Тогда открылось окно '*'
	И я перехожу к закладке с именем "ГруппаТовары"
	И в таблице "Товары" я перехожу к строке:
		| 'Характеристика' |
		| '$Хар$'             |
	И в таблице "Товары" я активизирую поле с именем "ТоварыНоменклатура"
	И Я закрываю окно 'Реализация товаров и услуг*'
	И в табличном документе 'ОтчетТабличныйДокумент' я перехожу к ячейке "R7C4"
	И в табличном документе 'ОтчетТабличныйДокумент' я делаю двойной клик на текущей ячейке
	И Я закрываю окно '*(Штрихкоды упаковок и товаров)*'	
	И я снимаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Использование'
	И я снимаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Использование'
	И я нажимаю на кнопку с именем 'СформироватьОтчет'
	Когда открылось окно 'STZУчетКМнаМагазинеЦветной'
*Проверяем,что в отчете можем искать несколько наменклатур
	И я нажимаю на кнопку с именем 'ВсеНастройки'
	Тогда открылось окно 'Настройки отчета "STZУчетКМнаМагазинеЦветной"'
	И я меняю значение переключателя с именем 'РасширенныйРежим' на 'Расширенный'
	И в таблице "Отборы" я перехожу к строке:
		| 'Поле'    |
		| 'Артикул' |
	И в таблице "Отборы" я активизирую поле с именем "ОтборыВидСравнения"
	И в таблице "Отборы" я выбираю текущую строку
	И в таблице "Отборы" из выпадающего списка с именем "ОтборыВидСравнения" я выбираю точное значение 'В списке'
	И в таблице "Отборы" я активизирую поле с именем "ОтборыПравоеЗначение"
	И в таблице "Отборы" я нажимаю кнопку выбора у реквизита с именем "ОтборыПравоеЗначение"
	И я нажимаю на кнопку с именем 'СписокДобавить'
	И в таблице "Список" в поле с именем 'СписокЗначение' я ввожу текст '$Артикул2$'
	И в таблице "Список" я устанавливаю флаг с именем 'СписокПометка'
	И в таблице "Список" я завершаю редактирование строки
		
	И я нажимаю на кнопку с именем 'КомандаОК'
	Тогда открылось окно 'Настройки отчета "STZУчетКМнаМагазинеЦветной"'
	И в таблице "Отборы" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ЗакрытьИСформировать'
	И пауза 10
	И я закрываю все окна клиентского приложения
	
	
		


		
		

		
			
		
