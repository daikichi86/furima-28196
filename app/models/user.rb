class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

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
  has_many :comments, dependent: :destroy
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )

    if user.persisted?
       sns.user = user
       sns.save
    end
    { user: user, sns: sns }
  end
end
