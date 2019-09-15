require 'rails_helper'
require 'red_sky'

RSpec.describe RedSky do
  it 'returns a name for a product id' do
    expect(RedSky.product(13860428)).to eq({id: 13860428, name: 'The Big Lebowski (Blu-ray)'})
    expect(RedSky.product(54136584)).to eq({id: 54136584, name: "Yoshi's Crafted World - Nintendo Switch"})
  end

  it 'does not return a name for a product id' do
    expect(RedSky.product(15117729)).to eq(nil)
    expect(RedSky.product(16483589)).to eq(nil)
  end
end