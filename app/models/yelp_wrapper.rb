class YelpWrapper
  attr_reader :client

  def initialize
    @client = Yelp.client
  end

end
