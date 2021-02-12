require 'rails_helper'

describe 'ログイン画面に遷移する', type: :system do
  context 'ログインリンクを踏んだ時' do
    before do
      visit root_path
      click_link 'ログイン'
    end
    it '画面遷移する' do
      expect(page).to have_content 'ログイン画面'
    end
  end
end

describe '投稿一覧画面に遷移する', type: :system do
  before '新規登録する' do
    visit new_user_registration_path
    fill_in 'Eメール', with: 'kenji@kenji.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'
    click_button '新規登録'
  end
  context '投稿一覧画面に飛んだ時' do
    before do
      click_link '投稿一覧'
    end
    it '投稿一覧の文字がある' do
      expect(page).to have_content("投稿一覧")
    end
  end
end

