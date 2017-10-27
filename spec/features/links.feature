# language: ru
# encoding: utf-8
@chrome @cat_load
Функция: Переход по ссылкам внутри справок

 Как оператор АРМ
 Я должен иметь возможность переходить по ссылкам для получения дополнительной информации

 Контекст:
  Когда открывается окно портала
  И мы находимся в справке "ДС – Расписание"

Сценарий: 1. Переход по ссылке Расписание поездов - По наличию мест
  Когда вводим станцию отправления "Москва"
  И вводит станцию назначения "Санкт-Петербург"
  И нажимает кнопку Поиск
  И нажимает стрку с поездом "772А"
  И переходим по ссылке "По наличию мест"
  Тогда сохранятся Станция отправления и Станция прибытия
  И переходим по ссылке "Расписание поездов"
  Тогда сохранятся Станция отправления и Станция прибытия

Сценарий: 2. Переход по ссылкe Расписание поездов - Маршрут
  Когда вводим станцию отправления "Москва"
  И вводит станцию назначения "Санкт-Петербург"
  И нажимает кнопку Поиск
  И нажимает стрку с поездом "772А"
  И переходим по ссылке "Маршрут"
  Тогда сохранятся Станция отправления
  И переходим по ссылке "Расписание поездов"
  Тогда сохранятся Станция отправления


Сценарий: 3. Переход по ссылке Расписание поездов - Схема поезда
  Когда вводим станцию отправления "Москва"
  И вводит станцию назначения "Санкт-Петербург"
  И нажимает кнопку Поиск
  И нажимает стрку с поездом "772А"
  И переходим по ссылке "Схема поезда"
  Тогда сохранятся номер поезда

Сценарий: 4. Переход по ссылке Наличие мест - Маршрут
  Когда мы находимся в справке "ДС – Наличие мест"
  И вводим станцию отправления "Москва"
  И вводит станцию назначения "Санкт-Петербург"
  И нажимает кнопку Поиск
  И нажимает стрку с поездом "772А"
  И переходим по ссылке "Маршрут"
  Тогда сохранятся Станция отправления и номер поезда

Сценарий: 5. Переход по ссылке Инвалиды - Расписание поездов
  Когда мы находимся в справке "ДС – Поезда с вагонами для инв"
  И вводит номер поезда "772А"
  И нажимает кнопку Поиск
  И переходим по ссылке "Расписание поездов"
  И переходим по ссылке "Схема поезда"
  Тогда сохранятся номер поезда
