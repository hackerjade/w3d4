class User < ActiveRecord::Base
  validates :name, presence: true

  has_many(
    :authored_polls,
    class_name: 'Poll',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(:responses)
end


([<<-SQL, self.id, self.responses.length])
SELECT
  polls.title, COUNT(poll_questions.question_id)
FROM
  polls
LEFT OUTER JOIN
  poll_questions ON polls.id = poll_questions.poll_id
LEFT OUTER JOIN
  question_answers ON question_answers.question_id = poll_questions.question_id
LEFT OUTER JOIN
  (SELECT
    *
  FROM
    responses
  WHERE
    user_id = 2) AS my_responses
    ON question_answers.answer_id = my_responses.answer_id
GROUP BY
  polls.id
HAVING
  COUNT(*) = 2;
