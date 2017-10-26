module PSRasp
include DSRasp_module
include CTI_panel_module

  step 'получает расписание "Лобня - Долгопрудная"' do
    @dsrasp = DSRasp_page.new
    puts "Таблица с данными отобразилась".green if expect(@dsrasp.wait_for_table_rows)
    puts "В таблице есть результат".green if expect(@dsrasp.table_rows.size > 1)
    @dsrasp.wait_for_table_marsh_ps
    x1 = @dsrasp.table_marsh_ps[1].text
    puts "#{x1}"
    x1 = @dsrasp.table_marsh_ps[2].text
    puts "#{x1}"
    puts "Дождались" if expect(@dsrasp.wait_for_table_element_lobnya(30))
    puts "Отобразилась станция отправления".green if expect(@dsrasp).to have_table_element_lobnya
    puts "Отобразилась станция назначения #{@dsrasp.table_elem_dolgoprudnaia.text}".green if expect(@dsrasp).to have_table_elem_dolgoprudnaia
    #date_verifier
  end

  step 'включает опцию стоимости' do
    @dsrasp = DSRasp_page.new
    @dsrasp.swithc_to_price.click
    puts "Опция стоимости включена".green
  end

  step 'нажимает сортировку по номенру поезда' do
    @dsrasp = DSRasp_page.new
    puts "Щелкаем по #{ @dsrasp.table_elem_nomer_poezd.text}".green if expect(@dsrasp).to have_table_elem_nomer_poezd
    @dsrasp.table_elem_nomer_poezd.click
    puts "Сортировка по номеру поезда".green
  end



end
RSpec.configure { |c| c.include PSRasp }
