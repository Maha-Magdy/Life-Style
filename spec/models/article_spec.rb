require 'rails_helper'

RSpec.describe Article, type: :model do
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
                                        
      expect(new_article).to be_valid
    end

    it 'will not be accepted if the title is not provided' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
        password: '123456', password_confirmation: '123456')
      new_article = Article.new(author: new_user,
                                text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, 
                                       molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                       numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                      optio, eaque rerum! Provident similique accusantium nemo autem.')
      expect(new_article).to_not be_valid
    end

    it 'will not be accepted if the provided title exceed the maximum length' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
        password: '123456', password_confirmation: '123456')
      new_user.save
      new_article = Article.new(author: new_user,
                                title: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, 
                                        molestiae quas vel sint commodi repudiandae consequuntur.',
                                text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, 
                                        molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                        numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                        optio, eaque rerum! Provident similique accusantium nemo autem.')
      expect(new_article).to_not be_valid
    end

    it 'will not be accepted if the text is not provided' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
        password: '123456', password_confirmation: '123456')
      new_article = Article.new(author: new_user, title: 'London Journey')
      expect(new_article).to_not be_valid
    end

    it 'will not be accepted if the author_id is not provided' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
        password: '123456', password_confirmation: '123456')
      new_article = Article.new(title: 'London Journey',
                                text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, 
                                       molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                       numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                       optio, eaque rerum! Provident similique accusantium nemo autem.')
      expect(new_article).to_not be_valid
    end
  end
end
