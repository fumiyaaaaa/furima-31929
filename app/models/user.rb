class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :chinese_character_last_name
    validates :chinese_character_first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :kana_last_name
    validates :kana_first_name
  end

  has_many :items
  has_many :order_historys
end
