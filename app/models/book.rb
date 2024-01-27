# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :copies, dependent: :destroy, class_name: 'Books::Copy'

  def self.find_or_create_by_isbn(isbn)
    find_by(isbn:) || Books::Creator.new(isbn:).call
  end
end
