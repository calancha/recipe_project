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

  attr_reader :name, :ingredients
  def initialize(name, ingredients = [])
    @name = name
    @ingredients = ingredients
  end

  def ingredient(ingredient)
    @ingredients.push(ingredient) unless @ingredients.include?(ingredient)
  end
end
