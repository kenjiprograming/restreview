FactoryBot.define do
  factory :posted do
    name { 'test店' }
    address { 'test市test区' }
    caption { 'testだよ' }
    user_id { 1 }
  end
end
