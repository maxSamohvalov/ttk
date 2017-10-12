module ConfigsFile

  def init_rspec
   RSpec.configure do |config|
     config.color = true
     config.formatter = :progress

     config.before(chrome: true) do
       select_driver :chrome
     end
     config.after(chrome: true) do
       select_driver :chrome
     end
   end
  end

  def init_capybara
    register_selenium_chrome
    select_driver :chrome
    Capybara.match = :first
    Capybara.default_max_wait_time = 15
    Capybara.app_host = "http://www.google.com"
  end

  def select_driver(driver_name)
    Capybara.javascript_driver = driver_name
    Capybara.default_driver = driver_name
  end

  def register_selenium_chrome
   Capybara.register_driver :chrome do |app|
     Capybara::Selenium::Driver.new(app,
                                   browser: :chrome,
                                   service_log_path: '/tmp/acceptance_test.log',
                                   desired_capabilities: {
                                     'ignore-certificate-errors' => true,
                                     'disable-popup-blocking' => true,
                                     'disable-translate' => true,
                                     :browser_name => 'chrome',
                                     :javascript_enabled => true,
                                     :css_selectors_enabled => true,
                                     :loggingPrefs => { browser: 'ALL',
                                                        driver: 'ALL' },
                                     'chromeOptions' => {
                                       'args' => %w( window-size=1300,790 --disable-web-security )
                                     }
                                   })
   end
  end

  def init_site_prism
    SitePrism.configure do |config|
      config.use_implicit_waits = true
    end
  end


end
