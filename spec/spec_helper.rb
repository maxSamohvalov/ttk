require 'require_all'
require 'yaml'
require 'capybara/rspec'
require 'turnip/capybara'
require 'gnawrnip'
require 'turnip/rspec'
require 'site_prism'
require 'init_utils'
require 'faker'
require 'pry-byebug'
require 'colorize'
require 'chromedriver/helper'
require 'hooks'

include InitUtils

ENV['SERVER'] ||= '172.16.34.56'
ENV['USE_TURNIP'] ||= 'false'
ENV['CHROME_DRIVER_VERSION'] ||= '2.28'

puts '============================================='
puts 'Welcome ttk-acceptance'
puts "Using server: #{ENV['SERVER']}"
puts "Chrome driver version: #{ENV['CHROME_DRIVER_VERSION']}"
puts `google-chrome-stable --version`
puts '============================================='

Chromedriver.set_version ENV['CHROME_DRIVER_VERSION']

init_capybara
init_formatters
init_rspec
init_site_prism

require_all('spec/support/**/*.rb')
require_all('spec/steps/**/*.rb')
