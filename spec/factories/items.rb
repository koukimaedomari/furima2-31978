FactoryBot.define do
  factory :item do
    item_name { "小手"}
    item_text { "良いもの"}
    category_id  { 2 }
    status_id    { 4 }
    postage_id   { 2 }
    area_id      { 2 }
    day_id       { 2 }
    price     { 5000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/sanbu_g1172.jpeg'), filename: 'sanbu_g1172.jpeg')
    end
  end
end
