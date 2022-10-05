require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'Menu model' do
    @user = User.create(first_name: 'Admin', last_name: 'Admin', email: 'admin@admin.com', password: 'admin123')
    subject do
      Menu.new(admin_id: @user, name: 'Flour', category: 'vegetarian', price: 20, description: 'A vegeterian dish',
               image: 'https://testimage.com')
    end
    before { subject.save }

    it 'should check if the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check if the category is not blank' do
      subject.category = nil
      expect(subject).to_not be_valid
    end

    it 'should checks if the price is not empty' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'should checks if the description is not empty' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'should checks if the image is not blank' do
      subject.image = nil
      expect(subject).to_not be_valid
    end
  end
end
