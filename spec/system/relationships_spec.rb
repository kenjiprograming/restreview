require 'rails_helper'

RSpec.describe 'フォロー機能', type: :system do
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@test.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    click_on 'ユーザー検索'
  end
  context 'ユーザー検索画面にいる時' do
    before do
      fill_in 'form_controll', with: '2'
      click_on '検索'
      click_on 'test2@test.com'
      click_on 'follow'
    end
    it 'フォローできる' do
      expect(page).to have_content 'unfollow'
    end
    it '相手のフォロワー一覧に自分が表示される' do
      click_on 'フォロワー一覧'
      # expect(page).to have_css '.card-link'
      expect(page).to have_selector '.card-link', text: 'test1@test.com'
    end
    it '自分のフォロー一覧に相手が表示される' do
      click_on 'フォロワー一覧'
      click_link 'card-link'
      click_on 'フォロー一覧'
      expect(page).to have_selector '.card-link', text: 'test2@test.com'
    end
  end
end