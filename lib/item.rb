class Item
  attr_reader :name,
              :price,
              :value

  def initialize(item_info)
    @name = item_info[:name]
    @price = item_info[:price].delete('$').to_f
  end
end
