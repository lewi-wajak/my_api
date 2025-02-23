module Types
    class DeleteVolcanoInputType < GraphQL::Schema::InputObject
      graphql_name 'DeleteVolcanoInput'
  
      argument :id, ID, required: true
    end
  end
  