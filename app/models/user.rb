class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    # 全角（漢字・ひらがな・カタカナ）での入力が必須である
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # 全角（漢字・ひらがな・カタカナ）での入力が必須である
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: "is invalid. Input full-width characters."}  
    # お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
    validates :last_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}  
    # お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
    validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}  
    validates :birth_date
  end 
    # パスワードは、半角英数字混合での入力が必須であること
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Input half-width characters."}     
end

