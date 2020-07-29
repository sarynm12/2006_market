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
end
