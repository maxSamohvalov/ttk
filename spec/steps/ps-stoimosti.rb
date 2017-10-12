module PSStoimosti
include DSRasp_module
include CTI_panel_module

  step 'выбирает "С пересадками"' do
    @dsrasp = DSRasp_page.new
    @dsrasp.radio_peresadki.click
  end

  step 'выбирает "Базовое расписание на 10 дней"' do
    @dsrasp = DSRasp_page.new
    @dsrasp.radio_bazovoe.click
  end

  step 'нажимает стрку с поездом Брянск' do
    @dsrasp = DSRasp_page.new
    @dsrasp.table_elem_breansk_orl.click
    puts "Строка выбрана".green
  end

  step 'получает расписание "Калуга - Брянск"' do
    @dsrasp = DSRasp_page.new
    puts "Таблица с данными отобразилась".green if expect(@dsrasp.wait_for_table_rows)
    puts "В таблице есть результат".green if expect(@dsrasp.table_rows.size > 1)
    puts "Варианты нашлись".green if expect(@dsrasp).to have_content("Вариант:")
    #puts "Отобразились варианты с пересадками #{@dsrasp.table_elem_kaluga.text}".green if expect(@dsrasp).to have_table_elem_kaluga
    #date_verifier
  end

  step 'получает стоимость' do
    @dsrasp = DSRasp_page.new
    puts "Получена стоимость проезда".green if expect(@dsrasp).to have_content("Стоимость проезда: от")
  end

end

RSpec.configure { |c| c.include PSStoimosti }
