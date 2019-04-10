class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock.keys.include?(ingredient.name)
      @stock[ingredient.name].on_hand
    else
      0
    end
  end

  def restock(ingredient, amount)
    @stock[ingredient.name] = ingredient
    if @stock[ingredient.name].on_hand == 0
      ingredient.on_hand = amount
    else
      ingredient.on_hand += amount
    end
    @stock[ingredient.name].on_hand
  end

  def enough_ingredients_for?(recipe)
    # on_hand = @stock.values.each do |value|
    #   value.on_hand
    # end
    # recipe_needs = recipe.ingredients.each do |ingredient|
    #   recipe.quantity_needed(ingredient)
    # end
  end

end
