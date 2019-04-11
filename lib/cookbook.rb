class Cookbook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
  end

  def summary
    hash = {}
    hash[:name]    = nil
    hash[:details] = nil
    @recipes.each do |recipe|
      require "pry"; binding.pry
    end
  end

end
