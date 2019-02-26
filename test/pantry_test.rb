require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/pantry'
require './lib/recipe'
require './lib/ingredient'
require 'pry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new

    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)

    @mac_and_cheese = Recipe.new("Mac and Cheese")

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists

    assert_instance_of Pantry, @pantry
  end

  def test_it_can_show_what_it_has_in_stock_total_and_by_ingredient

    assert_equal ({}), @pantry.stock

    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_can_check_to_see_if_it_has_enough_ingredients_for_a_recipe

    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 8)

    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

end
