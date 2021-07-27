require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    it 'will be accepted if all the needed properties provided' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com', password: '123456', password_confirmation: '123456')

      new_user.save

      new_article = Article.new(author: new_user, title: 'London Journey',
                                text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                                       molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                       numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                       optio, eaque rerum! Provident similique accusantium nemo autem.')
      new_article.save

      new_vote = Vote.new(user: new_user, article: new_article)

      expect(new_vote).to be_valid
    end

    it 'will not be accepted if the same user try to vote more than once on the same article' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                          password: '123456', password_confirmation: '123456')
      new_user.save

      new_article = Article.new(author: new_user, title: 'London Journey',
                                text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                                       molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                       numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                       optio, eaque rerum! Provident similique accusantium nemo autem.')
      new_article.save

      new_first_vote = Vote.new(user: new_user, article: new_article)
      new_first_vote.save

      new_second_vote = Vote.new(user: new_user, article: new_article)

      expect(new_second_vote).to_not be_valid
    end
  end
end
