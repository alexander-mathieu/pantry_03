class Recipe
  attr_reader :name,
              :ingredients

  def initialize(name)
    @name        = name
    @ingredients = {}
  end

  def add_ingredient(ingredient, amount)
    ingredient.amount_needed      = amount
    @ingredients[ingredient.name] = ingredient
  end

  def quantity_needed(ingredient)
    @ingredients[ingredient.name].amount_needed
  end

  def total_calories
    @ingredients.values.sum do |ingredient|
      ingredient.calories * ingredient.amount_needed
    end
  end

end
