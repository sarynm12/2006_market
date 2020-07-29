require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test

  def test_it_exists
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    assert_instance_of Item, item1
  end

  def test_it_has_attributes
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    assert_equal 'Tomato', item2.name
    assert_equal 0.5, item2.price
  end

end



# ## Iteration 1 - Items & Vendors
#
# ```markdown
# There are **4** Possible Points in Iteration 1:
# 1. Item Creation - including all attr_readers
# 2. Vendor Creation - including all attr_readers
# 3. Vendor #check_stock
# 4. Vendor #stock
# ```
#
# The Market will need to keep track of its Vendors and their Items. Each Vendor will be able to report its total inventory, stock items, and return the quantity of items. Any item not in stock should return `0` by default.
#
# Use TDD to create a `Vendor` class that responds to the following interaction pattern:
#
# ```ruby
# pry(main)> require './lib/item'
# #=> true
#
# pry(main)> require './lib/vendor'
# #=> true
#
# #=> #<Item:0x007f9c56740d48...>
#
# #=> #<Item:0x007f9c565c0ce8...>
#
# pry(main)> item2.name
# #=> "Tomato"
#
# pry(main)> item2.price
# #=> 0.5
#
# pry(main)> vendor = Vendor.new("Rocky Mountain Fresh")
# #=> #<Vendor:0x00007f85683152f0...>
#
# pry(main)> vendor.name
# #=> "Rocky Mountain Fresh"
#
# pry(main)> vendor.inventory
# #=> {}
#
# pry(main)> vendor.check_stock(item1)
# #=> 0
#
# pry(main)> vendor.stock(item1, 30)
#
# pry(main)> vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}
#
# pry(main)> vendor.check_stock(item1)
# #=> 30
#
# pry(main)> vendor.stock(item1, 25)
#
# pry(main)> vendor.check_stock(item1)
# #=> 55
#
# pry(main)> vendor.stock(item2, 12)
#
# pry(main)> vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
# ```
