class CreateTagQuestions < ActiveRecord::Migration
  def change
    create_table :tag_questions do |t|
      t.references :tag
      t.references :question

      t.timestamps
    end
  end
end
