class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def enough_ingredients_for?(recipe)
    checker = recipe.ingredients_required.map do |ingredient, required_amount|
      @stock.has_key?(ingredient) && (@stock[ingredient] >= required_amount)
    end
    checker.all? {|response| response == true}
  end

end
