class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    with_options presence: true do
      validates :name       
      validates :password   
      validates :birth_day      
      
      with_options format: { with: /\A[ぁ-んァ-ヶ一-龥]/, message: "is invalid. input full-width characters" } do
       validates :last_name
       validates :first_name
      end
      
      with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. input full-width katakana characters" } do
      validates :kana_last_name
      validates :kana_first_name
      end
    end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角数字と半角英字の両方を含めて設定してください'  
      
  has_many :items
  has_many :orders
end
