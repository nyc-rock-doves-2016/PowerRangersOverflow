class Tag < ActiveRecord::Base
  has_many :tag_questions
  has_many :questions, through: :tag_questions

  validates :content, presence: true

end
