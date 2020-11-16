class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  half_width_alphanumeric = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  full_width_character = /\A[ぁ-んァ-ン一-龥]/
  full_width_katakana_character = /\A[ァ-ヶー－]+\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: half_width_alphanumeric, message: 'は半角英数字で入力してください' }
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: full_width_character, message: 'は全角で入力してください' }
    validates :first_name, format: { with: full_width_character, message: 'は全角で入力してください' }
    validates :last_name_kana, format: { with: full_width_katakana_character, message: 'は全角カナで入力してください' }
    validates :first_name_kana, format: { with: full_width_katakana_character, message: 'は全角カナで入力してください' }
    validates :birthday
  end

  has_many :items
  has_many :purchase
end
