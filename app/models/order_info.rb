class OrderInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number, :record_id, :user_id, :item_id, :token

  with_options presence: true do 
    validates :postal_code
    validates :city
    validates :house_number
    validates :tel_number
    validates :token
  end

  with_options format: { with: /\A\d{3}[-]\d{4}\z/, message:'Input correctly' } do
    validates :postal_code
  end

  with_options format: { with: /[0-9]\d/, message: 'Half-width number' } do
    validates :tel_number
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  validates :tel_number, length: { maximum: 11, message: 'too long' }

  def save
    record = Record.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tel_number: tel_number, record_id: record.id)
  end
end