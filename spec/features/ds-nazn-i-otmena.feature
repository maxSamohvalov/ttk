# language: ru
# encoding: utf-8
@chrome @cat_load
Функция: Получение справки ДС - Назначение и омена поездов

 Как оператор АРМ
 Для предоставления справки по ДС - Назначение и омена поездов
 Я должен иметь возможность ввести необходимые данные и получить справку

 Контекст:
  Когда открывается окно портала
  И мы находимся в справке "ДС – Назнач. и отмена поездов"

 Сценарий: Назначение и отмена поездов
   Когда вводит номер поезда '002А'
   И нажимает кнопку Поиск
   Тогда получает инфорамцию о назначении и отмене поездов
