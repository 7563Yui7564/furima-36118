class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number ,:building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    # 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows(e.g. 123-4567)'} 
    validates :city
    validates :house_number
    #電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと
    validates :phone_number, numericality: {message: 'is invalid. Input only number'}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

