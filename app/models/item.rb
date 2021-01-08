class Item < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day

  validates :item_name, :about, :price, presence: true

  validates :category_id, :condition_id, :shipping_id, :prefecture_id, :day_id, numericality: { other_than: 1 } 

end
