class DSRasp_page < SitePrism::Page
  set_url ""

  element :stantion_ot, :xpath, "//input[@placeholder='Выберите станцию']"
  element :stantion_from, :xpath, "//app-autocomplete-station[contains(., 'Станция отправления')]//input"
  element :stantion_to, :xpath, "//app-autocomplete-station[contains(., 'Станция прибытия')]//input"
  element :but_find, 'button.k-button.k-primary', text: "Поиск"
  element :train_num, "input[name='trainNumber']"
#  element :find_inv, :xpath, "//*[@id='search-bar-form']/form/button"
  element :table_inv_elem_moscow, 'td', text: "МОСКВА ОКТ"
  element :table_inv_elem_sp, 'td', text: "С-ПЕТЕР-ГЛ"
  elements :table_rows, 'tr[data-kendo-grid-item-index]'
  element :table_elem_moscow_belgorod, 'td', text: "МОСКВА КУР — БЕЛГОРОД"
  element :table_elem_moscow_sanctpt, 'td', text: "МОСКВА ОКТ — С-ПЕТЕР-ГЛ"
  element :table_elem_lobnea, 'td', text: "ЛОБНЯ"
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

  def date_verifier(time_to_verify = "now")
    if time_to_verify == "now"
      t = Time.now
      table_date_format = t.strftime("%m/%d/%Y")
      puts "Поезда показаны в текущую дату".green if find(:xpath, "//td[contains(., '#{table_date_format}')]")
    else
      puts "Поезда показаны на '#{time_to_verify}'".green if find(:xpath, "//td[contains(., '#{time_to_verify}')]")
    end
  end


end
