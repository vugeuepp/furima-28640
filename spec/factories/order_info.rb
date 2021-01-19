FactoryBot.define do
  factory :order_info do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '11-9' }
    building_name { 'DYPEビル' }
    tel_number { '12345678901' }
    token {"tok_abcdefghijk00000000000000000"}

  end
end