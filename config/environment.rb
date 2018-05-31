require "bundler/setup"
require "sinatra/activerecord"

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

require_relative '../app/menu'
require_relative '../app/account.rb'
require_relative '../app/launch.rb'
require_relative '../app/launch_display_menu.rb'
require_relative '../app/countdown.rb'
require_relative '../app/saved_launches.rb'




connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
