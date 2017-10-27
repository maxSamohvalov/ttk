module Links
include DSRasp_module
include CTI_panel_module

otp = 'САНКТ-ПЕТЕРБУРГ | ОКТ | 2004000'
prib = 'МОСКВА | МСК | 2000000'
poezd = '772A'

  step 'переходим по ссылке "По наличию мест"' do
    @dsrasp = DSRasp_page.new
    @dsrasp.table_elem_moscow_sanctpt_train_num.click
    @dsrasp.a_mesta.click
    puts "Осуществлен переход по ссылке По наличию мест".green if expect(@dsrasp.wait_for_table_vagons_text)
  end

  step 'сохранятся Станция отправления и номер поезда' do
    @dsrasp = DSRasp_page.new
    puts "Cтанция отправления сохранилась".green if expect(@dsrasp.kendo_otpravleni['title']  == otp)
    puts "Сохранен номер поезда".green if expect(@dsrasp.train_num.value == poezd)
  end

  step 'сохранятся номер поезда' do
    @dsrasp = DSRasp_page.new
    puts "Номер поезда сохранен".green if expect(@dsrasp.train_num.value == poezd)
  end

  step 'сохранятся Станция отправления и Станция прибытия' do
    @dsrasp = DSRasp_page.new
    puts "Cтанция отправления сохранилась".green if expect(@dsrasp.kendo_otpravleni['title']  == otp)
    puts "Cтанция прибытия сохранилась".green if expect(@dsrasp.kendo_pribitie['title']  == prib)
  end

  step 'сохранятся Станция отправления' do
    @dsrasp = DSRasp_page.new
    puts "Cтанция отправления сохранилась".green if expect(@dsrasp.kendo_otpravleni['title']  == otp)
  end

  step 'переходим по ссылке "Расписание поездов"' do
    @dsrasp = DSRasp_page.new
    @dsrasp.link_to_shedule.click
    puts "Осуществлен переход по ссылке Расписание поездов".green if expect(@dsrasp).to have_content("Багажный вагон")
  end

  step 'переходим по ссылке "Маршрут"' do
    @dsrasp = DSRasp_page.new
    @dsrasp.a_marshrut.click
    puts "Осуществлен переход по ссылке Маршрут".green if expect(@dsrasp.wait_for_marshrut_table)
    puts "Номер поезда сохранен".green if expect(@dsrasp.train_num.value == poezd)
  end

  step 'переходим по ссылке "Схема поезда"' do
    @dsrasp = DSRasp_page.new
    @dsrasp.a_schema_poezda.click
    puts "Осуществлен переход по ссылке Схема поезда".green if expect(@dsrasp).to have_content("Расписание поездов")
  end

end

RSpec.configure { |c| c.include Links }
