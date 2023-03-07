class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    check_stock = 0
  end

  def stock(item, number_of_items)
    @inventory[item] += number_of_items
  end
end
