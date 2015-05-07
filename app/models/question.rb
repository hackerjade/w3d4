class Question < ActiveRecord::Base
  validates :text, presence: true

  has_one(:poll_question)

  has_one(
    :poll,
    through: :poll_question,
    source: :poll
  )

  has_many(:question_answers)
  
  has_many(
    :answers,
    through: :question_answers,
    source: :answer
  )
end
