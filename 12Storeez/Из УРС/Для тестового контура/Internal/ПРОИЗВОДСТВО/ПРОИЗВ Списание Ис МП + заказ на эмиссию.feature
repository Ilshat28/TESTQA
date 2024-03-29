﻿#language: ru

@tree
@Документы
@Производство

Функционал: Списание кодов маркировки ИС МП
Как тестировшик с админскими правами я хочу
Проверить основной алгоритм содания данного документа
чтобы быть уверенным, что товар из документа будет списан
Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Дано расширение с именем "VAExtension" установлено
Сценарий: Проверка док. Списание кодов маркировки ИС МП
// Перед основным действием нужно создать заказ на эмиссию
*Заказ на эмиссию
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.ЗаказНаЭмиссиюКодовМаркировкиСУЗ"
	И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
	И из выпадающего списка с именем "СпособВыпускаВОборот" я выбираю точное значение 'Производство в РФ'
	И из выпадающего списка с именем "ВидПродукции" я выбираю точное значение 'Товары легкой промышленности и одежда'
	И я перехожу к закладке с именем "ГруппаТовары"
	И я нажимаю на кнопку с именем 'Добавить'
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатура"
	Тогда открылось окно 'Номенклатура'
	И в таблице "СписокСтандартныйПоискНоменклатура" я активизирую поле с именем "СписокСтандартныйПоискНоменклатураНаименование"

	И в таблице "СписокСтандартныйПоискНоменклатура" я перехожу к строке:
		| 'Артикул ' |
		| '102285'   |
	И в таблице "СписокСтандартныйПоискНоменклатура" я выбираю текущую строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыХарактеристика"
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыХарактеристика"
	Тогда открылось окно 'Характеристики номенклатуры'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'S'            |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличествоУпаковок' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыШаблон"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" из выпадающего списка с именем "ТоварыШаблон" я выбираю точное значение 'Единица товара'
	И в таблице "Товары" я активизирую поле с именем "ТоварыGTIN"
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыGTIN"
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ЗаполнитьДоступныеGTIN'
	И у поля с именем "СтатусПредставление" я нажимаю гиперссылку 'запросите коды маркировки'
	И я нажимаю на кнопку с именем 'Button0'
	И пауза 300
	Тогда элемент формы с именем "СтатусПредставление" стал равен 'Коды маркировки эмитированы'
	И я нажимаю на кнопку с именем 'ФормаВиртуальнаяАгрегация'
	И пауза 5
	И в таблице "ОстаткиПродукции" я перехожу к строке:
		| 'Номенклатура'                        | 'Остаток' |
		| 'Блуза BB-BL-0002-02-0220 (Молочный)' | '1'       |
	И я нажимаю на кнопку с именем 'ДобавитьВСоставУпаковки'
	И я нажимаю на кнопку с именем 'СформироватьУпаковки'
	И я нажимаю на кнопку с именем 'ФормаГотово'
	И я нажимаю на кнопку с именем 'ФормаПечать'
	И пауза 10
	И в таблице "ДеревоАгрегированныхКодов" я нажимаю на кнопку с именем 'ДеревоАгрегированныхКодовЗаполнить'
	И я нажимаю на кнопку с именем 'ФормаВосстановитьЗначения'
	И я нажимаю на кнопку с именем 'Load'
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И в таблице "ДеревоАгрегированныхКодов" я нажимаю на кнопку с именем 'ДеревоАгрегированныхКодовПечать'
	И я нажимаю на кнопку с именем 'Button0'
	И я нажимаю на кнопку с именем 'КнопкаСохранитьВсеДействия'
	И я изменяю флаг с именем 'STZ_ОбрезатьСтраницу'
	И в поле с именем 'STZ_ШиринаСтраницы' я ввожу текст '45'
	И в поле с именем 'STZ_ВысотаСтраницы' я ввожу текст '30'
	//здесь не сохраняем на комп, нужно загрузить расширение в базу и тогда прописать уже. шаг сохранения файла
	И я закрываю все окна клиентского приложения кроме "Печать документа"

*Запоминаю  Код маркировки
	И в табличном документе "ТекущаяПечатнаяФорма" я запоминаю адрес ячейки содержащей текст "(01)*"  по шаблону в переменную "Адрес"
	И я запоминаю значение ячейки табличного документа "ТекущаяПечатнаяФорма" "$Адрес$" в переменную "КодМаркировки"
	И Я закрываю окно 'Печать документа'
*Списание ИС МП
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.СписаниеКодовМаркировкиИСМП"
	И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
	Тогда открылось окно 'Списание кодов маркировки ИС МП (создание)'
	И я перехожу к закладке с именем "СтраницаТовары"
	И я нажимаю на кнопку с именем 'ТоварыЗагрузитьИзВнешнегоФайла'
	Тогда открылось окно 'Загрузка кодов маркировки'
	И в табличном документе 'ТабличныйДокумент' я перехожу к ячейке "R5C1"
	И в табличный документ "ТабличныйДокумент" я ввожу текст "$КодМаркировки$"   
	И я нажимаю на кнопку с именем 'ФормаГотово'

	И я закрываю все окна клиентского приложения
		
	
