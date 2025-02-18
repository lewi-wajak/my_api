class Volcano < ApplicationRecord
    validates :volcano_name, presence: true
end
