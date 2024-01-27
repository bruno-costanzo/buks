# frozen_string_literal: true

class CreateBooksCopies < ActiveRecord::Migration[7.1]
  def change
    create_table :books_copies do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :condition

      t.timestamps
    end
  end
end
