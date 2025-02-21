class Volcano < ApplicationRecord
    validates :volcano_name, presence: true
    
    def self.cached_all
        Rails.cache.fetch("volcanos_all", expires_in: ENV.fetch("CACHE_EXPIRY") { 6.hours }) do
            all.to_a
        end
    end
    
      
end
