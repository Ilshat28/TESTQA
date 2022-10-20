﻿#language: ru

@tree
@ВидеоИнструкция
Функционал:  STZ Установка Номенклатуры Характеристики в штрихкод упаковки


Сценарий: ПРОИЗ. ВИдеоинструкция STZ Установка Номенклатуры Характеристики в штрихкод упаковки

#[autodoc.ignorestep]
	И я активизирую TestClient "Этот клиен"
* Привет Один эс ! Подскажи пожалуйста, Как пользоваться обработкой  Установка Номенклатуры Характеристики в штрихкод упаковки
	@YandexTTS: voice=filipp; speed=1.2
	И Пауза 1
* Привет! Давай покажу.Сначало нужно зайти в эту обработку
	И Пауза 1
* Для этого заходим в базу Производства и нажимаем на вкладку слева ПРОИЗВОДСТВО
	Когда В панели разделов я выбираю 'Производство'	
* Далее нажимаем на эту обработку в разделе Сервис
	И В панели функций я выбираю 'STZ установка номенклатура характеристика в штрихкод упаковки'
	И пауза 1
* Далее  загружаем заранее заготовленный файл формата Эксель как в примере
	И пауза 1
	И видеовставка картинки "129" "Первая колонка это артикул, вторая характеристика, третья Код маркировки"
		|'FadeIn' |'Да'|
		|'FadeOut'|'Да'|
	И пауза 1
	И я выбираю файл "C:\QA\Соответсвие штрихкодов и номеклатуры для теста.xlsx" 
	И я нажимаю кнопку выбора у поля с именем "Путь"
* Нажимаем на кнопку Прочитать файл
	И я нажимаю на кнопку с именем 'Загрузить'
	Когда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button0'	
	И я закрываю все окна клиентского приложения кроме "STZ Установка Номенклатура Характеристика В Штрихкод Упаковки"
* Нажимаем на кнопку Создать штрихкоды Упаковок
	И я показываю подсказку "Нажимаем на кнопку" EnjoyHint у картинки "130" на экране
		   | 'Длительность' | '2000' |
		   | 'Прозрачность' | '127'  |
		   | 'Толщина'      | '3'    |	
	И пауза 1	   
	И я нажимаю на кнопку с именем 'СоздатьШтрихкодыУпаковокНаСервере'
#[autodoc.ignorestep]		
	И пауза 11
* Проверяем, что все строки записались. В последнем сообщении не должно быть строк "Не записан"
	И пауза 3
* Если есть сообщения "Не записан" Нужно обратиться к аналитику Один эс
	И пауза 2
	И я закрываю все окна клиентского приложения
* Спасибо за подробную инструкцию!
	@YandexTTS: voice=filipp; speed=1.2
	И Пауза 1
* Всегда рада помочь! До скорых встреч!	
	И Пауза 1	
				
			
			
