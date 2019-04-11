require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < MiniTest::Test

  def setup
    @ingredient_1 = Ingredient.new("Flour", "Cup", 450)
    @ingredient_2 = Ingredient.new("Sugar", "Cup", 770)
    @ingredient_3 = Ingredient.new("Egg", "Each", 80)
    
    @recipe = Recipe.new("Chocolate Cake")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_has_a_name
    assert_equal "Chocolate Cake", @recipe.name
  end

  def test_by_default_it_has_no_ingredients
    assert_empty @recipe.ingredients
  end

  def test_it_can_add_ingredients
    @recipe.add_ingredient(@ingredient_1, 3)
    @recipe.add_ingredient(@ingredient_2, 3)
    @recipe.add_ingredient(@ingredient_3, 4)

    expected = {@ingredient_1 => 3,
                @ingredient_2 => 3,
                @ingredient_3 => 4}

    assert_equal expected, @recipe.ingredients
  end

  def test_it_can_return_the_quantity_needed_per_ingredient
    @recipe.add_ingredient(@ingredient_1, 3)

    assert_equal 3, @recipe.quantity_needed(@ingredient_1)
  end

  def test_it_can_return_the_total_number_of_calories
    @recipe.add_ingredient(@ingredient_1, 3)
    @recipe.add_ingredient(@ingredient_2, 3)
    @recipe.add_ingredient(@ingredient_3, 4)

    assert_equal 3980, @recipe.total_calories
  end

end
