FactoryBot.define do
  factory :user do
    first_name {"太郎"}
    last_name {"鈴木"}
    first_name_reading {"タロウ"}
    last_name_reading {"スズキ"}
    nickname {"寝太郎"}
    birthday {"2000-01-12"}
    email {"aaa@au.com"}
    password {"aaaaaa"}
    password_confirmation {password}
  end
end