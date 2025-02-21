require 'swagger_helper'

RSpec.describe 'Volcanos API', type: :request do

  path '/volcanos' do
    get 'Retrieves all volcanoes' do
      tags 'Volcanoes'
      produces 'application/json'

      response '200', 'volcanoes found' do
        schema type: :array, items: { '$ref' => '#/components/schemas/Volcano' }
        run_test!
      end
    end
  end

  path '/volcanos/{id}' do
    get 'Retrieves a single volcano' do
      tags 'Volcanoes'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, required: true

      response '200', 'volcano found' do
        schema '$ref' => '#/components/schemas/Volcano'
        run_test!
      end

      response '404', 'volcano not found' do
        run_test!
      end
    end
  end
end
