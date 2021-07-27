class Category < ApplicationRecord
    has_and_belongs_to_many :articles, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    validates :priority, presence: true, uniqueness: true

    scope :ordered_by_priority, -> { order(:priority)}
end
