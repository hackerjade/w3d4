class Answer < ActiveRecord::Base
  validates :text, presence: true

  has_one(:question_answer)

  has_one(
    :question,
    through: :question_answer,
    source: :question
  )

  has_many(:responses)
end
