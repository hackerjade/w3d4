class QuestionAnswer < ActiveRecord::Base
  validates :question_id, presence: true
  validates :answer_id, presence: true, uniqueness: true

  belongs_to(:question)
  belongs_to(:answer)
end
