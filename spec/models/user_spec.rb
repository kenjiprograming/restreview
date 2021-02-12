require 'rails_helper'

RSpec.describe User, type: :model do
  it 'email, password, password_confirmationがある場合、有効である' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  it 'email, password_confirmationがあり、passwordがない場合、有効でない' do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to_not be_valid
  end
  it 'emailが重複する場合はあとのものが保存されない' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    expect(user2).to_not be_valid
  end

end