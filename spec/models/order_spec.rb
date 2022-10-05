require 'rails_helper'

RSpec.describe Order, type: :model do
  @user = User.create(first_name: 'Eid', last_name: 'Hachem', role: 'admin', email: 'new@test.com', password: '123456')
  @menu = Menu.create(name: 'Main menu', category: "vegetarian", price: 50.5, image: 'https://testimage', description: 'Small',
                      admin_id: @user)
  subject { Order.new(user_id: @user, menu_id: @menu) }
  before { subject.save }

  it 'reservation or order should have a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'the menu ordered should be present' do
    subject.menu_id = nil
    expect(subject).to_not be_valid
  end
end
