module Types
    class VolcanoType < Types::BaseObject
      field :id, ID, null: false
      field :volcano_name, String, null: false
      field :country, String, null: false
      field :latitude, Float, null: true
      field :longitude, Float, null: true
      field :elevation, Integer, null: true
      field :primary_volcano_type, String, null: true
      field :activity_evidence, String, null: true
      field :last_known_eruption, String, null: true
      field :year, Integer, null: true
      field :month, Integer, null: true
      field :day, Integer, null: true
      field :tsu, String, null: true
      field :eq, String, null: true
      field :vei, Integer, null: true
      field :deaths, Integer, null: true
      field :damage_mil, Float, null: true
      field :houses_destroyed, Integer, null: true
      field :total_deaths, Integer, null: true
      field :total_damage_mil, Float, null: true
    end
end
  