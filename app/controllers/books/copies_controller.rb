# frozen_string_literal: true

module Books
  class CopiesController < ApplicationController
    before_action :authenticate_user!

    before_action :set_books_copy, only: %i[show edit update destroy]

    # GET /books/copies or /books/copies.json
    def index
      @books_copies = Books::Copy.all
    end

    # GET /books/copies/1 or /books/copies/1.json
    def show; end

    # GET /books/copies/new
    def new
      @books_copy = Books::Copy.new(
        book: Book.find_or_create_by_isbn(params[:isbn]),
        user: current_user
      )
    end

    # GET /books/copies/1/edit
    def edit; end

    # POST /books/copies or /books/copies.json

    def create
      @books_copy = current_user.copies.new(books_copy_params)
    end

    def update
    end

    def destroy
    end

    private

    def books_copy_params
      params.require(:books_copy).permit(:book_id, :user_id, :condition)
    end
  end
end
