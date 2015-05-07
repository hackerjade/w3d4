class Response < ActiveRecord::Base
  validates :answer_id, :user_id, presence: true

  belongs_to(:answer)
  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )
end
