class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, null: false
      # t.references :comment

      t.timestamps null: false
    end
  end
end
