class Question < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, presence: true
  has_many :comments, as: :commentable
  has_many :answers
  has_many :tag_questions
  has_many :tags, through: :tag_questions
  has_many :votes, as: :votable

  def points
    votes.sum(:value)
  end
end
