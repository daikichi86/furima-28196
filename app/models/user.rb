class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  check1 = /\A[ぁ-んァ-ン一-龥]/
  check2 = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: check1, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: check1, message: 'is invalid. Input full-width characters.' }
    validates :last_name_kana, format: { with: check2, message: 'is invalid.Input full-width katakana characters.' }
    validates :first_name_kana, format: { with: check2, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_date
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: 'Include both letters and numbers' }

  has_many :items
  has_many :records
end
