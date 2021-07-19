class Article < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100,
                                                too_long: '100 characters in article\'s title is the maximum allowed.' }

    belongs_to :author, class_name: 'User' 
    has_one_attached :photo
    has_many :votes, dependent: :destroy
end
