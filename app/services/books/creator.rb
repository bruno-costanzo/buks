# frozen_string_literal: true

module Books
  class Creator
    def initialize(isbn:)
      @isbn = isbn
    end

    def call
      Book.create!(book_params)
    end

    private

    attr_reader :isbn

    def book_params
      {
        isbn:,
        title: volume_info['title'],
        description: volume_info['description'],
        image_url: volume_info['imageLinks']['thumbnail'],
        small_image_url: volume_info['imageLinks']['smallThumbnail'],
        published_date: volume_info['publishedDate'],
        pages: volume_info['pageCount']
      }
    end

    def volume_info
      @volume_info ||= get_book_info_from_google
    end

    def get_book_info_from_google
      url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"
      response = HTTParty.get(url)
      if response.success?
        data = response.parsed_response
        return data['items'].first['volumeInfo'] if data['items']&.any?
      end

      nil
    end
  end
end
