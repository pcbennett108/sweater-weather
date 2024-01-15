class MunchiesFacade 
  def food_find(location, type)
    data = YelpService.new.food_find(location, type)
    Munchies.new(data)
  end
end