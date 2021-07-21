require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'will be accepted if the all the needed properties provided' do
      new_category = Category.new(name: 'Fashion', priority: 1)
      expect(new_category).to be_valid
    end
  end
end
