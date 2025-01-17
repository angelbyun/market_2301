require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  it 'exists' do
    market = Market.new('South Pearl Street Farmers Market')

    expect(market).to be_a(Market)
    expect(market.name).to eq('South Pearl Street Farmers Market')
  end

  it 'starts with an empty array of vendors' do
    market = Market.new('South Pearl Street Farmers Market')

    expect(market.vendors).to eq([])
  end

  it 'adds vendors' do
    market = Market.new('South Pearl Street Farmers Market')
    vendor1 = Vendor.new('Rocky Mountain Fresh')
    vendor2 = Vendor.new('Ba-Nom-a-Nom')
    vendor3 = Vendor.new('Palisade Peach Shack')
    
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    # market.add_vendor_name('Rocky Mountain Fresh')
    # market.add_vendor_name('Ba-Nom-a-Nom')
    # market.add_vendor_name('Palisade Peach Shack')

    expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    # expect(market.vendor_names).to eq(['Rocky Mountain Fresh', 'Ba-Nom-a-Nom', 'Palisade Peach Shack'])
  end

  it 'adds items to vendor inventory' do
    market = Market.new('South Pearl Street Farmers Market')
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)

    expect(vendor1.inventory).to eq({
      item1 => 35,
      item2 => 7
    })
    expect(vendor2.inventory).to eq({
      item3 => 25,
      item4 => 50
    })
    expect(vendor3.inventory).to eq({
      item1 => 65
    })
  end

  it 'adds potential revenue' do
    market = Market.new('South Pearl Street Farmers Market')
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor1.add_revenue(29.75)
    vendor2.add_revenue(345.00)
    vendor3.add_revenue(48.75)

    expect(vendor1.potential_revenue).to eq(29.75)
    expect(vendor2.potential_revenue).to eq(345.00)
    expect(vendor3.potential_revenue).to eq(48.75)
  end
end