class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_burden
  belongs_to :delivery_day
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
  has_one :order
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    # 価格は、半角数字での入力が必須であること
    validates :price, numericality: { message: 'is invalid. Input half-width characters.' }
  end
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_burden_id
    validates :prefecture_id
    validates :delivery_day_id
  end
  # 価格は、¥300~¥9,999,999の間のみ保存可能であること
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range.' }
end
