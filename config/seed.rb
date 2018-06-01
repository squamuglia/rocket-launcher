require 'json'
require 'httparty'
require 'pry'
# require 'sinatra/activerecord'
require_relative '../app/models/launch.rb'
require_relative '../app/models/mission.rb'
require_relative '../app/models/location.rb'
require_relative '../app/models/user.rb'

User.create(name: 'max', password: 'password')
User.create(name: 'john', password: 'password')
Launch.create(name: "test", status: 1, isostart: "20150820T201000Z", launch_id: 0000, location_id: 0000)
Mission.create(name: "test", description: "test mission", typeName: "Communications", mission_id: 0000, launch_id: 0000)

url = 'https://launchlibrary.net/1.4/launch/next/10000'
resp = HTTParty.get(url)
parsed_response = resp.parsed_response

def launch_seeder(parsed_response)
  parsed_response["launches"].each do |launch|

    new_location = Location.find_or_create_by_launch_id(launch)
    new_launch = Launch.create(name: launch["name"], status: launch["status"], isostart: launch["isostart"], launch_id: launch["id"], location_id: new_location.id)

    launch["missions"].each do |mission|
      Mission.create(name: mission["name"], description: mission["description"], typeName: mission["typeName"], mission_id: mission["id"], launch_id: new_launch.id)
    end

  end
end

launch_seeder(parsed_response)
