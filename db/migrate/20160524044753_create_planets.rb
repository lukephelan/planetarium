class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :diameter
      t.boolean :solid
      t.integer :order
      t.boolean :rings, default: false
      t.boolean :explored, default: false
      t.integer :moons
      t.string :image
      t.string :atmosphere
      t.integer :distance_from_sun
      t.timestamps null: false
    end
  end
end
