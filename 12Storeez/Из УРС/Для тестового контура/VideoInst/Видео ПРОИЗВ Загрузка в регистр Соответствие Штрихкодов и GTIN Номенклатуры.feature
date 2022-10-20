﻿#language: ru

@tree
@ВидеоИнструкция
Функционал: 12st: Загрузка в регистр Соответствие Штрихкодов и GTIN Номенклатуры 

Сценарий: ПРОИЗ. ВИдеоинструкция 12st: Загрузка в регистр Соответствие Штрихкодов и GTIN Номенклатуры

#[autodoc.ignorestep]
	И я активизирую TestClient "Этот клиен"
	И видеовставка картинки "134" "В этом видео научимся  пользоваться обработкой  Загрузка в регистр Соответствие Штрихкодов и Джейт+ин. Сначало подготовим файл эксель с заполненными столбцами как в примере, где Первая и вторая колонки это старые и новые штрихкоды, третья Джейтин, четвертая артикул, пятая характеристика"
		| 'FadeIn'  | 'Нет' |
		| 'FadeOut' | 'Да'  |
* Эта обработка нужна для записи джейтинов для немаркируемой продукции и сопостовления в регистре по джейт+ину, штрихкоду, номенклатуре, и характеристике.
	И Пауза 3
* Зайдем в эту обработку
	И Пауза 1
* Для этого заходим в базу Производства и нажимаем на вкладку слева ПРОИЗВОДСТВО
	Когда В панели разделов я выбираю 'Производство'	
* Далее нажимаем на эту обработку в разделе Сервис
	И В панели функций я выбираю '12St: Загрузка в регистр Соответствие Штрихкодов и GTIN Номенклатуры'	
	И пауза 1
* Нажимаем на кнопку Загрузить Из Эксель
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьИзExcel'

* И выбираем файл, заранее подготовленный, о котором говорилось в начале видео
	И пауза 2	
	И я нажимаю кнопку выбора у поля с именем "ПутьКФайлу"
	И я выбираю файл "C:\QA\Соответствие штрихкодов и номенклатуры.xlsx" ВК
	И я нажимаю на кнопку с именем 'Загрузить'
* Нажимаем на кнопку Записать Данные В Регистр
	И я нажимаю на кнопку с именем 'ЗаписитьДанныеВРегистр'
#[autodoc.ignorestep]	
	И пауза 20
* После Записи в регистр проверяем, что в столбце Успешно нет строк без зеленой галки
	И я показываю подсказку "Столбец (успешно)" EnjoyHint у картинки "133" на экране
		   | 'Длительность' | '2000' |
		   | 'Прозрачность' | '127'  |
		   | 'Толщина'      | '3'    |	
	И пауза 2	
	И я жду, что таблица "Товары" не станет содержать строки в течение 2 секунд:
	| 'Успешно' |
	| 'Нет'     |
* Если  в столбце Успешно имеются  строки без зеленой галки Нужно обратиться к аналитику Один эс
	И пауза 2
	И я закрываю все окна клиентского приложения	
* Спасибо за подробную инструкцию!
	@YandexTTS: voice=filipp; speed=1.2
	И Пауза 1
* Всегда рада помочь! До скорых встреч!	
	И Пауза 1	
	