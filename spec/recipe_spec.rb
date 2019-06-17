require 'recipe'

# Add instance variables to share in the tests
RSpec.configure do |config|
  config.before(:example) do
    @recipe_name = 'pizza'
    @pizza_ingredients = %w[bread cheese tomato]
    @pizza_barbeque_ingredients = @pizza_ingredients + %w[chicken tabasco]
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
      @hawaian_pizza_ingredients = @hawaian_pizza.ingredients + [extra_ingredient]
      @hawaian_pizza.ingredient(extra_ingredient)
    end
    context 'the instance method "ingredient"' do
      it 'adds a new ingredient to its recipe' do
        expect(@hawaian_pizza.ingredients).to eql(@hawaian_pizza_ingredients)
      end
    end
  end
end

# Class method 'for' returns the existent recipe of a given name
describe Recipe do
  describe '.for' do
    context 'the class method "for"' do
      it 'retrieves the existent recipe with such a name' do
        expect(Recipe.for(@pizza.name)).to equal(@pizza)
      end

      it 'returns nil if no recipe exists with such a name' do
        expect(Recipe.for('Snots Ice Cream')).to be_nil
      end

    end
  end
end

# recipe is a function with signature: recipe(recipe_name, &block)
# it creates a new recipe w/ name recipe_name and executes block in the
# context of the new created object.
describe Recipe do
  describe '.describe' do
    before(:example) do
      pizza_barbeque_ingredients = @pizza_barbeque_ingredients
      pizza_name = 'pizza barbeque'
      recipe pizza_name do
        pizza_barbeque_ingredients.each do |ingredient|
          ingredient ingredient
        end
      end
      @pizza_barbeque = Recipe.for(pizza_name)
    end
    context 'the function recipe creates a new recipe' do
      it 'and evaluates a block within the context of such a recipe' do
        expect(@pizza_barbeque.ingredients).to eql(@pizza_barbeque_ingredients)
      end
    end
  end
end
