require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < MiniTest::Test

  def setup
    @ingredient = Ingredient.new("Flour", "Cup", 455)
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

end
