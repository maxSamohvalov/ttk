module DSInv
include CTI_panel_module
include DSRasp_module

  step "открывается окно портала" do
    @page = CTI_panel.new
    @page.load
    expect(@page.first_tab_name == "ДС – Расписание")
  end

  step 'мы находимся в справке :curr_page' do |curr_page|
    page_check(curr_page)
  end

  step 'вводит номер поезда' do
    @dsrasp = DSRasp_page.new
    @dsrasp.train_num.set('002А')
  end

  step 'нажимает кнопку Поиск' do
    @dsrasp = DSRasp_page.new
    @dsrasp.find.inv.click
  end

  step 'получает наличие вагонов для инвалидов' do
    @dsrasp = DSRasp_page.new
    sleep 3
    if @dsrasp.table_text_from.text() == 'МОСКВА ОКТ' and @dsrasp.table_text_to.text() == 'С-ПЕТЕР-ГЛ'
      puts "Тест пройден успешно"
    else
      puts "Не пройден"
      #binding.pry
    end


  end

end

RSpec.configure { |c| c.include DSInv }
