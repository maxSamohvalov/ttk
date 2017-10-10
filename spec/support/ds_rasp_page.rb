class DSRasp_page < SitePrism::Page
  set_url ""

  element :stantion_from, :xpath, "//app-autocomplete-station[contains(., 'Станция отправления')]//input"
  element :stantion_to, :xpath, "//app-autocomplete-station[contains(., 'Станция прибытия')]//input"
  element :but_find, 'button.margin-bottom.k-button.k-primary', text: "Поиск"
  element :train_num, :xpath, "//div[@id='search-bar-form']/form/label/input"
  element :find_inv, :xpath, "//*[@id='search-bar-form']/form/button"
  element :table, 'div[id="disabled-table-table"]'
  element :table_text_from, :xpath, "//*[@id='disabled-table-table']/kendo-grid/kendo-grid-list/div/div[1]/table/tbody/tr[1]/td[4]"
  element :table_text_to, :xpath, "//*[@id='disabled-table-table']/kendo-grid/kendo-grid-list/div/div[1]/table/tbody/tr[1]/td[5]"


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

end
