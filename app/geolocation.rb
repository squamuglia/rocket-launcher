require 'rest-client'
require 'json'
require_relative '../config/environment.rb'


@current_location = {}

def get_location
  ip_address = `curl -s ifconfig.me`.chomp
  location = RestClient.get("http://ip-api.com/json/#{ip_address}")
  @current_location = JSON.parse(location)
end

def current_latitude
  @current_location["lat"]
end

def current_longitude
  @current_location["lon"]
end


def compare_pad_distances
  closest_launch = Launch.first
  closest_dist = 100000
  Launch.all.each do |launch|
    from_lat = current_latitude
    from_lon = current_longitude
    to_lat = launch.location.latitude
    to_lon = launch.location.longitude
    dist = Haversine.distance(from_lat, from_lon, to_lat, to_lon).to_miles
        if dist < closest_dist
          closest_launch = launch
          closest_dist = dist
        end
  end
  closest_launch
end

get_location
compare_pad_distances
