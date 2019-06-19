### Instructions

1) Write a `Recipe` class in pure Ruby (no database, and no gems apart from a test library) which will make the code below work
2) The usage of the class should be exactly the same as the snippet
3) Please also write suitable tests. We use RSpec, but you can use any library you like

Feel free to include comments to explain the intention behind what you're doing.

Code:

```ruby
Recipe.describe do
  recipe 'Hot Cake' do
    ingredient 'Egg'
    ingredient 'Flour'
    ingredient 'Water'
    ingredient 'Sugar'
  end

  recipe 'Miso Soup' do
    ingredient 'Tofu'
    ingredient 'Green Chard'
    ingredient 'Green Onion'
    ingredient 'White miso paste'
  end
end

hotcake = Recipe.for('Hot Cake')
puts hotcake.name
# => Hot Cake
puts hotcake.ingredients.inspect
# => ["Egg", "Flour", "Water", "Sugar"]

soup = Recipe.for('Miso Soup')
puts soup.name
# => Miso Soup
puts soup.ingredients.inspect
# => ["Tofu", "Green Chard", "Green Onion", "White miso paste"]
```
