class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true, uniqueness: true

  has_many :articles, class_name: :Article, foreign_key: 'author_id'

  has_many :votes, dependent: :destroy
  has_many :voted_article, through: :votes, source: :article
end
