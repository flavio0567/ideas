class Post < ApplicationRecord
  belongs_to :user

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  validates :content, presence: true

end
