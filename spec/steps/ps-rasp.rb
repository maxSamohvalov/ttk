module PSRasp
include DSRasp_module
include CTI_panel_module

  step 'получает расписание "Лобня - Долгопрудная"' do
    @dsrasp = DSRasp_page.new
    puts "Таблица с данными отобразилась".green if expect(@dsrasp.wait_for_table_rows)
    puts "В таблице есть результат".green if expect(@dsrasp.table_rows.size > 1)
    puts "Отобразилась станция отправления #{@dsrasp.table_elem_lobnea.text}".green if expect(@dsrasp.wait_for_table_elem_lobnea(10)).to have_table_elem_lobnea
    puts "Отобразилась станция назначения #{@dsrasp.table_elem_dolgoprudnaia.text}".green if expect(@dsrasp).to have_table_elem_lobnea
    #date_verifier
  end

  step 'включает опцию стоимости' do
    @dsrasp = DSRasp_page.new
    @dsrasp.swithc_to_price.click
    puts "Опция стоимости включена".green
  end

  step 'нажимает сортировку по номенру поезда' do
    @dsrasp = DSRasp_page.new
    @dsrasp.table_elem_nomer_poezd.click
    puts "Сортировка по номеру поезда".green
  end


end
RSpec.configure { |c| c.include PSRasp }
