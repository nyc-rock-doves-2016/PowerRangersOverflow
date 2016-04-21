class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  has_many :comments
  has_many :commentables, through: :commentable
  has_many :votes

  validates :content, presence: true
end
