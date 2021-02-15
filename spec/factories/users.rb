FactoryBot.define do
  factory :user do
    email { 'iamkenji2231@gmail.com' }
    password { '2231Ke52' }
    password_confirmation { '2231Ke52' }
  end
  factory :user2 do
    email { 'test2@test.com' }
    password { 'password' }
    password_confirmation { 'password'}
  end
end