module DSInv
include CTI_panel_module
include DSRasp_module


  step 'вводит номер поезда :num' do |num|
    train_to_select(num)
  end


  step 'получает наличие вагонов для инвалидов' do
    @dsrasp = DSRasp_page.new
    puts "Таблица отобразилась".green if expect(@dsrasp.wait_for_table_inv_elem_moscow(10)) and expect(@dsrasp.wait_for_table_inv_elem_sp(10))

  end

  step 'нажимает на ссылку Расписание поездов' do
    @dsrasp = DSRasp_page.new
    if click_link("Расписание поездов")
      puts "Щелкнули по ссылке".green
    end
  end

  step 'осуществлен переход по ссылке' do
    @dsrasp = DSRasp_page.new
    expect(@dsrasp).to have_xpath("//app-autocomplete-station[contains(., 'Станция отправления')]//input")
    puts "Осуществлен переход по ссылке".green
  end

end

RSpec.configure { |c| c.include DSInv }
