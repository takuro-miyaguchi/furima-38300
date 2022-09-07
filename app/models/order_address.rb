class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :post_code, :sender_id, :municipality, :address, :building, :phone_number

  validates :sender_id, numericality: { other_than: 1 , message: "can't be blank"} 

  with_options presence: true do
    validates :post_code,    format: { with: /\A\d{3}[-]\d{4}\z/, message: "半角の3桁+ハイフン+4桁のみ有効" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/ , message: "半角の10〜11桁のみ有効" }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, sender_id: sender_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end

