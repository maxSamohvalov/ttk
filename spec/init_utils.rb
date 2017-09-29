module InitUtils

  def init_capybara
    register_selenium_chrome
    select_driver :chrome
    Capybara.match = :first
    Capybara.default_max_wait_time = 15
    Capybara.app_host = "http://#{ENV['SERVER']}"
    # Capybara.server_port = 80
    #Capybara.save_and_open_page_path = './screenshots/wc_screenshots/'
    # Capybara::Screenshot.prune_strategy = { keep: 15 }
    # Capybara::Screenshot.autosave_on_failure = true
  end

  def select_driver(driver_name)
    Capybara.javascript_driver = driver_name
    Capybara.default_driver = driver_name
  end

  def register_selenium_chrome
    args = %w(--screen 0 1366x768x24 --incognito --allow-insecure-localhost --ignore-certificate-errors --disable-extensions
              --allow-failed-policy-fetch-for-test --disable-popup-blocking --enable-automation
              --start-maximized --disable-web-security --disable-smooth-scrolling
              --disable-prompt-on-repost --disable-extensions-file-access-check --disable-default-apps)
     Capybara.register_driver :chrome do |app|
       Capybara::Selenium::Driver.new(app,
                                      browser: :chrome,
                                      service_log_path: '/tmp/chrome_driver-ttk.log',
                                      desired_capabilities: {
                                        :browser_name => 'chrome',
                                        :javascript_enabled => true,
                                        :css_selectors_enabled => true,
                                        :loggingPrefs => {browser: 'ALL',
                                                          driver: 'ALL'},
                                        'chromeOptions' => {
                                          'args' => args
                                        }
                                      })
     end
  end

  def init_formatters
    TurnipFormatter.title = 'Web-collaboration acceptance tests'

    Gnawrnip.configure do |c|
      c.make_animation = true
      c.max_frame_size = 1280 # pixel
    end
    Gnawrnip.ready!
  end

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

  def init_site_prism
    SitePrism.configure do |config|
      config.use_implicit_waits = true
    end
  end

end
