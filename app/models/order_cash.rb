class OrderCash 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :area_id, :city, :address, :build_name, :telephone_number, :token

  
  
  
  with_options presence: true do
    validates :post_number
    validates :city
    validates :item_id
    validates :user_id
    validates :address
    validates :token, presence: { message: "can't be blank" }
    validates :telephone_number
  end
  validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "number Input only number"}
  validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "code Input correctly"}
  validates :area_id, numericality: { other_than: 1, message: 'Select' }

  def save
    # 購入情報
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報
    Address.create(post_number: post_number, area_id: area_id, city: city, address: address, build_name: build_name, telephone_number: telephone_number, order_id: order.id)
  end
end
