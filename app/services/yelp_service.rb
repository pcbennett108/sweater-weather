class YelpService

  def get_restaurants(type, location)
    get_url("/v3/businesses?location=#{location}&term=#{type}&limit=10")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.yelp.com") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.yelp[:key]
    end
  end
end