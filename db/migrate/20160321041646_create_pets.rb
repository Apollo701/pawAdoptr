class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :species
      t.string :name
      t.text :bio
      t.string :breed
      t.integer :sex
      t.integer :age
      t.integer :size
      t.integer :weight
      t.integer :fixed

      t.timestamps null: false
    end
  end
end
