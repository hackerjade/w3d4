class CreateAllTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :presence => true, :uniqueness => true

      t.timestamps
    end

    create_table :polls do |t|
      t.string :title, :presence => true
      t.integer :author_id, :presence => true

      t.timestamps
    end

    create_table :poll_questions do |t|
      t.integer :poll_id, :presence => true
      t.integer :question_id, :presence => true

      t.timestamps
    end

    create_table :questions do |t|
      t.string :text, :presence => true

      t.timestamps
    end

    create_table :question_answers do |t|
      t.integer :question_id, :presence => true
      t.integer :answer_id, :presence => true

      t.timestamps
    end

    create_table :answers do |t|
      t.string :text, :presence => true

      t.timestamps
    end

    create_table :responses do |t|
      t.integer :answer_id, :presence => true, :uniqueness => true
      t.integer :user_id, :presence => true

      t.timestamps
    end
  end
end
