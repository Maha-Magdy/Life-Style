class Article < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100,
                                                too_long: '100 characters in article\'s title is the maximum allowed.' }

    validates :text, presence: true
    validates :author_id, presence: true

    belongs_to :author, class_name: 'User' 

    has_one_attached :photo, dependent: :destroy

    has_many :votes, dependent: :destroy
    has_many :voters, through: :votes, source: :user

    has_many :comments, dependent: :destroy

    has_and_belongs_to_many :categories


    # validates :photo, presence: true
    # validates :categories, presence: true

    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
