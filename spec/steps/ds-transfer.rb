module DSTrans
include DSRasp_module

  step 'вводим куда :curr_to' do |curr_to|
    $to_st = curr_to
    to_select curr_to
  end

  step 'получаем расписание пересадок' do
    @page = DSRasp_page.new
    @page.wait_for_table_transfer
    puts "Получили список маршрутов с пересадками".green if (expect(@page.table_transfer_rows[1]).to have_content($from_st)) && (expect(@page.table_transfer_rows[1]).to have_content($to_st))
  end

  step 'кликаем на маршрут в таблице' do
    @page = DSRasp_page.new
    @page.table_transfer_rows[1].click
  end

  step 'получае детализацию по маршруту с пересадками' do
    @page = DSRasp_page.new
    t_t = @page.transfer_time_info.text
    puts "Отобразилось #{t_t}".green if  expect(@page.wait_for_transfer_time_info)
    puts "Отобразился первый поезд в детализации маршрута".green if expect(@page.transfer_first_train).to have_content($from_st)
    puts "Отобразился второй поезд в детализации маршрута".green if expect(@page.transfer_second_train).to have_content($to_st)
    date_verifier
  end

  step 'выбираем прямой маршрут' do
    @page = DSRasp_page.new
    @page.straight_rout.click
  end

  step 'получаем расписание прямых маршрутов на неделю вперед' do
    @page = DSRasp_page.new
    @page.wait_for_table_transfer
    puts "Получили список прямых маршрутов".green if expect(@page.table_transfer_rows[1]).to have_content("— Без пересадок —")
    date_verifier 7
  end

  step 'выбираем Пригородное сообщение' do
    @page = DSRasp_page.new
    @page.drop_rout_type.click
    @page.ps_type.click
  end

end

RSpec.configure { |c| c.include DSTrans }
