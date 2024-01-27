# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Books::CopiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/books/copies').to route_to('books/copies#index')
    end

    it 'routes to #new' do
      expect(get: '/books/copies/new').to route_to('books/copies#new')
    end

    it 'routes to #show' do
      expect(get: '/books/copies/1').to route_to('books/copies#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/books/copies/1/edit').to route_to('books/copies#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/books/copies').to route_to('books/copies#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/books/copies/1').to route_to('books/copies#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/books/copies/1').to route_to('books/copies#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/books/copies/1').to route_to('books/copies#destroy', id: '1')
    end
  end
end
