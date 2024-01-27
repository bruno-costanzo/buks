# frozen_string_literal: true

json.array! @books_copies, partial: 'books_copies/books_copy', as: :books_copy
