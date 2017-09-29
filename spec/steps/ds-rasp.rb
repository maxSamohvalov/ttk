module DSRasp

  step "открывается окно портала" do
    @dsrasp = DSRasp_page.new
    @dsrasp.load
    expect(@dsrasp.first_tab_name == "ДС – Расписание")
  end

  step "мы находимся в справке ДС - Расписание" do

  end

  step 'вводим станцию отправления "Москва"' do

  end

  step 'вводит станцию назначения "Санкт-Питербург"' do

  end

  step 'получаем расписание "Москва - Санкт-Питербург"' do
    
  end

end

RSpec.configure { |c| c.include DSRasp }
