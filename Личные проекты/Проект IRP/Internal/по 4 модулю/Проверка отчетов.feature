﻿#language: ru

@tree
@Reports
Функционал: тестирование отчетов

Как  Тестировщик я хочу
протестировать отчеты 
чтобы посмотреть что у пользоавателя не возникло прооблем

Сценарий: _0901 Проверка отчетов
//Нужно сделать эсспорт основных даных так при тестировании отчета лучше смотреть уже готовые даные
Когда Экспорт документов закупок
И я выполняю код встроенного языка на сервере
|'Документы.PurchaseOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
|'Документы.PurchaseOrder.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
|'Документы.PurchaseOrder.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
|'Документы.PurchaseInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
|'Документы.PurchaseInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
// useful code you maight use it in many case 
Сценарий: _0902 Проверка отчета по номенклатуре
И В командном интерфейсе я выбираю 'Отчеты' 'D0010 Информация по товарам'
Тогда открылось окно 'D0010 Информация по товарам'
И в табличном документе 'Result' я перехожу к ячейке "R1C1"
И я нажимаю на кнопку с именем 'FormGenerate'
Дано Табличный документ "Result" равен макету "макетпоотчетамтовары1" по шаблону
// макет предварительно сохранили в наших файлах
И в табличном документе "Result" ячейка с адресом "R9C3" равна "7878898*" по шаблону
// проверка на то что в опред ячейке содерджиться опред информация * показывает что после этих цифр могут быть любые другие
Сценарий: _0902 Проверка отчета по номенклатуре
И я закрываю все окна клиентского приложения
И В командном интерфейсе я выбираю 'Отчеты' 'D1001 Закупки'
Тогда открылось окно 'D1001 Закупки'
И в табличном документе 'Result' я перехожу к ячейке "R1C1"
И я нажимаю на кнопку с именем 'FormGenerate'
И я жду когда в табличном документе "Result" заполнится ячейка "R16C4" в течение 30 секунд

 // когда отчет не равен макеты, то есть есть баг нужно смотреть отчет по ошибке они очень информативные и сразу видно ошибку
 // общее :  если отчет сделал в скд нужно тестировать разные вариации отчетов 2) все ли даные попадают в отчет и все ли даные правильно попадают 3) математику нужно проверить
 //  4) под разными правами доступа проверять надо