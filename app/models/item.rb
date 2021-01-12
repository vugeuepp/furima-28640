class Item < ApplicationRecord
  has_one_attached :image
  
belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true ,format: { with: /[0-9]\d/, message: 'Half-width number' } do
    validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}

  validates :image, :item_name, :about, presence: true

  validates :category_id, :condition_id, :shipping_id, :prefecture_id, :day_id, numericality: { other_than: 1, message: 'Select' } 
end
