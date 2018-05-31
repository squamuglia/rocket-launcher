@location = {}

def get_location
  ip_address = `curl -s ifconfig.me`.chomp
  location = RestClient.get("http://ip-api.com/json/#{ip_address}")
  @location = JSON.parse(location)
end

def latitude
  @location["lat"]
end

def longitude
  @location["lon"]
end
