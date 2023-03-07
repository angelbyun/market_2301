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

    expect(vendor.check_stock(item1)).to eq(0)
  end

  it 'add stock to inventory' do
    vendor = Vendor.new('Rocky Mountain Fresh')
    item1 = Item.new({name: 'Peach', price: '$0.75'})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    vendor.stock(item1, 30)

    expect(vendor.inventory).to eq({
      item1 => 30
    })
  end
end