# frozen_string_literal: true

class User < ApplicationRecord
  has_many :copies, dependent: :destroy, class_name: 'Books::Copy'
  has_many :books, through: :copies

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
