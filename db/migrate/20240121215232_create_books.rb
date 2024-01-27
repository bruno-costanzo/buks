# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.text :description
      t.date :published_date
      t.string :image_url
      t.string :small_image_url
      t.integer :pages

      t.timestamps
    end
  end
end
