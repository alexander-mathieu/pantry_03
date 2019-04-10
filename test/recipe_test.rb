require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < MiniTest::Test

  def setup
    @ingredient_1 = Ingredient.new(name: "Flour", unit: "Cup", calories: 450, amount_needed: 0, on_hand: 0)
    @ingredient_2 = Ingredient.new(name: "Sugar", unit: "Cup", calories: 770, amount_needed: 0, on_hand: 0)
    @ingredient_3 = Ingredient.new(name: "Egg", unit: "Each", calories: 80, amount_needed: 0, on_hand: 0)
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

    expected = {"Flour"  => @ingredient_1,
                "Sugar"  => @ingredient_2,
                "Egg" => @ingredient_3}

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


# Use TDD to build a `Recipe` class that responds to the following:

# * The recipe should be able to check the quantity needed of a given ingredient to make that recipe.
# * The recipe should be able to find the total number of calories in that dish.
