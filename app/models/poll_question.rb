class PollQuestion < ActiveRecord::Base
  validates :poll_id, presence: true
  validates :question_id, presence: true, uniqueness: true

  belongs_to(:poll)
  belongs_to(:question)
end
