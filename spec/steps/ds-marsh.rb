module DSMarsh
include CTI_panel_module
include DSRasp_module

  step 'вводим откуда :from' do |from|
    from_select(from)
  end

  step 'получает справку о маршруте' do
    @dsrasp = DSRasp_page.new
    puts "Таблица с данными отобразилась".green if expect(@dsrasp.wait_for_table_rows)
    puts "Маршрут отображен".green if expect(@dsrasp).to have_content("ОСНОВНОЙ МАРШРУТ: МОСКВА - С-ПЕТЕР-ГЛ")
    puts "В таблице больше 4 результатов".green if expect(@dsrasp.table_rows.size > 4)
  end


end

RSpec.configure { |c| c.include DSMarsh }
