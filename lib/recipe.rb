################################################################################
###  Build a Recipe class so that the following code works

# Recipe.describe do
#   recipe 'Hot Cake' do
#     ingredient 'Egg'
#     ingredient 'Flour'
#     ingredient 'Water'
#     ingredient 'Sugar'
#   end

#   recipe 'Miso Soup' do
#     ingredient 'Tofu'
#     ingredient 'Green Chard'
#     ingredient 'Green Onion'
#     ingredient 'White miso paste'
#   end
# end

# hotcake = Recipe.for('Hot Cake')
# puts hotcake.name
# # => Hot Cake
# puts hotcake.ingredients.inspect
# # => ["Egg", "Flour", "Water", "Sugar"]

# soup = Recipe.for('Miso Soup')
# puts soup.name
# # => Miso Soup
# puts soup.ingredients.inspect
# # => ["Tofu", "Green Chard", "Green Onion", "White miso paste"]

################################################################################
class Recipe

  # Class method 'for' must retrieve an existent recipe with a given name.
  # thus, we need a way to keep track of the created recipe instances.
  # Let's use a class variable; a map { :instance_name => instance_object }
  @@recipes = {}
  attr_reader :name, :ingredients
  def initialize(name, ingredients = [])
    @name = name
    @ingredients = ingredients
    @@recipes[name.to_sym] = self
  end

  def ingredient(ingredient)
    @ingredients.push(ingredient) unless @ingredients.include?(ingredient)
  end

  def self.for(recipe_name)
    @@recipes[recipe_name.to_sym]
  end

  def self.describe(&_)
    yield
  end
end

def recipe(recipe_name, &block)
  recipe = Recipe.new(recipe_name)
  # Evaluate the block in the context of 'recipe' instance
  recipe.instance_eval(&block)
end
