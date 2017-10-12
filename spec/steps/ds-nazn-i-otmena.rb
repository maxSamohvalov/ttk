module DSNaznIOtmena
include CTI_panel_module
include DSRasp_module



  step 'получает инфорамцию о назначении и отмене поездов' do
    @dsrasp = DSRasp_page.new
    puts "Таблица отобразилась".green if expect(@dsrasp.wait_for_table_inv_elem_moscow(10)) and expect(@dsrasp.wait_for_table_inv_elem_sp(10))
    puts "Отобразилась информация о поезде #{@dsrasp.table_elem_moscow_sanctpt.text}".green if expect(@dsrasp).to have_table_elem_moscow_sanctpt

  end

end

RSpec.configure { |c| c.include DSNaznIOtmena }
