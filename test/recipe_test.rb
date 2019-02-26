require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/recipe'
require './lib/ingredient'
require 'pry'

class RecipeTest < Minitest::Test

  def setup
    @mac_and_cheese = Recipe.new("Mac and Cheese")

    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
  end

  def test_it_exists

    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_a_name

    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_it_can_list_all_required_ingredients_and_amount

    assert_equal ({}), @mac_and_cheese.ingredients_required

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    expected = {@cheese => 2, @mac => 8}

    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_it_can_list_amount_needed_of_a_single_ingredient

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 2,@mac_and_cheese.amount_required(@cheese)
    assert_equal 8,@mac_and_cheese.amount_required(@mac)
  end

  def test_it_can_list_all_ingredients_and_total_calories

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
    assert_equal 440, @mac_and_cheese.calories
  end

# The `total_calories` method should sum the calories of each ingredient.
# The calories for each ingredient can be calculated by multiplying the
#  `calories` attribute of the Ingredient by the amount of the
#  ingredient required for the recipe.

end
