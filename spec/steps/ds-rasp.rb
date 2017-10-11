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

  step 'нажимает кнопку Поиск' do
    @dsrasp = DSRasp_page.new
    @dsrasp.find_inv.click
  end

  step 'получаем расписание "Орел - Белгород"' do
    @dsrasp = DSRasp_page.new
    puts "Таблица с данными отобразилась".green if expect(@dsrasp.wait_for_table_rows)
    puts "В таблице больше 4 результатов".green if expect(@dsrasp.table_rows.size > 4)
    puts "Нашлись поезда #{@dsrasp.table_elem_moscow_belgorod.text}".green if expect(@dsrasp).to have_table_elem_moscow_belgorod
    binding.pry
    date_verifier
  end

end

RSpec.configure { |c| c.include DSRasp }
