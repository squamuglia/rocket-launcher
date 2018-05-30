require 'json'
require 'httparty'
require 'pry'
# require 'sinatra/activerecord'
require_relative 'models/launch.rb'
require_relative 'models/mission.rb'
require_relative 'models/location.rb'


url = 'https://launchlibrary.net/1.4/launch/next/100'
resp = HTTParty.get(url)
parsed_response = resp.parsed_response

def launch_seeder(parsed_response)
  parsed_response["launches"].each do |launch|
    # binding.pry
    Launch.create(name: launch["name"], status: launch["status"], isostart: launch["isostart"], launch_id: launch["id"])

     launch["missions"].each do |mission|
       Mission.create(name: mission["name"], description: mission["description"], typeName: mission["typeName"], mission_id: mission["id"])
     end

    Location.create(name: launch["location"]["name"], latitude: launch["location"]["pads"][0]["latitude"], longitude: launch["location"]["pads"][0]["longitude"], country_code: launch["location"]["country_code"], location_id: launch["location"]["id"])
  end
end

launch_seeder(parsed_response)
