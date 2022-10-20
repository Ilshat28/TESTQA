﻿#language: ru

@tree
@Документы
@Производство

Функционал: Маркировка ИС МП
Как тестировшик с админскими правами я хочу
Проверить основной алгоритм содания данного документа
чтобы быть уверенным, что товар из документа будет Промаркирован

Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Дано расширение с именем "VAExtension" установлено

Сценарий: Маркировка ИС МП
* Создаю Заказ На Эмиссию Кодов Маркировки
Дано Я открываю навигационную ссылку "e1cib/list/Документ.ЗаказНаЭмиссиюКодовМаркировкиСУЗ"
И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
* Заполняю нужные ревизиты на основном листе
И из выпадающего списка с именем "СпособВыпускаВОборот" я выбираю точное значение 'Производство в РФ'
И из выпадающего списка с именем "ВидПродукции" я выбираю точное значение 'Товары легкой промышленности и одежда'
* Заполняю ТЧ товары  артикулом 112085
И я перехожу к закладке с именем "ГруппаТовары"
И я нажимаю на кнопку с именем 'Добавить'
И в таблице "Товары" я выбираю текущую строку
И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатура"
Тогда открылось окно 'Номенклатура'
И в таблице "СписокСтандартныйПоискНоменклатура" я активизирую поле с именем "СписокСтандартныйПоискНоменклатураНаименование"
Когда открылось окно 'Номенклатура'	
И я выбираю пункт контекстного меню с именем 'СписокСтандартныйПоискНоменклатураКонтекстноеМенюНайти' на элементе формы с именем "СписокСтандартныйПоискНоменклатура"
Тогда открылось окно 'Найти'
И в поле с именем 'Pattern' я ввожу текст '112085'
И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Артикул '	
И пауза 3
И я нажимаю сочетание клавиш "Ctrl+Enter"
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
* Запрашиваю код маркировки и проверяю, что  статус Коды маркировки эмитированы
И у поля с именем "СтатусПредставление" я нажимаю гиперссылку 'запросите коды маркировки'
И я нажимаю на кнопку с именем 'Button0'
И пауза 40
Если элемент формы с именем "СтатусПредставление" стал равен 'Обрабатывается в СУЗ (генерация кодов)' Тогда
	Тогда  я нажимаю на кнопку с именем 'ФормаОбщаяКомандаПротоколОбменаЕГАИС'
	И в таблице "ДеревоФайлов" я нажимаю на кнопку с именем 'ДеревоФайловДеревоФайловВыполнитьОбмен'
	И пауза 100
	И Я закрываю окно 'Протокол обмена с ИС МП'
Иначе 
	И пауза 180
//И элемент формы с именем "СтатусПредставление" стал равен 'Коды маркировки эмитированы'

* Делаю Виртуальную агрегацию
И я нажимаю на кнопку с именем 'ФормаВиртуальнаяАгрегация'
И пауза 7
И в таблице "ОстаткиПродукции" я перехожу к строке:
	| 'Остаток' |
	| '1'       |

Затем клик на картинку "121"
И я нажимаю на кнопку с именем 'СформироватьУпаковки'
И я нажимаю на кнопку с именем 'ФормаГотово'
И я нажимаю на кнопку с именем 'ФормаПечать'
И пауза 10
И в таблице "ДеревоАгрегированныхКодов" я нажимаю на кнопку с именем 'ДеревоАгрегированныхКодовЗаполнить'
И я нажимаю на кнопку с именем 'ФормаВосстановитьЗначения'
И я нажимаю на кнопку с именем 'Load'
И я нажимаю на кнопку с именем 'ФормаВыбрать'
* Вывожу на печать
И в таблице "ДеревоАгрегированныхКодов" я нажимаю на кнопку с именем 'ДеревоАгрегированныхКодовПечать'
И я нажимаю на кнопку с именем 'Button0'
И я нажимаю на кнопку с именем 'КнопкаСохранитьВсеДействия'
И я изменяю флаг с именем 'STZ_ОбрезатьСтраницу'
И в поле с именем 'STZ_ШиринаСтраницы' я ввожу текст '45'
И в поле с именем 'STZ_ВысотаСтраницы' я ввожу текст '30'
//И я нажимаю кнопку выбора у поля с именем "ПапкаДляСохраненияФайлов"
//здесь не сохраняем на комп, нужно загрузить расширение в базу и тогда прописать уже. шаг сохранения файла
И я закрываю все окна клиентского приложения кроме "Печать документа"

*Запоминаю  Код маркировки
И в табличном документе "ТекущаяПечатнаяФорма" я запоминаю адрес ячейки содержащей текст "(01)*"  по шаблону в переменную "Адрес"
И я запоминаю значение ячейки табличного документа "ТекущаяПечатнаяФорма" "$Адрес$" в переменную "КодМаркировки"
И я закрываю все окна клиентского приложения 

*Маркирую товар
Дано Я открываю навигационную ссылку "e1cib/app/Обработка.ПанельОбменИСМП"
И я нажимаю на кнопку с именем 'ОткрытьМаркировкаТоваровИСМП'
И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
И из выпадающего списка с именем "ВидПродукции" я выбираю точное значение 'Товары легкой промышленности и одежда'
И я нажимаю кнопку выбора у поля с именем "ДатаПроизводства"
И Я запоминаю значение выражения 'Строка(ТекущаяДата()+86400)' в переменную 'Дата'
И в поле с именем 'ДатаПроизводства' я ввожу текст '$Дата$'
И я перехожу к закладке с именем "СтраницаТовары"
И я нажимаю на кнопку с именем 'ПоискПоШтрихкоду'
И в поле с именем 'Штрихкод' я ввожу текст '$КодМаркировки$'
И я нажимаю на кнопку с именем 'Готово'
И у поля с именем "СтатусПредставление" я нажимаю гиперссылку 'передайте данные'
И я нажимаю на кнопку с именем 'Button0'
И пауза 10
*Условия разных статусов документа
Если элемент формы с именем "СтатусПредставление" стал равен 'К вводу в оборот (ошибка)' Тогда
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыКодТНВЭД"
	И в таблице "Список" я перехожу к строке:
		| 'Код'        |
		| '6202200000' |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И у поля с именем "СтатусПредставление" я нажимаю гиперссылку 'передайте данные'
	И я нажимаю на кнопку с именем 'Button0'		
Иначе 
	И пауза 180
//И элемент формы с именем "СтатусПредставление" стал равен 'Коды маркировки введены в оборот'

И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна 'Маркировка товаров ИС МП КЭЦБ*' в течение 10 секунд
И я закрываю все окна клиентского приложения 




