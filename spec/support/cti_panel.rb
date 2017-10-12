class CTI_panel < SitePrism::Page
  set_url ""

  element :first_tab_name, "#k-tabstrip-tab-0"
  element :cat_selector, '.dropdownlist.k-widget.k-dropdown.k-header'

#элементы справочника
  element :popup_shedule, :xpath, "//kendo-popup//li[text() = 'ДС – Расписание']"
  element :popup_places, :xpath, "//kendo-popup//li[text() = 'ДС – Наличие мест']"
  element :popup_route_price, :xpath, "//kendo-popup//li[text() = 'ДС – Стоимость проезда']"
  element :popup_trains, :xpath, "//kendo-popup//li[text() = 'ДС – Перечень поездов']"
  element :popup_trains_with_inv, :xpath, "//kendo-popup//li[text() = 'ДС – Поезда с вагонами для инв']"
  element :popup_vip, :xpath, "//kendo-popup//li[text() = 'ДС – Поезда с VIP вагонами']"
  element :popup_way, :xpath, "//kendo-popup//li[text() = 'ДС – Маршруты']"
  element :popup_baggage_price, :xpath, "//kendo-popup//li[text() = 'ДС – Стоимость первоз. багажа']"
  element :popup_trains_delay, :xpath, "//kendo-popup//li[text() = 'ДС – Назнач. и отмена поездов']"
  element :popup_fact, :xpath, "//kendo-popup//li[text() = 'ДС – Фактическое движение']"
  element :popup_cars, :xpath, "//kendo-popup//li[text() = 'ДС – Автомобилевозы']"
  element :popup_late, :xpath, "//kendo-popup//li[text() = 'ДС – Опоздания']"
  element :popup_change, :xpath, "//kendo-popup//li[text() = 'ДС – Пересадки']"
  element :popup_shedule_p, :xpath, "//kendo-popup//li[text() = 'ПС – Расписание']"
  element :popup_way_p, :xpath, "//kendo-popup//li[text() = 'ПС – Маршруты следования']"
  element :popup_route_price_p, :xpath, "//kendo-popup//li[text() = 'ПС – Стоимость проезда']"
  element :popup_basic, :xpath, "//kendo-popup//li[text() = 'ДС – Правила']"
  element :popup_basic_p, :xpath, "//kendo-popup//li[text() = 'ПС – Правила']"
  element :popup_ligot, :xpath, "//kendo-popup//li[text() = 'Льготный проезд']"
  element :popup_annimals, :xpath, "//kendo-popup//li[text() = 'Правила перевозки животных']"
  element :popup_tickets_return, :xpath, "//kendo-popup//li[text() = 'Возврат билетов']"
  element :popup_hands, :xpath, "//kendo-popup//li[text() = 'Правила перевозки ручной клади']"
  element :popup_other_rulles, :xpath, "//kendo-popup//li[text() = 'Правила. Иные']"
  element :popup_group, :xpath, "//kendo-popup//li[text() = 'Правила. Групповые заявки']"
  element :popup_kids, :xpath, "//kendo-popup//li[text() = 'Правила проезда детей']"
  element :popup_howtobuy, :xpath, "//kendo-popup//li[text() = 'Правила приобритения билетов']"
  element :popup_tickets_back, :xpath, "//kendo-popup//li[text() = 'Правила.Востановление билетов']"
  element :popup_routes_change, :xpath, "//kendo-popup//li[text() = 'Проезд с пересадками']"
  element :popup_act, :xpath, "//kendo-popup//li[text() = 'Акции']"
  element :popup_millitary, :xpath, "//kendo-popup//li[text() = 'Военные']"
  element :popup_stations, :xpath, "//kendo-popup//li[text() = 'Вокзалы']"
  element :popup_sapsan, :xpath, "//kendo-popup//li[text() = 'Сапсан']"
  element :popup_infoEISC, :xpath, "//kendo-popup//li[text() = 'Инфон-я, не входящая в ЕИСЦ']"
  element :popup_phone_num, :xpath, "//kendo-popup//li[text() = 'Справочные телефоны РЖД']"
  element :popup_electreg, :xpath, "//kendo-popup//li[text() = 'Электронная регистрация']"
  element :popup_regional, :xpath, "//kendo-popup//li[text() = 'Информация регионального значения']"
  element :popup_other, :xpath, "//kendo-popup//li[text() = 'Другое']"
  element :popup_international, :xpath, "//kendo-popup//li[text() = 'Международное сообщение']"
  element :popup_places_m, :xpath, "//kendo-popup//li[text() = 'МС – Наличие мест/Стоимость']"
  element :popup_shedule_m, :xpath, "//kendo-popup//li[text() = 'МС – Расписание']"
  element :popup_MCK, :xpath, "//kendo-popup//li[text() = 'МЦК']"
  element :popup_operinfo, :xpath, "//kendo-popup//li[text() = 'Оперативная информация']"

end

module CTI_panel_module
  def page_check(page_name_input)
    @page = CTI_panel.new
    if @page.first_tab_name.text != page_name_input
      @page.cat_selector.click
      case page_name_input
        when "ДС – Поезда с вагонами для инв"
          @page.popup_trains_with_inv.click
        when "ДС – Расписание"
          @page.popup_shedule.click
        when "ДС – Наличие мест"
          @page.popup_places.click
        when "ДС – Маршруты"
          @page.popup_way.click
        when "ДС – Назнач. и отмена поездов"
          @page.popup_trains_delay.click
        when "ПС – Расписание"
          @page.popup_shedule_p.click
        when "ПС – Стоимость проезда"
          @page.popup_route_price_p.click
      end
    end
  end
end
