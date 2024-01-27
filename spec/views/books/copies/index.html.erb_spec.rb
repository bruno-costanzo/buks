# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/copies/index', type: :view do
  before(:each) do
    assign(:books_copies, [
             Books::Copy.create!(
               book: nil,
               user: nil,
               condition: 2
             ),
             Books::Copy.create!(
               book: nil,
               user: nil,
               condition: 2
             )
           ])
  end

  it 'renders a list of books/copies' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
