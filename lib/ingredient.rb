class Ingredient
  attr_reader :name,
              :unit,
              :calories

  attr_accessor :amount_needed,
                :on_hand

  def initialize(ingredient_info)
    @name          = ingredient_info[:name]
    @unit          = ingredient_info[:unit]
    @calories      = ingredient_info[:calories]
    @amount_needed = ingredient_info[:amount_needed]
    @on_hand       = ingredient_info[:on_hand]
  end

end
