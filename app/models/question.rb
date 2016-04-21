class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments
  has_many :comments, as: :commentable
  has_many :answers
  has_many :tag_questions
  has_many :tags, through: :tag_questions


end
