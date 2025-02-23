module Mutations
    class UpdateVolcano < BaseMutation
      argument :id, ID, required: true
      argument :volcano_name, String, required: false
      argument :country, String, required: false
      argument :latitude, Float, required: false
      argument :longitude, Float, required: false
      argument :elevation, Integer, required: false
      argument :primary_volcano_type, String, required: false
      argument :activity_evidence, String, required: false
      argument :last_known_eruption, String, required: false
      argument :year, Integer, required: false
      argument :month, Integer, required: false
      argument :day, Integer, required: false
      argument :tsu, String, required: false
      argument :eq, String, required: false
      argument :vei, String, required: false
      argument :deaths, Integer, required: false
      argument :damage_mil, Float, required: false
      argument :houses_destroyed, Integer, required: false
      argument :total_deaths, Integer, required: false
      argument :total_damage_mil, Float, required: false
  
      field :volcano, Types::VolcanoType, null: false
      field :errors, [String], null: false
  
      def resolve(id:, **args)
        volcano = Volcano.find_by(id: id)
        return { volcano: nil, errors: ["Volcano not found"] } unless volcano
  
        if volcano.update(args)
          { volcano: volcano, errors: [] }
        else
          { volcano: nil, errors: volcano.errors.full_messages }
        end
      end
    end
  end
  