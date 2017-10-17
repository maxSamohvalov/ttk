module DSBagaj
include CTI_panel_module
include DSRasp_module



  step 'выбирает Ручная кладь' do
    @dsrasp = DSRasp_page.new
    @dsrasp.bag_selector.click
    @dsrasp.popup_ruch_kladi.click
    puts "Выбрана ручная кладь".green

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
    @dsrasp = DSRasp_page.new
    @dsrasp.tipeof_bag_selector.click
    @dsrasp.popup_vid_rascheta.click
    puts "Выбран вид расчета Наличные".green if @dsrasp.tipeof_bag_selector.text == "Наличные"
  end

  step 'получает расчет по стоимости багажа' do
    @dsrasp = DSRasp_page.new
    sleep 4
    puts "Отобразилась цена".green if expect(find("strong").text[7..-4]).to eq('1 420,00')

  end

end

RSpec.configure { |c| c.include DSBagaj }
