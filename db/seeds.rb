# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

notch = User.create!(name: 'Notch')
marie = User.create!(name: 'Marie Antoninette')
tiget = User.create!(name: 'Tony the Tiger')

minefish = Poll.create!(title: "HOW I MINE FOR FISH!!!!1!!one", author_id: notch.id)
headwhere = Poll.create!(title: "Where do YOU think my head is?", author_id: marie.id)
games = Poll.create!(title: "Game Poll: Mega over nine thousand edition", author_id: notch.id)

minefishq1 = Question.create!(text: "WHAT IS HAT")
minefishq2 = Question.create!(text: "WHERE IS LOVE")

headwhereq1 = Question.create!(text: "Is it in russia?")
headwhereq2 = Question.create!(text: "Is it in the Louvre?")
headwhereq3 = Question.create!(text: "Am I sitting on it?")

gamepollq1 = Question.create!(text: "What's a cool game you like to play?")

  PollQuestion.create!(poll_id: 1, question_id: 1)
  PollQuestion.create!(poll_id: 1, question_id: 2)

  PollQuestion.create!(poll_id: 2, question_id: 3)
  PollQuestion.create!(poll_id: 2, question_id: 4)
  PollQuestion.create!(poll_id: 2, question_id: 5)

  PollQuestion.create!(poll_id: 3, question_id: 6)

mfq1a1 = Answer.create!(text: "A thing you where on your head.")

mfq2a1 = Answer.create!(text: "It's kinda rubbish")
mfq2a2 = Answer.create!(text: "BABY DON'T HURT ME")
mfq2a3 = Answer.create!(text: "Not in the game yet. It's coming next patch.")

hwq1a1 = Answer.create!(text: "Da")
hwq1a2 = Answer.create!(text: "Net")

hwq2a1 = Answer.create!(text: "Oui")
hwq2a2 = Answer.create!(text: "Non")

hwq3a1 = Answer.create!(text: "MMMMMMFFFMM")
hwq3a2 = Answer.create!(text: "That's ridiculous: a head and a chair look nothing alike.")

gq1a1 = Answer.create!(text: "Minecraft.")


  QuestionAnswer.create!(question_id: 1,answer_id: 1)

  QuestionAnswer.create!(question_id: 2,answer_id: 2)
  QuestionAnswer.create!(question_id: 2,answer_id: 3)
  QuestionAnswer.create!(question_id: 2,answer_id: 4)

  QuestionAnswer.create!(question_id: 3,answer_id: 5)
  QuestionAnswer.create!(question_id: 3,answer_id: 6)

  QuestionAnswer.create!(question_id: 4,answer_id: 7)
  QuestionAnswer.create!(question_id: 4,answer_id: 8)

  QuestionAnswer.create!(question_id: 5,answer_id: 9)
  QuestionAnswer.create!(question_id: 5,answer_id: 10)

  QuestionAnswer.create!(question_id: 6,answer_id: 11)


Response.create!(user_id: 3, answer_id: 1)
Response.create!(user_id: 3, answer_id: 3)
Response.create!(user_id: 3, answer_id: 6)
Response.create!(user_id: 3, answer_id: 8)
Response.create!(user_id: 3, answer_id: 10)
Response.create!(user_id: 3, answer_id: 11)

Response.create!(user_id: 2, answer_id: 1)
Response.create!(user_id: 2, answer_id: 11)
