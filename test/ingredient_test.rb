require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < MiniTest::Test

  def setup
    @ingredient = Ingredient.new(name: "Flour", unit: "Cup", calories: 455, amount_needed: 0, on_hand: 0)
  end

  def test_it_exists
    assert_instance_of Ingredient, @ingredient
  end

  def test_it_has_a_name
    assert_equal "Flour", @ingredient.name
  end

  def test_it_has_a_unit_of_measurement
    assert_equal "Cup", @ingredient.unit
  end

  def test_it_has_a_calorie_count
    assert_equal 455, @ingredient.calories
  end

  def test_it_has_an_amount_needed
    assert_equal 0, @ingredient.amount_needed
  end

  def test_it_has_an_amount_on_hand
    assert_equal 0, @ingredient.on_hand
  end

end
