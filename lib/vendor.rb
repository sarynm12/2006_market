class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @stock = Hash.new(0)
  end

  def check_stock(item)
    @stock[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
    @stock[item] += quantity
  end

  def potential_revenue
    total = 0
    @inventory.each do |item, amount|
    total += (item.price * amount.to_f)
    end
  total
  end

end
