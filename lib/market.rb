class Market
  attr_reader :name,
              :vendors,
              :vendor_names

  def initialize(name)
    @name = name
    @vendors = []
    @vendor_names = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  

  # def add_vendor_name(vendor_name)
  #   @vendor_names << vendor_name
  # end
end
