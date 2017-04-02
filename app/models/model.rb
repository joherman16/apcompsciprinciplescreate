require 'uri'
require 'net/http'
require 'json'


def format_request_and_send_api_call(location)
    city = location
    request = "http://api.openweathermap.org/data/2.5/forecast?q=#{city}&units=imperial&APPID=d243a3573d8d8c6f333778cdb75b5517"
    make_api_call(request)
end

def make_api_call(request_string)
  uri = URI(request_string)
  response = Net::HTTP.get(uri)
  formatted_data = JSON.parse(response)
end

format_request_and_send_api_call("New York")