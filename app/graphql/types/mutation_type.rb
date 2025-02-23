# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_volcano, mutation: Mutations::CreateVolcano
    field :update_volcano, mutation: Mutations::UpdateVolcano
    field :delete_volcano, mutation: Mutations::DeleteVolcano
  end
end
