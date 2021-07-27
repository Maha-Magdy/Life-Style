require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'will be accepted if all the needed properties provided' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                          password: '123456', password_confirmation: '123456')
      new_user.save
      
      new_article = Article.new(author: new_user, title: 'London Journey',
                                text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, 
                                        molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                        numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                        optio, eaque rerum! Provident similique accusantium nemo autem.')

      new_article.save

      new_comment = Comment.new(user: new_user, article: new_article, content: "Lorem ipsum dolor sit amet consectetur adipisicing elit.")
                                        
      expect(new_comment).to be_valid
    end

    it 'will not be accepted if the user is not provided' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
        password: '123456', password_confirmation: '123456')
      new_user.save

      new_article = Article.new(author: new_user, title: 'London Journey',
        text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, 
                molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                optio, eaque rerum! Provident similique accusantium nemo autem.')

      new_article.save

      new_comment = Comment.new(article: new_article, content: "Lorem ipsum dolor sit amet consectetur adipisicing elit.")
                
      expect(new_comment).to_not be_valid
    end

    it 'will not be accepted if the article is not provided' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                          password: '123456', password_confirmation: '123456')
      new_user.save

      new_comment = Comment.new(user: new_user, content: "Lorem ipsum dolor sit amet consectetur adipisicing elit.")
                                        
      expect(new_comment).to_not be_valid
    end

    it 'will not be accepted if the provided content exceed the maximum length, which is 200' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                          password: '123456', password_confirmation: '123456')
      new_user.save
      
      new_article = Article.new(author: new_user, title: 'London Journey',
                                text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, 
                                        molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                        numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                        optio, eaque rerum! Provident similique accusantium nemo autem.')

      new_article.save

      new_comment = Comment.new(user: new_user, article: new_article, 
                                content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, 
                                          molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                          numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                          optio, eaque rerum! Provident similique accusantium nemo autem.")
                                        
      expect(new_comment).to_not be_valid
    end
  end
end
