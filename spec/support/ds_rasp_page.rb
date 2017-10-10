class DSRasp_page < SitePrism::Page
  set_url ""

  element :stantion_from, :xpath, "//app-autocomplete-station[contains(., 'Станция отправления')]//input"
  element :stantion_to, :xpath, "//app-autocomplete-station[contains(., 'Станция прибытия')]//input"
  element :but_find, 'button.margin-bottom.k-button.k-primary', text: "Поиск"
  elements :table_rows, 'tr[data-kendo-grid-item-index]'
  element :table_elem_moscow_belgorod, 'td', text: "МОСКВА КУР — БЕЛГОРОД"
  elements :all_table, "td"


end

module DSRasp_module

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
    if time_to_verify = "now"
      t = Time.now
      table_date_format = t.strftime("%d/%m/%Y")
      puts "Поезда показаны в текущую дату".green if find(:xpath, "//td[contains(., '#{table_date_format}')]")
    else
      puts "Поезда показаны на '#{time_to_verify}'".green if find(:xpath, "//td[contains(., '#{time_to_verify}')]")
    end
  end

end
