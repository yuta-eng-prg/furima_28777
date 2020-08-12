class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :email, uniqueness: { case_sensitive: true }, format: { with: EMAIL_REGEX }
  validates :password, format: { with: PASSWORD_REGEX }

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :last_name, format: { with: ZENKAKU_REGEX }
    validates :first_name, format: { with: ZENKAKU_REGEX }
    validates :last_name_kana, format: { with: KANA_REGEX }
    validates :first_name_kana, format: { with: KANA_REGEX }
    validates :birthday
  end
end
