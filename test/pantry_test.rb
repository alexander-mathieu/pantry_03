require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < MiniTest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "Cup", 50)
    @mac = Ingredient.new("Macaroni", "Oz", 200)

    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_by_default_it_has_no_stock
    assert_empty @pantry.stock
  end

  def test_it_can_check_stock
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_it_can_restock_ingredients
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_can_check_it_has_enough_ingredients_to_make_a_dish
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    refute @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 8)

    assert @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

end
