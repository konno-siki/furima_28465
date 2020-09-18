class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  
  full_size_japanese = /\A[ぁ-んァ-ンー-龥]/
  full_width_kana = /\A[ァ-ヶーー]+\z/
  with_options presence: true do
    validates :first_name, format: { with: full_size_japanese, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: full_size_japanese, message: 'is invalid. Input full-width characters.' }
    validates :first_name_reading, format: { with: full_width_kana, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_reading, format: { with: full_width_kana, message: 'is invalid. Input full-width katakana characters.' }
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[A-Za-z])(?=.*?[0-9])[a-zA-Z0-9]+\z/, message: 'is invalid. Input half-width alphanumeric characters and numerical characters.' }, length: { minimum: 6 }, confirmation: true
  end
end
