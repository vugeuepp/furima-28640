class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day

  with_options format: { with: /[0-9]\d/, message: 'Half-width number' } do
    validates :price
  end

  with_options presence: true do
    validates :image
    validates :item_name
    validates :about
    validates :price
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :prefecture_id
    validates :day_id
  end

  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

end
