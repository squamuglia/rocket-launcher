ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :console do
  Pry.start
end

desc "drop the db"
  task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    File.delete(connection_details.fetch('database')) if File.exist?(connection_details.fetch('database'))
  end


desc "Migrate the db"
  task :migrate do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate("db/migrate/")
  end

desc "drop and recreate the db"
task :reset => [:drop, :migrate]
