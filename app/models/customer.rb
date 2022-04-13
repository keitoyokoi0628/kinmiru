class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :locations, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :editings, dependent: :destroy
end
