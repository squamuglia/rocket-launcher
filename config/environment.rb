require "bundler/setup"
require "sinatra/activerecord"

Bundler.require

# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

require_relative '../app/menu'
require_relative '../app/account.rb'
require_relative '../app/launch_methods.rb'
require_relative '../app/models/mission.rb'
require_relative '../app/models/launch.rb'
require_relative '../app/models/user_launch.rb'
require_relative '../app/models/location.rb'
require_relative '../app/models/user.rb'



# require_relative '../app/rocket_starter.rb'



connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
