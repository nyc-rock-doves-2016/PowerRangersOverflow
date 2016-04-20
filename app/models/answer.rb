class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :users
  belongs_to :questions
  # has_many :comments
  has_many :votes
  # has_many :comments, as: :commentable

  validates :content, presence: true
end
