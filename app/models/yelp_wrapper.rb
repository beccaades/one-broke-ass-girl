class YelpWrapper
  attr_reader :client

  def initialize
    @client = Yelp.client
  end

  def search_by_coords
    response = self.client.search_by_coordinates(coordinates = { latitude: 40.7124, longitude: -73.9670 }, params = { term: 'food', limit: 3 })
    response.businesses[0].name
  end
end
