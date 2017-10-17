module DSFact
include CTI_panel_module
include DSRasp_module


  step 'пользователь выбирает По номеру поезда' do
    @dsrasp = DSRasp_page.new
    @dsrasp.train_num_radio_button.click
  end

  step 'пользователь выбирает По станции назначения' do
    @dsrasp = DSRasp_page.new
    @dsrasp.train_station_radio_button.click
  end

  step 'получает фактическое движение по номеру поезда' do
    @dsrasp = DSRasp_page.new
    puts "Получен результат".green if expect(@dsrasp.table_fact_dvij).to have_content("010й")
  end

  step 'получает фактическое движение по назначению' do
    @dsrasp = DSRasp_page.new
    if @dsrasp.wait_for_table_fact_dvij_tr_samara(40)
      puts "Получен результат".green
    else
      puts "Превышен таймаут".red
    end
  end

end

RSpec.configure { |c| c.include DSFact }
