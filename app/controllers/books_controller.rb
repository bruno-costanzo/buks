class BooksController < ApplicationController
  def new
    @book = params[:book].present? ? Book.new(book_params) : Book.new
  end

  def create
  end

  def get_info
    isbn = params[:isbn]
    @book = Book.find_by(isbn: isbn)
    @book_info = get_book_info_from_google(isbn)
    @book = Book.new(isbn: isbn)

    binding.pry
    if @book_info
      @book.author = @book_info['volumeInfo']['authors'].join(', ')
      @book.title = @book_info['volumeInfo']['title']
      @book.description = @book_info['volumeInfo']['description']
      @book.image_url = @book_info['volumeInfo']['imageLinks']['thumbnail']
      @book.small_image_url = @book_info['volumeInfo']['imageLinks']['smallThumbnail']
      @book.published_date = @book_info['volumeInfo']['publishedDate']
      @book.pages = @book_info['volumeInfo']['pageCount']
    end

    render new_book_path(@book)
  end

  private

  def get_book_info_from_google(isbn)
    url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"
    response = HTTParty.get(url)
    if response.success?
      data = response.parsed_response
      return data['items'].first if data['items'] && data['items'].any?
    end
    nil
  end
end
