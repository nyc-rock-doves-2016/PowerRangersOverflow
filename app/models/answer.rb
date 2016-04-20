class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question
  # has_many :comments
  has_many :votes
  # has_many :comments, as: :commentable

  validates :content, presence: true
end
