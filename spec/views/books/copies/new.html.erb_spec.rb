# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/copies/new', type: :view do
  before(:each) do
    assign(:books_copy, Books::Copy.new(
                          book: nil,
                          user: nil,
                          condition: 1
                        ))
  end

  it 'renders new books_copy form' do
    render

    assert_select 'form[action=?][method=?]', books_copies_path, 'post' do
      assert_select 'input[name=?]', 'books_copy[book_id]'

      assert_select 'input[name=?]', 'books_copy[user_id]'

      assert_select 'input[name=?]', 'books_copy[condition]'
    end
  end
end
