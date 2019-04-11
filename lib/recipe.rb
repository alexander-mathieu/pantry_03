class Recipe
  attr_reader :name,
              :ingredients

  def initialize(name)
    @name        = name
    @ingredients = {}
  end

  def add_ingredient(ingredient, quantity)
    @ingredients[ingredient] = quantity
  end

  def quantity_needed(ingredient)
    @ingredients[ingredient]
  end

  def total_calories
    @ingredients.each.sum do |ingredient, quantity|
      ingredient.calories * quantity
    end
  end

end
