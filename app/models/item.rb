class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  
  with_options presence: true do
    validates :item_name
    validates :item_text
    validates :image
    with_options  numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :postage_id
      validates :day_id
      validates :area_id
    end
    validates :price, numericality: { with: /\A[0-9]+\z/i, message: "is invalid. input harf-width characters."}
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}  
  

  belongs_to :user
  has_one :buy
  has_one_attached :image
  
end
