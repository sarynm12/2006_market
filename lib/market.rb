require 'date'

class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.keys.include?(item)
    end
  end

  def total_inventory
    result = {}
    items = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end.uniq
    items.each do |item|
      total = vendors_that_sell(item).sum do |vendor|
        vendor.inventory[item]
      end
      result[item] = {quantity: total, vendors: vendors_that_sell(item)}
    end
    result
  end

  def overstocked_items
    result = []
    total_inventory.each do |item, info|
      result << item if total_inventory[item][:quantity] > 50 && total_inventory[item][:vendors].count > 1
    end
    result
  end

  def sorted_item_list
    sorted = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end
    sorted.flat_map do |item|
      item.name
    end.uniq.sort
  end

  def date
    date = DateTime.now.strftime("%d/%m/%Y")
  end

  def sell(item, amount)
    if total_inventory[item][:quantity] > amount
      true
    else
      false
    end
  end

end
