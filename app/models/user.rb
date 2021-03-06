class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :chinese_character_last_name
    validates :chinese_character_first_name
    validates :kana_last_name
    validates :kana_first_name
  end
  validates :birthday, presence: true
end
