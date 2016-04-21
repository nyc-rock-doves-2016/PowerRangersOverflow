class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :user_id, null: false, index: true
      t.references :votable, polymorphic: true, index: true
    end
  end
end
