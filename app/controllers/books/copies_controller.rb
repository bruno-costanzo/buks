# frozen_string_literal: true

module Books
  class CopiesController < ApplicationController
    before_action :set_books_copy, only: %i[show edit update destroy]

    # GET /books/copies or /books/copies.json
    def index
      @books_copies = Books::Copy.all
    end

    # GET /books/copies/1 or /books/copies/1.json
    def show; end

    # GET /books/copies/new
    def new
      @books_copy = Books::Copy.new
    end

    # GET /books/copies/1/edit
    def edit; end

    # POST /books/copies or /books/copies.json
    def create
      @books_copy = Books::Copy.new(books_copy_params)

      respond_to do |format|
        if @books_copy.save
          format.html { redirect_to books_copy_url(@books_copy), notice: 'Copy was successfully created.' }
          format.json { render :show, status: :created, location: @books_copy }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @books_copy.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /books/copies/1 or /books/copies/1.json
    def update
      respond_to do |format|
        if @books_copy.update(books_copy_params)
          format.html { redirect_to books_copy_url(@books_copy), notice: 'Copy was successfully updated.' }
          format.json { render :show, status: :ok, location: @books_copy }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @books_copy.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /books/copies/1 or /books/copies/1.json
    def destroy
      @books_copy.destroy!

      respond_to do |format|
        format.html { redirect_to books_copies_url, notice: 'Copy was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_books_copy
      @books_copy = Books::Copy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def books_copy_params
      params.require(:books_copy).permit(:book_id, :user_id, :condition)
    end
  end
end
