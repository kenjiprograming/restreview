FactoryBot.define do
  factory :user do
    email { 'test1@test.com' }
    password { 'password' }
    password_confirmation { 'password'}
  end
  factory :user2 do
    email { 'test2@test.com' }
    password { 'password' }
    password_confirmation { 'password'}
  end
end