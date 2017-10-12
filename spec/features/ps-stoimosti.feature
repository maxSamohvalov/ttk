# language: ru
# encoding: utf-8
@chrome @cat_load
Функция: Получение справки ПС - Стоимость проезда

 Как оператор АРМ
 Для предоставления справки по ПС – Стоимость проезда
 Я должен иметь возможность ввести необходимые данные и получить справку

#  Контекст:
#   Когда открывается окно портала
#   И мы находимся в справке "ПС – Стоимость проезда"
#
# Сценарий: 1. Стоимость Калуга - Брянск
#   Когда вводим станцию отправления "Калуга"
#   И вводит станцию назначения "Брянск"
#   И выбирает "С пересадками"
#   И выбирает "Базовое расписание на 10 дней"
#   И нажимает кнопку Поиск
#   То получает расписание "Калуга - Брянск"
#   И нажимает сортировку по номенру поезда
#   И нажимает стрку с поездом Брянск
#   Тогда получает стоимость
