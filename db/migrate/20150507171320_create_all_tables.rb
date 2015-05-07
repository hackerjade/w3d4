class CreateAllTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, NOT NULL

      t.timestamps
    end

    add_index(:users, :name, unique: true)

    create_table :polls do |t|
      t.string :title, NOT NULL
      t.integer :author_id, NOT NULL

      t.timestamps
    end

    add_index(:polls, [:author_id, :title])

    create_table :poll_questions do |t|
      t.integer :poll_id, NOT NULL
      t.integer :question_id, NOT NULL

      t.timestamps
    end

    add_index(:poll_questions, [:poll_id, :question_id])

    create_table :questions do |t|
      t.string :text, NOT NULL

      t.timestamps
    end

    create_table :question_answers do |t|
      t.integer :question_id, NOT NULL
      t.integer :answer_id, NOT NULL

      t.timestamps
    end

    add_index(:question_answers, [:question_id, :answer_id])

    create_table :answers do |t|
      t.string :text, NOT NULL

      t.timestamps
    end

    create_table :responses do |t|
      t.integer :answer_id, NOT NULL
      t.integer :user_id, NOT NULL

      t.timestamps
    end

    add_index(:responses, [:answer_id, :user_id])
  end
end
