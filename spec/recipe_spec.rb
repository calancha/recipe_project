require 'recipe'

# Add instance variables to share in the tests
RSpec.configure do |config|
  config.before(:example) do
    @recipe_name = 'pizza'
    @pizza_ingredients = %w[bread cheese tomato]
    @pizza = Recipe.new(@recipe_name, @pizza_ingredients)
  end
end

# Recipe class has instance readers :name, :ingredients
describe Recipe do
  describe '#name' do
    context 'the instance method "name"' do
      it 'returns the recipe name' do
        expect(@pizza.name).to eql(@recipe_name)
      end
    end

    context 'the instance method "ingredients"' do
      it 'returns the recipe ingredients' do
        expect(@pizza.ingredients).to eql(@pizza_ingredients)
      end
    end

  end
end

# Method ingredient appends a given ingredient to its recipe
describe Recipe do
  describe '#ingredient' do
    before(:example) do
      @hawaian_pizza = Recipe.new('hawaian pizza', @pizza_ingredients)
      extra_ingredient = 'pineapple' # Sorry hawaians!
      @hawaian_pizza.ingredient(extra_ingredient)
      @hawaian_pizza_ingredients = @pizza_ingredients + [extra_ingredient]
    end
    context 'the instance method "ingredient"' do
      it 'adds a new ingredient to its recipe' do
        expect(@hawaian_pizza.ingredients).to eql(@hawaian_pizza_ingredients)
      end
    end
  end
end
