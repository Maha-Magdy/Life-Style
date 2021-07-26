require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'will be accepted if the all the needed properties provided' do
      new_category = Category.new(name: 'Fashion', priority: 1)
      expect(new_category).to be_valid
    end

    it 'will not be accepted if the given priority not unique' do
      new_first_category = Category.new(name: 'Fashion', priority: 1)
      new_first_category.save

      new_second_category = Category.new(name: 'Entertainment', priority: 1)

      expect(new_second_category).to_not be_valid
    end

    it 'will not be accepted if the given name not unique' do
      new_first_category = Category.new(name: 'Fashion', priority: 1)
      new_first_category.save

      new_second_category = Category.new(name: 'Fashion', priority: 2)

      expect(new_second_category).to_not be_valid
    end
  end
end
