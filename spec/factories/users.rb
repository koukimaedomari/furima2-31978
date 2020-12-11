FactoryBot.define do
  factory :user do
    name {"aaa"}
    email {"aaa@example"}
    password {"a1a1a1"}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"晃"}
    kana_last_name {"ヤマダ"}
    kana_first_name {"アキラ"}
  end
end