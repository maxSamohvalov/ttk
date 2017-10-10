module DSMarsh
include CTI_panel_module
include DSRasp_module

  step 'вводим откуда :from' do |from|
    from_select(from)
  end

  step 'получает справку о маршруте' do
    @dsrasp = DSRasp_page.new
    puts "Маршрут отображен".green if expect(@dsrasp).to have_content("ОСНОВНОЙ МАРШРУТ: МОСКВА - С-ПЕТЕР-ГЛ")
  end

end

RSpec.configure { |c| c.include DSMarsh }
