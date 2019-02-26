require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cookbook'
require './lib/pantry'
require './lib/recipe'
require './lib/ingredient'
require 'pry'

class CookBookTest < Minitest::Test

  def setup
    @cookbook = CookBook.new

    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @burger = Recipe.new("Burger")

    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)

    @ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    @bun = Ingredient.new("Bun", "g", 1)


  end

  def test_it_exists

    assert_instance_of CookBook, @cookbook
  end

  def test_it_can_have_a_summary_of_all_recipes_and_ingredients

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    @burger.add_ingredient(@ground_beef, 4)
    @burger.add_ingredient(@bun, 100)

    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)

    expected = [
      {:name=>"Mac and Cheese",
        :details=>
        {:ingredients=>[ {:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}],
         :total_calories=>440}
      },
      {:name=>"Burger",
        :details=>
        {:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}],
         :total_calories=>500}
      }
    ]

    assert_equal expected, @cookbook.summary
  end

end
