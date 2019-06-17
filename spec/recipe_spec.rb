require 'recipe'

# Recipe class has instance readers :name, :ingredients
describe Recipe do
  describe '#name' do
    context 'the instance method "name"' do
      it 'returns the recipe name' do
        expect(Recipe.new('pizza').name).to eql('pizza')
      end
    end

    context 'the instance method "ingredients"' do
      it 'returns the recipe ingredients' do
        expect(Recipe.new('pizza', %w[bread cheese tomato]).ingredients).to eql(%w[bread cheese tomato])
      end
    end

  end
end
