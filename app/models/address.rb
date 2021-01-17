class Address < ApplicationRecord
  belongs_to :record

  with_options presence: true do 
    validates :postal_code
    validates :city
    validates :house_number
    validates :tel_number
  end

  with_options format: { with: /\A\d{3}[-]\d{4}\z/, message:'Input correctly' } do
    validates :postal_code
  end

  with_options format: { with: /[0-9]\d/, message: 'Half-width number' } do
    validates :tel_number
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  validates :tel_number, length: { maximum: 11, message: 'too long' }
end
