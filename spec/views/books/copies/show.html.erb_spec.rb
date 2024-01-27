# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/copies/show', type: :view do
  before(:each) do
    assign(:books_copy, Books::Copy.create!(
                          book: nil,
                          user: nil,
                          condition: 2
                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
