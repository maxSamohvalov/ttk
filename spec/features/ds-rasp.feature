# language: ru
# encoding: utf-8
@chrome @cat_load
Функция: Получение справки ДС - расписание

 Как оператор АРМ
 Для предоставления справки по ДС – Расписание клиенту
 Я должен иметь возможность ввести необходимые данные и получить справку

 Контекст:
  Когда открывается окно портала
  И мы находимся в справке "ДС – Расписание"

Сценарий: 1. Расписание Орел - Белгород
  Когда вводим станцию отправления "Орел"
  И вводит станцию прибытия "Белгород"
  И нажимает кнопку Поиск
  То получаем расписание "Орел - Белгород"
