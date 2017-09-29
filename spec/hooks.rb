# RSpec.configure do |config|
#   config.after(kill_org: true, type: :feature) do
#     @page = WebCol::StartPage.new
#     @page.logout_button.click if @page.wait_for_logout_button(3)
#     correct_autorization :yes
#     main_menu_visible
#     if $company_name != nil
#       delete_org
#     end
#   # config.before(type: :feature) do
#   #   # invoke before each feature
#   end
# end
