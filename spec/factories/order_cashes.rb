FactoryBot.define do
    factory :order_cash do
      post_number { '906-0008' }
      area_id      { 2 }
      city { '沖縄' }
      address { '1-1' }
      build_name       { '東京ハイツ' }
      telephone_number { "09010002000" }
      token            {"tok_abcdefghijk00000000000000000"}
      item_id  {1}
      user_id  {1}
  end
end
