# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/copies/edit', type: :view do
  let(:books_copy) do
    Books::Copy.create!(
      book: nil,
      user: nil,
      condition: 1
    )
  end

  before(:each) do
    assign(:books_copy, books_copy)
  end

  it 'renders the edit books_copy form' do
    render

    assert_select 'form[action=?][method=?]', books_copy_path(books_copy), 'post' do
      assert_select 'input[name=?]', 'books_copy[book_id]'

      assert_select 'input[name=?]', 'books_copy[user_id]'

      assert_select 'input[name=?]', 'books_copy[condition]'
    end
  end
end
