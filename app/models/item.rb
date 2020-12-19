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
  
    

  end
  





  belongs_to :user
  has_one :buy
  has_one_attached :image
  
end
