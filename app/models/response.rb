class Response < ActiveRecord::Base
  validates :answer_id, :user_id, presence: true
  validate :user_has_not_already_answered_question
  validate :user_cannot_respond_in_own_poll

  belongs_to(:answer)
  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer,
    source: :question
  )

  def sibling_responses
    self.question.responses.where("responses.id != ? OR ? IS NULL", self.id, self.id)
  end


    private

      def user_has_not_already_answered_question
        if sibling_responses.exists?(:user_id => self.user_id)
          errors[:base] << "This user has already answered this question."
        end
      end

      def user_cannot_respond_in_own_poll
        if question.poll.author_id == self.user_id
          errors[:base] << "You can't rig the game son!"
        end
      end
end
