require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  it 'exists' do
    vendor = Vendor.new('Rocky Mountain Fresh')
    item1 = Item.new({name: 'Peach', price: '$0.75'})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    expect(vendor).to be_a(Vendor)
    expect(vendor.name).to eq('Rocky Mountain Fresh')
    expect(vendor.inventory).to eq({})
  end

  it 'checks stock of item' do
    vendor = Vendor.new('Rocky Mountain Fresh')
    item1 = Item.new({name: 'Peach', price: '$0.75'})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    expect(vendor.check_stock).to eq(0)
  end

  it 'adds inventory' do
    vendor = Vendor.new('Rocky Mountain Fresh')
    item1 = Item.new({name: 'Peach', price: '$0.75'})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    vendor.stock(item1, 30)

    expect(vendor.inventory).to eq({
      item1 => 30
    })
  end

  it 'adds stocks' do
    vendor = Vendor.new('Rocky Mountain Fresh')
    item1 = Item.new({name: 'Peach', price: '$0.75'})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    vendor.add_stock(30)

    expect(vendor.check_stock).to eq(30)
  end

  it 'adds more inventory' do
    vendor = Vendor.new('Rocky Mountain Fresh')
    item1 = Item.new({name: 'Peach', price: '$0.75'})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    vendor.stock(item1, 30)
    vendor.stock(item1, 25)
    vendor.add_stock(55)
    vendor.stock(item2, 12)

    expect(vendor.check_stock).to eq(55)
    expect(vendor.inventory).to eq({
      item1 => 55,
      item2 => 12
    })
  end
end