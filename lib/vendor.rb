class Vendor
  attr_reader :name,
              :inventory,
              :check_stock

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @check_stock = 0
  end

  def add_stock(item)
    @check_stock += item
  end

  def stock(item, number_of_items)
    @inventory[item] += number_of_items
  end
end
