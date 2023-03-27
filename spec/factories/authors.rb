FactoryBot.define do
  factory :author do
    first_name { "MyString" }
    last_name { "MyString" }
    book { nil }
  end
end
