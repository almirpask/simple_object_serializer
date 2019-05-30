require 'simple_object_serializer/view_helper'
require 'faker'

RSpec.describe SimpleObjectSerializer::ViewHelper do
  subject(:view_helper) {SimpleObjectSerializer::ViewHelper.new}
  let(:user) {{
    id: rand(30),
    name: Faker::Name.name,
    email: Faker::Internet.email
  }}
  let(:product) {{
    id: rand(30),
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    material: Faker::Commerce.material
  }}
  let(:animals) { ['dog', 'cat', 'dolphin'] }

  it 'remove some attributes' do
    serialized = view_helper.serialize_objects({user: user, product: product}, {user: [:name], product: [:name, :material]})
    expect(serialized[:user][:name]).to eq(user[:name])
    expect(serialized[:user]).to_not eq(user)
  end
  it 'allow to pass a full object with empty params' do
    serialized = view_helper.serialize_objects({user: user, product: product}, {user: [:name], product: []})
    expect(serialized[:product][:name]).to eq(product[:name])
  end
  it 'allow to pass a full array with empty params' do
    serialized = view_helper.serialize_objects({user: user, product: product, animals: animals}, {user: [:name], product: [], animals: []})
    expect(serialized[:animals].first).to eq('dog')
  end
end
