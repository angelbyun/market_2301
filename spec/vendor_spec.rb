require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  it 'exists' do
    vendor = Vendor.new('Rocky Mountain Fresh')
    item1 = Item.new({name: 'Peach', price: '$0.75'})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    expect(vendor).to be_a(Vendor)
    expect(vendor.name).to eq('Rocky Mountain Fresh')
  end
end