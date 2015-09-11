class LocuWrapper
  require 'pp'
  include HTTParty
  base_uri 'http://api.locu.com/v1_0'
  default_params :output => 'json'
  format :json

  LOCU_API_QUERY_ENDPOINT = "/venue/search/?has_menu=true&category=restaurant&locality=new+york+city&api_key="

  def initialize
    @app_key = ENV['locu_api_key']
  end

  def restaurants
    response = self.class.get("%s%s" % [LOCU_API_QUERY_ENDPOINT, @app_key], format: :json)
    parsed_response = JSON.parse(response.body)
    puts str =JSON.pretty_generate(parsed_response)
    # response["objects"][0]
    # response["objects"][0]
    # response["objects"][0]["lat"]
    # response["objects"][0]["long"]
  end

  def menu(venue_id)
    self.class.get("/venue/#{venue_id}/?api_key=#{@app_key}")
  end
end

# class Locu

#   API_KEY = "7fa9653a97e4be028ac85958b66df2d845e28485"

#   def self.find_venue id
#     RestClient.get "http://api.locu.com/v1_0/venue/#{id}/?api_key=#{API_KEY}"
#   end

#   def self.find_menu_item_id name, venue_address
#     if name.present? && venue_address.present?
#       name = name.gsub("&", "")
#       venue_address = venue_address.gsub("&", "")
#       url = "http://api.locu.com/v1_0/menu_item/search/?name=#{URI.encode(name)}&street_address=#{URI.encode(venue_address)}&api_key=#{API_KEY}"
#       return RestClient.get url
#     else
#       false
#     end
#   end

# end