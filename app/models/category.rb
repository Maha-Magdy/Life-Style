class Category < ApplicationRecord
    has_and_belongs_to_many :articles, dependent: :destroy

    validates :name, presence: true 
    validates :priority, presence: true, uniqueness: true
end
