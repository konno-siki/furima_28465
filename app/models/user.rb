class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ンー-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ンー-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶーー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶーー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[A-Za-z])(?=.*?[0-9])[a-zA-Z0-9]+\z/, message: 'is invalid. Input half-width alphanumeric characters and numerical characters.' }, length: { minimum: 6 }, confirmation: true
  end
end
