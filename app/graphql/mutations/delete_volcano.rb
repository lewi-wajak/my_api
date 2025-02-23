module Mutations
    class DeleteVolcano < Mutations::BaseMutation
      argument :input, Types::DeleteVolcanoInputType, required: true
  
      field :volcano, Types::VolcanoType, null: true
      field :errors, [String], null: false
  
      def resolve(input:)
        volcano = Volcano.find_by(id: input[:id])
        
        if volcano&.destroy
          { volcano: volcano, errors: [] }
        else
          { volcano: nil, errors: ["Volcano not found or could not be deleted"] }
        end
      end
    end
  end
  