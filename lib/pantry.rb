class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    if @stock.keys.include?(ingredient)
      @stock[ingredient]
    else
      0
    end
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients.each do |ingredient, quantity_needed|
      if !@stock.keys.include?(ingredient)
        return false
      elsif @stock[ingredient] < quantity_needed
        return false
      else
        true
      end
    end
  end

end
