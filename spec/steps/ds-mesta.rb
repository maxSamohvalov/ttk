module DSmesta
include DSRasp_module

  step "вводит дату отправления на неделю вперед" do
    date_iput 7
  end

  step 'получаем расписание "Орел - Белгород" на неделю вперед' do
    @dsrasp = DSRasp_page.new
    puts "Таблица поездов отобразилась".green if expect(@dsrasp.wait_for_table_rows)
    puts "В таблице поездов больше 4 результатов".green if expect(@dsrasp.table_rows.size > 4)
    puts "Нашлись поезда #{@dsrasp.table_elem_moscow_belgorod.text}".green if expect(@dsrasp).to have_table_elem_moscow_belgorod
    t = Time.now
    t1 = (t + (7*24*60*60)).strftime("%m/%d/%Y") #Первая цифра 7 (т.е. неделя), тут дату тоже поменять, как удасться настроить хром
    date_verifier t1
  end

  step 'нажимаем на поезд в расписании' do
    @dsrasp = DSRasp_page.new
    @dsrasp.table_rows[1].click
  end

  step 'открывается список вагонов' do
    @dsrasp = DSRasp_page.new
    puts "В выбранном поезде есть вагоны люкс".green if @dsrasp.wait_for_table_vagon_lux == true
    puts "В выбранном поезде есть вагоны купе".green if @dsrasp.wait_for_table_vagon_kupe(5) == true
    puts "В выбранном поезде есть вагоны плацкарт".green if @dsrasp.wait_for_table_vagon_platz(5) == true
  end

  step 'проверяем таблицы с местами для разных типов вагонов' do
    @dsrasp = DSRasp_page.new
    if @dsrasp.wait_for_table_vagon_lux(1) == true
      @dsrasp.table_vagon_lux.click
      puts "Нашлись места в вагонах люкс".green if @dsrasp.wait_for_table_places_lux(5) == true
    end
    if @dsrasp.wait_for_table_vagon_kupe(1) == true
      @dsrasp.table_vagon_kupe.click
      puts "Нашлись места в вагонах купе".green if @dsrasp.wait_for_table_places_kupe(5) == true
    end
    if @dsrasp.wait_for_table_vagon_platz(1) == true
      @dsrasp.table_vagon_platz.click
      puts "Нашлись места в вагонах плацкарт".green if @dsrasp.wait_for_table_places_platz(5) == true
    end
  end

end

RSpec.configure { |c| c.include DSmesta }
