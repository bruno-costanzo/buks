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
        title: dig_volume_info(%w[title]),
        description: dig_volume_info(%w[description]),
        image_url: dig_volume_info(%w[imageLinks thumbnail]),
        small_image_url: dig_volume_info(%w[imageLinks smallThumbnail]),
        published_date: dig_volume_info(%w[publishedDate]),
        pages: dig_volume_info(%w[pageCount]),
      }
    end

    def dig_volume_info(keys)
      keys.reduce(volume_info) do |memo, key|
        memo&.dig(key)
      end
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
