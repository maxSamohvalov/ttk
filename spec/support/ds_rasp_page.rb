class DSRasp_page < SitePrism::Page
  set_url ""

  element :stantion_from, :xpath, "//app-autocomplete-station[contains(., 'Станция отправления')]//input"
  element :stantion_to, :xpath, "//app-autocomplete-station[contains(., 'Станция прибытия')]//input"
  element :but_find, 'button.margin-bottom.k-button.k-primary', text: "Поиск"


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
