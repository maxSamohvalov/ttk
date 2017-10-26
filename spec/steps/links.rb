module Links
include DSRasp_module
include CTI_panel_module

  step 'переходим по ссылке "По наличию мест"' do
    @dsrasp = DSRasp_page.new
    find(:xpath, "//a[contains(., 'По наличию мест')]").click
    puts "Осуществлен переход по ссылке По наличию мест".green if expect(@dsrasp.table_vagons_text)
  end

  step 'сохранятся Номер поезда' do
    @dsrasp = DSRasp_page.new
    if @dsrasp.train_num.value == $num_train
      puts "Номер поезда сохранен".green
    else
      puts "Номер поезда не сохранен".red
    end
    expect(@dsrasp.train_num.value == $num_train)
  end

  step 'сохранятся Станция отправления  и Станция прибытия' do
    @dsrasp = DSRasp_page.new
    puts "Станция отправления сохранилась в поле".green if expect(@dsrasp.kendo_otpravleni)
    puts "Станция прибытия сохранилась в поле".green if expect(@dsrasp.kendo_pribitie)
  end

  step 'сохранятся Станция отправления' do
    @dsrasp = DSRasp_page.new
    puts "Станция отправления сохранилась в поле".green  if expect(@dsrasp.kendo_otpravleni)
  end

  step 'переходим по ссылке "Расписание поездов"' do
    @dsrasp = DSRasp_page.new
    find(:xpath, "//a[contains(., 'Расписание поездов')]").click
    puts "Осуществлен переход по ссылке Расписание поездов".green if expect(@dsrasp).to have_content("Багажный вагон")
  end

  step 'переходим по ссылке "Маршрут"' do
    @dsrasp = DSRasp_page.new
    find(:xpath, "//a[contains(., 'Маршрут')]").click
    puts "Осуществлен переход по ссылке Маршрут".green if expect(@dsrasp.marshrut_table)
    $num_train = @dsrasp.train_num.value
  end

  step 'переходим по ссылке "Схема поезда"' do
    @dsrasp = DSRasp_page.new
    find(:xpath, "//a[contains(., 'Схема поезда')]").click
    puts "Осуществлен переход по ссылке Схема поезда".green if expect(@dsrasp).to have_content("Расписание поездов")
  end
end

RSpec.configure { |c| c.include Links }
