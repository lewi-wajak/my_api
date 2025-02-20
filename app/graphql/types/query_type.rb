module Types
  class QueryType < Types::BaseObject
    field :volcano, Types::VolcanoType, null: true do
      argument :id, ID, required: true
    end

    field :volcanoes, [Types::VolcanoType], null: true do
      argument :country, String, required: false
      argument :primary_volcano_type, String, required: false
      argument :activity_evidence, String, required: false
    end

    def volcano(id:)
      Volcano.find_by(id: id)
    end

    def volcanoes(country: nil, primary_volcano_type: nil, activity_evidence: nil)
      scope = Volcano.all
      scope = scope.where(country: country) if country
      scope = scope.where(primary_volcano_type: primary_volcano_type) if primary_volcano_type
      scope = scope.where(activity_evidence: activity_evidence) if activity_evidence
      scope
    end
  end
end
