class Location < ActiveRecord::Base
  has_many :launches

  def self.launches_by_location
    sorted_locations = Location.all.sort {|location1, location2| location2.launches.count <=> location1.launches.count}.each {|location| puts "Location: #{location.name}. Number of Upcoming Launches: #{location.launches.count}"}
  end

  def self.find_or_create_by_launch_id(launch)
    if Location.find_by(location_id: launch["location"]["id"])
      new_location = Location.find_by(location_id: launch["location"]["id"])
    else
      new_location = Location.create(name: launch["location"]["name"], latitude: launch["location"]["pads"][0]["latitude"], longitude: launch["location"]["pads"][0]["longitude"], country_code: launch["location"]["countryCode"], location_id: launch["location"]["id"])
    end
    new_location
  end
end
