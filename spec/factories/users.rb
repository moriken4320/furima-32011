FactoryBot.define do
  factory :user do
    nickname {"aaaaaaa"}
    email {"a@a"}
    password {"11111a"}
    password_confirmation {password}
    last_name {"佐藤"}
    first_name {"太郎"}
    last_name_kana {"サトウ"}
    first_name_kana {"タロウ"}
    birthday {"2000-01-01"}
  end
end
