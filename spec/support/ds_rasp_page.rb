class DSRasp_page < SitePrism::Page
  set_url ""

  element :bag_selector, '.app-kendo-dropdownlist.k-widget.k-dropdown.k-header'
  element :tipeof_bag_selector, '.width-percent-100.k-widget.k-dropdown.k-header'
  element :bag_price, "strong"
  element :popup_ruch_kladi, :xpath, "//kendo-popup//li[text() = 'Ручная кладь']"
  element :popup_vid_rascheta, :xpath, "//kendo-popup//li[text() = 'Наличные']"
  element :first_tab_name, "#k-tabstrip-tab-0"
  element :stantion_ot, :xpath, "//input[@placeholder='Выберите станцию']"
  element :stantion_from, :xpath, "//app-autocomplete-station[contains(., 'Станция отправления')]//input"
  element :stantion_to, :xpath, "//app-autocomplete-station[contains(., 'Станция прибытия')]//input"
  element :but_find, 'button.k-button.k-primary', text: "Поиск"
  element :train_num, "input[name='trainNumber']"
  element :table_inv_elem_moscow, 'td', text: "МОСКВА ОКТ"
  element :table_inv_elem_sp, 'td', text: "С-ПЕТЕР-ГЛ"
  elements :table_rows, 'tr[data-kendo-grid-item-index]'
  element :table_elem_moscow_belgorod, 'td', text: "МОСКВА КУР — БЕЛГОРОД"
  element :table_elem_moscow_sanctpt, 'td', text: "МОСКВА ОКТ — С-ПЕТЕР-ГЛ"
  #element :table_elem_lobnea, 'td', text: "ЛОБНЯ"
  element :table_element_lobnya, :xpath,  "//div[@id='train-table-ps-table']/kendo-grid/kendo-grid-list/div/div[contains(., 'ЛОБНЯ')]"
  element :table_elem_breansk_orl, 'td', text: "БРЯНСК ОРЛОВСКИЙ"
  element :table_elem_dolgoprudnaia, 'td', text: "ДОЛГОПРУДНАЯ"
  element :table_elem_razovii, 'td', text: "Разовый полный"
  element :table_elem_nomer_poezd, 'th', text: "№ поезда"
  element :link_to_shedule, 'a', text: "Расписание поездов"
  element :date_on_left, :xpath, "//app-datepicker[contains(., 'Дата')]//input"
  element :marshrut_table, 'a', text: "ОСНОВНОЙ МАРШРУТ: МОСКВА - С-ПЕТЕР-ГЛ"
  element :swithc_to_price, "kendo-switch[name = 'price']"
  element :radio_peresadki, "label[for = 'route_transfer']"
  element :radio_bazovoe, "label[for = 'schedule_base']"
  elements :table_marsh_ps, :xpath, "//div[@id = 'train-table-ps-table']//tbody//tr"
  elements :table_vagons, :xpath, "//div[@id = 'places-table-table'][contains(., 'Наличие мест на выбранный поезд')]//tbody//tr"
  element :table_vagon_kupe, :xpath, "//div[@id = 'places-table-table'][contains(., 'Наличие мест на выбранный поезд')]//tbody//tr[contains(., 'Купе')]"
  element :table_vagon_lux, :xpath, "//div[@id = 'places-table-table'][contains(., 'Наличие мест на выбранный поезд')]//tbody//tr[contains(., 'Люкс')]"
  element :table_vagon_platz, :xpath, "//div[@id = 'places-table-table'][contains(., 'Наличие мест на выбранный поезд')]//tbody//tr[contains(., 'Плацкартный')]"
  elements :table_places, :xpath, "//div[@id = 'places-table-table'][contains(., 'Наличие мест по вагону')]//tbody//tr"
  element :table_places_kupe, :xpath, "//div[@id = 'places-table-table'][contains(., 'Налидчие мест по вагону')]//tbody//tr[contains(., 'Купе')]"
  element :table_places_lux, :xpath, "//div[@id = 'places-table-table'][contains(., 'Наличие мест по вагону')]//tbody//tr[contains(., 'СВ')]"
  element :table_places_platz, :xpath, "//div[@id = 'places-table-table'][contains(., 'Наличие мест по вагону')]//tbody//tr[contains(., 'Плацкартный')]"
  element :table_bag_places, :xpath, "//div[@id = 'search-bar-form']//label//label[contains(., 'Мест')]//input"
  element :table_bag_ves, :xpath, "//div[@id = 'search-bar-form']//label//label[contains(., 'Вес')]//input"


end

module DSRasp_module


  def train_to_select(num)
    @dsrasp = @dsrasp = DSRasp_page.new
    @dsrasp.train_num.send_keys num
  end

  def from_select(st_select)
    @dsrasp = DSRasp_page.new
      @dsrasp.stantion_ot.send_keys st_select
      sleep 1
      @dsrasp.stantion_ot.send_keys :enter
  end

  def stantion_from_select(st_select)
    @dsrasp = DSRasp_page.new
      @dsrasp.stantion_from.send_keys st_select
      sleep 1
      @dsrasp.stantion_from.send_keys :enter
  end

  def stantion_to_select(st_select)
    @dsrasp = DSRasp_page.new
    @dsrasp.stantion_to.send_keys st_select
    sleep 1
    @dsrasp.stantion_to.send_keys :enter
  end

  def date_iput(add_days = 0)
    @dsrasp = DSRasp_page.new
    @dsrasp.date_on_left.click
    t = Time.now
    2.times {@dsrasp.date_on_left.send_keys :left}
    t1 = t + (add_days*24*60*60) #прибавляем <первая цифра> дней к текущей дате
    @dsrasp.date_on_left.send_keys t1.strftime("%d")
    @dsrasp.date_on_left.send_keys t1.strftime("%m")
    @dsrasp.date_on_left.send_keys t1.strftime("%Y")
  end

  def date_verifier(time_to_verify = "now") #передавать патаметр в виде "mm/dd/yyyy", переделать как только удасться настроить хром
    if time_to_verify == "now"
      t = Time.now
      table_date_format = t.strftime("%m/%d/%Y")
      puts "Поезда показаны в текущую дату".green if find(:xpath, "//td[contains(., '#{table_date_format}')]")
    else
      puts "Поезда показаны на '#{time_to_verify}'".green if find(:xpath, "//td[contains(., '#{time_to_verify}')]")
    end
  end


end
