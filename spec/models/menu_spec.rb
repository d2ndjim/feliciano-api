require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'Menu model' do
    @user = User.create(first_name: 'Test', last_name: 'Test', email: 'test@user.com', password: 'lakaka12')
    subject { Menu.new(name: 'Menu1', category: "vegetarian", price: 100, image: 'https://testimage', description: 'First Hall', admin_id: @user) }
    before { subject.save }

    it 'should check if the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check if the capacity is not blank' do
      subject.category = nil
      expect(subject).to_not be_valid
    end

    it 'should checks if the cost is not empty' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'should checks if the image is not empty' do
      subject.image = nil
      expect(subject).to_not be_valid
    end

    it 'should checks if the description is not empty' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end
end
