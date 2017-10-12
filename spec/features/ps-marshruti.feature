# language: ru
# encoding: utf-8
@chrome @cat_load
Функция: Получение справки ПС - маршруты следования

 Как оператор АРМ
 Для предоставления справки по ПС – Маршруты следования
 Я должен иметь возможность ввести необходимые данные и получить справку

 Контекст:
  Когда открывается окно портала
  И мы находимся в справке "ПС – Маршруты следования"

Сценарий: 1. Маршруты Лобня - Долгопрудная
  Когда вводим станцию отправления "Лобня"
  И вводит станцию назначения "Долгопрудная"
  И нажимает кнопку Поиск
  То получает расписание "Лобня - Долгопрудная"
  И нажимает сортировку по номенру поезда
  И нажимает строку с поездом ЛОБНЯ
  Тогда получает маршрут
