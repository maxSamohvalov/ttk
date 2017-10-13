module DSBagaj
include CTI_panel_module
include DSRasp_module



  step 'выбирает Ручная кладь' do
    @dsrasp = DSRasp_page.new
    @dsrasp.bag_selector.click
    @dsrasp.popup_ruch_kladi.click

  end

  step 'выбирает Количество мест' do
    @dsrasp = DSRasp_page.new
    @dsrasp.table_bag_places.send_keys '1'

  end

  step 'выбирает Вес' do
    @dsrasp = DSRasp_page.new
    @dsrasp.table_bag_ves.send_keys '100'

  end

  step 'выбирает Вид расчета' do

  end

end

RSpec.configure { |c| c.include DSBagaj }
