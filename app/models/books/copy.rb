# frozen_string_literal: true

module Books
  class Copy < ApplicationRecord
    belongs_to :book
    belongs_to :user
  end
end
