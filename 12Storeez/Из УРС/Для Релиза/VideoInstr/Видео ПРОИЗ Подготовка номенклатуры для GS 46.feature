﻿#language: ru

@tree
@ВидеоИнструкция
Функционал:  Подготовка номенклатуры для GS 46

Сценарий: ПРОИЗ Подготовка номенклатуры для GS 46

#[autodoc.ignorestep]
	И я активизирую TestClient "Этот клиен"
* Привет Один эс ! Подскажи пожалуйста, Как пользоваться обработкой  Подготовка номенклатуры для Джей Эс 46
	@YandexTTS: voice=filipp; speed=1.2
	И Пауза 1
* Привет! Давай покажу.Сначало нужно зайти в эту обработку
	И Пауза 1
* Для этого заходим в базу Производства и нажимаем на вкладку слева ПРОИЗВОДСТВО
	Когда В панели разделов я выбираю 'Производство'	
* Далее нажимаем на эту обработку в разделе Сервис
	И В панели функций я выбираю '12St: Подготовка номенклатуры для GS46'			
	И пауза 1
* Сначало нужно настроить обработку	. Для этого переходим на вкладку Настройка формирования
	И я перехожу к закладке с именем "ГруппаНастройки"
* Далее заполняем как в примере
	И пауза 1
    И из выпадающего списка с именем "НП_Организация" я выбираю точное значение 'КЭТ ООО'
	И в поле с именем 'НП_GLNПредприятия' я ввожу текст '4680046349996'
	И в поле с именем 'НП_Бренд' я ввожу текст '12storeez'
	И из выпадающего списка с именем "НП_ТипПоставщика" я выбираю точное значение 'Производитель <1>'
	И из выпадающего списка с именем "НП_ТипУпаковки" я выбираю точное значение 'ПАКЕТ БЕЗ ФОРМЫ <PO>'
	И из выпадающего списка с именем "НП_МатериалУпаковки" я выбираю точное значение 'ПОЛИЭТИЛЕН (PE) <80>'
	И в поле с именем 'НП_Количество' я ввожу текст '1'
	И из выпадающего списка с именем "НП_ЕдиницаИзмерения" я выбираю точное значение 'ШТ <PCE>'
	И я нажимаю кнопку выбора у поля с именем "НП_ДатаПубликации"
	И Я запоминаю значение выражения 'Строка(ТекущаяДата()+3400)' в переменную 'Дата'
* вводим нужную дату и переходим снова на основную вкладку
	И в поле с именем 'НП_ДатаПубликации' я ввожу текст '$Дата$'
	И я перехожу к закладке с именем "ГруппаОбработка"
	И в таблице "Номенклатура" я завершаю редактирование строки	
* Нажимаем на зеленую кнопку загрузки и загружаем ранее подготовленный файл Эксель, где прописаны артикулы и характеристики
	И в таблице "Номенклатура" я нажимаю на кнопку с именем 'НоменклатураЗагрузитьТаблицуАртикуловРазмеров'
	И Пауза 5
	И я выбираю файл "C:\QA\G46.xlsx" ВК	
* Нажимаю на кнопку Сформировать Файл
	И я нажимаю на кнопку с именем 'ФормаСформироватьФайлДляGS1'
#[autodoc.ignorestep]	
	И пауза 10
	И Пауза 3
* Проверяю, что нет строк ошибок
  	И я показываю подсказку "Ошибок не должно быть" EnjoyHint у картинки "128" на экране
		   | 'Длительность' | '2000' |
		   | 'Прозрачность' | '127'  |
		   | 'Толщина'      | '3'    |	
	И пауза 2
* Если есть уведомления или ошибки в данной области обработки о причинах Нужно спросить у аналитика Один эс
	И пауза 3
* Спасибо за подробную инструкцию!
	@YandexTTS: voice=filipp; speed=1.2
	И Пауза 1
* Всегда рада помочь! До скорых встреч!	
	И Пауза 1