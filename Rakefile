#!/usr/bin/env rake

task default: %w[test]

task :all_tests do
  require 'rspec/core/rake_task'
  ENV['RAILS_ENV'] = 'test'
  ENV['USE_TURNIP'] = 'true'

  RSpec::Core::RakeTask.new(:turnip) do |t|
    t.rspec_opts = "--tag ~@wip -r turnip/rspec --format documentation"
    t.pattern    = 'spec/features'
  end
  Rake::Task['turnip'].execute
end

# task :long_tests do
#   require 'rspec/core/rake_task'
#   ENV['RAILS_ENV'] = 'test'
#   ENV['USE_TURNIP'] = 'true'
#
#   RSpec::Core::RakeTask.new(:turnip) do |t|
#     t.rspec_opts = "--tag ~@wip -r turnip/rspec --format documentation"
#     t.pattern    = 'spec/acceptance/long_tests'
#   end
#   Rake::Task['turnip'].execute
# end


task :test_with_html_report do
    require 'rspec/core/rake_task'
    require 'fileutils'
    require 'net/sftp'

    ENV['RAILS_ENV'] = 'test'
    ENV['USE_TURNIP'] = 'true'
    ENV['BRANCH'] ||= 'master'

    report_dir = '/tmp/acceptance/ttk-acceptance'
    branch_name = ENV['BRANCH']
    target_dir = "#{report_dir}/#{branch_name}"
    remote_dir = "/opt/web/nginx/acceptance/ttk-acceptance/#{branch_name}"
    FileUtils.rm_rf(target_dir)
    FileUtils.mkdir_p(target_dir)

    RSpec::Core::RakeTask.new(:turnip) do |t|
        t.rspec_opts = " --format documentation --tag ~@wip  -r turnip_formatter --format RSpecTurnipFormatter  --out #{target_dir}/report.html"
        t.pattern = 'spec/features/**/*.feature'
    end
    begin
        Rake::Task['turnip'].execute
    ensure
        Net::SFTP.start('172.20.0.4', 'root', password: 'urkib1+') do |sftp|
            sftp.session.exec!("mkdir -p #{remote_dir}")
            sftp.upload!(target_dir.to_s, remote_dir.to_s)
        end
    end
end

# task :test_with_report do
#   require 'rspec/core/rake_task'
#   ENV['RAILS_ENV'] = 'test'
#   ENV['USE_TURNIP'] = 'true'
#   report_dir = '/tmp/acceptance/ttk-acceptance'
#   branch_name = `git rev-parse --abbrev-ref HEAD`.strip!
#   target_dir = "#{report_dir}/#{branch_name}"
#
#   `rm -rf target_dir`
#   `mkdir target_dir`
#
#   RSpec::Core::RakeTask.new(:turnip) do |t|
#     t.rspec_opts = "--tag ~@wip  -r turnip_formatter --format RSpecTurnipFormatter  --out #{target_dir}/report.html"
#     # t.pattern = 'spec/acceptance/super_user/no_failed_jobs.feature' #feature here
#   end
#   Rake::Task['turnip'].execute
end
