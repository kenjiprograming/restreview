require 'rails_helper'

describe 'ログイン画面に遷移する', type: :system do
  context 'ログインリンクを踏んだ時' do
    before do
      visit root_path
      click_button 'ログイン'
    end
    it '画面遷移する' do
      expect(page).to have_content 'ログイン'
    end
  end
end

describe '投稿一覧画面に遷移する', type: :system do
  before 'ログインする' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'iamkenji2231@gmail.com'
    fill_in 'パスワード', with: '2231Ke52'
    find(".login-btn").click
  end
  context '投稿一覧画面に飛んだ時' do
    it '投稿一覧の文字がある' do
      expect(page).to have_content("ログインしました")
    end
  end
end

