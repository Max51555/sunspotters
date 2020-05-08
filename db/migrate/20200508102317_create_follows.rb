class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :user, foreign_key: true
      t.integer :following, foreign_key: true

      t.timestamps
    end
  end
end
