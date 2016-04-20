class CreateTagQuestions < ActiveRecord::Migration
  def change
    create_table :tag_questions do |t|
      t.references :tag
      t.references :question

      t.timestamp null: false
    end
  end
end
