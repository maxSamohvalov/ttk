module PSMarshruti
include DSRasp_module
include CTI_panel_module

  step 'нажимает строку с поездом ЛОБНЯ' do
    @dsrasp = DSRasp_page.new
    puts "Отобразилось расписание".green if expect(@dsrasp).to have_content('ЛОБНЯ')
    @dsrasp.table_element_lobnya.click
    puts "Строка выбрана".green
  end

  step 'получает маршрут' do
    @dsrasp = DSRasp_page.new
    expect(@dsrasp).to have_css("#train-table-ps-table tr", :minimum => 3)
    puts ("Найдено " + @dsrasp.all("#train-table-ps-table tr").size.to_s + " результатов").green
    puts "Маршрут проложен".green if expect(@dsrasp).to have_content("ЛОБНЯ")
  end

  step 'получает маршрут' do
    puts "Получена стоимость проезда".green if expect(@dsrasp).to have_content("ЯХРОМА") or expect(@dsrasp).to have_content("ТУРИСТ")
  end

end

RSpec.configure { |c| c.include PSMarshruti }
