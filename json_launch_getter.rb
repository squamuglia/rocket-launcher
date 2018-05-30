require 'httparty'
require 'pry'

url = 'https://launchlibrary.net/1.4/launch/next/100'
resp = HTTParty.get(url)
parsed_response = resp.parsed_response
# binding.pry
