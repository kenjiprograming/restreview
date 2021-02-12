require 'rails_helper'

RSpec.describe "ユーザー検索機能", type: :system do
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@test.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    click_on 'ユーザー検索'
  end

  context 'ログインしている時' do 
    it 'ユーザー検索画面に行く' do
      expect(page).to have_content 'emailを入力してください（最低1文字）'
    end
  end

  context 'ユーザー検索画面にいる時' do
    before do
      fill_in 'form_controll', with: '2'
      # find('.form_controll').set("2")
      click_on '検索'
    end
    it 'ユーザー検索ができる' do
      expect(page).to have_content 'test2@test.com'
    end
    it 'ユーザー詳細画面に行ける' do
      click_on 'test2@test.com'
      expect(page).to have_content 'ユーザー詳細画面'
    end
  end

  context 'マイページでいいねした一覧を確認したい時' do
    before 'マイページに行く' do
      click_on 'test1@test.com'
    end
    it 'マイページに行ける' do
      expect(page).to have_content 'いいね一覧'
    end
  end


end