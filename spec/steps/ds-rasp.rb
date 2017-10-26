module DSRasp
include DSRasp_module
include CTI_panel_module

  step "открывается окно портала" do
    @page = CTI_panel.new
    @page.load
    expect(@page.first_tab_name == "ДС – Расписание")
  end

  step 'мы находимся в справке :curr_page' do |curr_page|
    page_check(curr_page)
  end

  step 'вводим станцию отправления :st_sel' do |st_sel|
    stantion_from_select(st_sel)
  end

  step 'вводит станцию назначения :st_sel' do |st_sel|
    stantion_to_select(st_sel)
  end

  step 'вводит станцию прибытия :st_sel' do |st_sel|
    save_screenshot
    where_to_select(st_sel)
  end

  step 'нажимает кнопку Поиск' do
    @dsrasp = DSRasp_page.new
    @dsrasp.but_find.click
    puts "Текущая вкладка #{@dsrasp.first_tab_name.text}".green
  end

  step 'получаем расписание "Орел - Белгород"' do
    @dsrasp = DSRasp_page.new
    puts "Таблица с данными отобразилась".green if expect(@dsrasp.wait_for_table_trains)
    puts "В таблице больше 4 результатов".green if expect(@dsrasp.table_trains.size > 4)
    puts "Нашлись поезда #{@dsrasp.table_elem_moscow_belgorod.text}".green if expect(@dsrasp).to have_table_elem_moscow_belgorod
    date_verifier
  end

  step 'выбирает "По Станции"' do
    @dsrasp = DSRasp_page.new
    @dsrasp.switch_by_station.click
    puts "Переключатель По Станции в позиции Да".green if expect(@dsrasp.switch_by_station).to have_content("ДА")
  end

  step 'выбирает "Эталон"' do
    @dsrasp = DSRasp_page.new
    @dsrasp.switch_by_etalon.click
    puts "Переключатель Эталон в позиции Да".green if expect(@dsrasp.switch_by_etalon).to have_content("ДА")
  end

  step 'получаем расписание "Отправление по станции"' do
    @dsrasp = DSRasp_page.new
    puts "Отобразились Поезда:Отправление".green if expect(@dsrasp.table_rasp).to have_content("Поезда: Отправление")
    puts "Отобразились Поезда:Прибытие".green if expect(@dsrasp.table_rasp).to have_content("Поезда: Прибытие")
    puts "Отобразились Поезда:Транзит".green if expect(@dsrasp.table_rasp).to have_content("Поезда: Транзит")
  end

  step 'получаем расписание "Эталонное расписание"' do
    @dsrasp = DSRasp_page.new
    puts "Таблица с данными отобразилась".green if expect(@dsrasp.wait_for_table_trains)
    puts "Отобразились эталонные результаты".green if expect(@dsrasp.table_rasp).to have_content("НЕТ В ХОДУ")
  end

  step 'нажимает стрку с поездом "МОСКВА ОКТ — С-ПЕТЕР-ГЛ"' do
    @dsrasp = DSRasp_page.new
    @dsrasp.table_elem_moscow_sanctpt.click
    puts "Строка выбрана".green
  end

  step 'переходим по ссылке "По наличию мест"' do
    @dsrasp = DSRasp_page.new
    find(:xpath, "//a[contains(., 'По наличию мест')]").click
    #puts @dsrasp.text
    if expect(@dsrasp.table_vagons_text)
      puts "Осуществлен переход по ссылке По наличию мест".green
    else
      puts "Переход по ссылке нет"
    end
  end

  step 'сохранятся Станция отправления  и Номер поезда' do
    @dsrasp = DSRasp_page.new
    if expect(@dsrasp.kendo_otpravleni)
      puts "Станция отправления сохранилась в поле".green
    else
      puts "Станция отправления не сохранилась в поле".red
    end
    #val = @dsrasp.find('kendo-autocomplete[title="САНКТ-ПЕТЕРБУРГ | ОКТ | 2004000"]')['title']
    #puts val.green
    if @dsrasp.train_num.value == '020У'
      puts "Номер поезда сохранен".green
    else
      puts "Номер поезда не сохранен".red
    end
  end

  step 'сохранятся Номер поезда' do
    @dsrasp = DSRasp_page.new
    if @dsrasp.train_num.value == '020У'
      puts "Номер поезда сохранен".green
    else
      puts "Номер поезда не сохранен".red
    end
  end

  step 'сохранятся Станция отправления  и Станция прибытия' do
    @dsrasp = DSRasp_page.new
    if expect(@dsrasp.kendo_otpravleni)
      puts "Станция отправления сохранилась в поле".green
    else
      puts "Станция отправления не сохранилась в поле".red
    end
    #val = @dsrasp.find('kendo-autocomplete[title="САНКТ-ПЕТЕРБУРГ | ОКТ | 2004000"]')['title']
    #puts val.green
    if expect(@dsrasp.kendo_pribitie)
      puts "Станция прибытия сохранилась в поле".green
    else
      puts "Станция отправления не сохранилась в поле".red
    end
  end

  step 'сохранятся Станция отправления' do
    @dsrasp = DSRasp_page.new
    if expect(@dsrasp.kendo_otpravleni)
      puts "Станция отправления сохранилась в поле".green
    else
      puts "Станция отправления не сохранилась в поле".red
    end
  end

  step 'переходим по ссылке "Расписание поездов"' do
    @dsrasp = DSRasp_page.new
    find(:xpath, "//a[contains(., 'Расписание поездов')]").click
    if expect(@dsrasp).to have_content("Багажный вагон")
      puts "Осуществлен переход по ссылке Расписание поездов".green
    else
      puts "Переход по ссылке нет".red
    end
  end

  step 'переходим по ссылке "Маршрут"' do
    @dsrasp = DSRasp_page.new
    find(:xpath, "//a[contains(., 'Маршрут')]").click
    if expect(@dsrasp.marshrut_table)
      puts "Осуществлен переход по ссылке Маршрут".green
    else
      puts "Переход по ссылке нет".red
    end
  end

  step 'переходим по ссылке "Схема поезда"' do
    @dsrasp = DSRasp_page.new
    find(:xpath, "//a[contains(., 'Схема поезда')]").click
    if expect(@dsrasp).to have_content("Расписание поездов")
      puts "Осуществлен переход по ссылке Схема поезда".green
    else
      puts "Переход по ссылке нет".red
    end
  end

end

RSpec.configure { |c| c.include DSRasp }
