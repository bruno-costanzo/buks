# frozen_string_literal: true

json.extract! books_copy, :id, :book_id, :user_id, :condition, :created_at, :updated_at
json.url books_copy_url(books_copy, format: :json)
