class CookBook
  attr_reader :recipies, :summary

  def initialize
    @recipies = []
    @summary = []
  end

  def add_recipe(recipe)
    @recipies << recipe
    complier(recipe)
  end

  def complier(recipe)
    hash = {}
    hash[:name] = recipe_name_lister(recipe)

    details_hash = {}
    details_hash[:ingredients] = ingredients_hashes(recipe)
    details_hash[:total_calories] = recipe.calories

    hash[:details] = details_hash

    @summary << hash
  end

  def recipe_name_lister(recipe)
    recipe.name
  end

  def ingredients_hashes(recipe)
    ingredients = []
    recipe.ingredients_required.each do |ingredient, amount|
      ingredients << {:ingredient => ingredient.name, :amount => "#{amount} #{ingredient.unit}"}
    end
    sorted = ingredients.sort_by do |element|
      name = element[:ingredient]
      name.length
    end
    sorted.reverse
  end
  #holy cow, gotta be a better way to get array sorted to match
end
