class YelpService
  def conn
    Faraday.new(url: 'https://api.yelp.com/') do |faraday|
      faraday.headers['Authorization'] = "Bearer #{Rails.application.credentials.yelp[:key]}"
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def food_find(location, type)
    get_url("v3/businesses/search?location=#{location}&term=#{type}&sort_by=best_match&limit=5")
  end
end