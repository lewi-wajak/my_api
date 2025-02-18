class CreateVolcanos < ActiveRecord::Migration[8.0]
  def change
    create_table :volcanos do |t|
      t.string :volcano_name
      t.string :country
      t.float :latitude
      t.float :longitude
      t.integer :elevation
      t.string :primary_volcano_type
      t.string :activity_evidence
      t.string :last_known_eruption
      t.integer :year
      t.integer :month
      t.integer :day
      t.string :tsu
      t.string :eq
      t.string :vei
      t.integer :deaths
      t.float :damage_mil
      t.integer :houses_destroyed
      t.integer :total_deaths
      t.float :total_damage_mil

      t.timestamps
    end
  end
end
