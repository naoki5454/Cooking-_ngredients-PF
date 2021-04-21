FactoryBot.define do
  factory :customer do
    name { "test" }
    k_name { "テスト" }
    nickname { "test" }
    email { "user@email.com" }
    introduction { "testtest" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end