module PSMarshruti
include DSRasp_module
include CTI_panel_module

  step 'нажимает строку с поездом ЛОБНЯ' do
    @dsrasp = DSRasp_page.new
    @dsrasp.table_elem_lobnea.click
    puts "Строка выбрана".green
  end

  step 'получает маршрут' do
    puts "Получена стоимость проезда".green if expect(@dsrasp).to have_content("ЯХРОМА") or expect(@dsrasp).to have_content("ТУРИСТ")
  end

end

RSpec.configure { |c| c.include PSMarshruti }
