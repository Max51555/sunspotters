class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :accessability
      t.integer :dog
      t.integer :car
      t.integer :bench
      t.integer :handicap
      t.integer :isolated
      t.integer :group
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
