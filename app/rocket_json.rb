require 'json'
require 'httparty'
require 'pry'
# require 'sinatra/activerecord'
require_relative 'models/launch.rb'



url = 'https://launchlibrary.net/1.4/launch/next/100'
resp = HTTParty.get(url)
parsed_response = resp.parsed_response

def launch_seeder(parsed_response)
  parsed_response["launches"].each do |launch|
    Launch.create(name: launch["name"], status: launch["status"], isostart: launch["isostart"])
  end
end

launch_seeder(parsed_response)
binding.pry
