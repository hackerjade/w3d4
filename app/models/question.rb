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

  has_many(
    :responses,
    through: :answers,
    source: :responses
  )


  def results_HGHGHG
    results = {}
    answers.includes(:responses).each do |answer|
      results[answer.text] = answer.responses.length
    end
    results
    # SELECT
    #   answers.text, COUNT(responses.user_id)
    # FROM
    #   answers
    # JOIN
    #   question_answers ON question_answers.answer_id = answers.id
    # LEFT OUTER JOIN
    #   responses ON responses.answer_id = answers.id
    # WHERE
    #   question_answers.question_id = 2
    # GROUP BY
    #   answers.id

  end

  def results
    results = {}
    question_results = Question.find_by_sql([<<-SQL, self.id])
    SELECT
      answers.text, COUNT(responses.user_id) AS votes
    FROM
      answers
    JOIN
      question_answers ON question_answers.answer_id = answers.id
    LEFT OUTER JOIN
      responses ON responses.answer_id = answers.id
    WHERE
      question_answers.question_id = ?
    GROUP BY
      answers.id;
    SQL
    question_results.map {|entry| results[entry.text] = entry.votes }
    results
  end
end
