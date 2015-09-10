class YelpWrapper
  attr_reader :client

  def initialize
    @client = Yelp.client
  end

  def search_by_coords
    response = self.client.search_by_coordinates(coordinates = { latitude: 40.7124, longitude: -73.9670 }, params = {term: "cheap food", limit: "5", sort: "2", radius_filer: "600", deals_filter: true })
    #array of top 5 restaurants
    response.businesses
    #name of restaurant
    response.businesses[0].name
    #to iterate:
    i = 0
    until i == response.businesses.length
      puts response.businesses[i].name
      i += 1
    end

    #image_url
    response.businesses[0].image_url
    #categories
    response.businesses[0].categories
    #distance from user location
    response.businesses[0].distance
    #rating
    response.businesses[0].rating
    #rating url
    response.businesses[0].rating_img_url
    #reviews
    response.businesses[0].snippet_text
    #funny pictures
    response.businesses[0].snippet_image_url
    #street address
    response.businesses[0].location.address
    #full address
    response.businesses[0].location.display_address
    #only present if there are deals
    response.businesses[0].deals
  end

#note: no way to search for pricing via yelp. maybe filter comments for affordable, cheap...see patterns/

#deal stuff: works same as above ex: response.business[0].deals
# deals list  Deal info for this business (optional: this field is present only if there’s a Deal)
# deals.id  string  Deal identifier
# deals.title string  Deal title
# deals.url url Deal url
# deals.image_url url Deal image url
# deals.currency_code string  ISO_4217 Currency Code
# deals.time_start  number  Deal start time (Unix timestamp)
# deals.time_end  number  Deal end time (optional: this field is present only if the Deal ends)
# deals.is_popular  bool  Whether the Deal is popular (optional: this field is present only if true)
# deals.what_you_get  string  Additional details for the Deal, separated by newlines
# deals.important_restrictions  string  Important restrictions for the Deal, separated by newlines
# deals.additional_restrictions string  Deal additional restrictions
# deals.options list  Deal options
# deals.options.title string  Deal option title
# deals.options.purchase_url  url Deal option url for purchase
# deals.options.price number  Deal option price (in cents)
# deals.options.formatted_price string  Deal option price (formatted, e.g. "$6")
# deals.options.original_price  number  Deal option original price (in cents)
# deals.options.formatted_original_price  string  Deal option original price (formatted, e.g. "$12")
# deals.options.is_quantity_limited bool  Whether the deal option is limited or unlimited
# deals.options.remaining_count number  The remaining deal options available for purchase (optional: this field is only present if the deal is limited)

end

#http://api.yelp.com/v2/search/?term=Cheap Food&location=Williamsburg, BK&sort=2&limit=5&deals_filter=true