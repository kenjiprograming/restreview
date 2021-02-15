require 'rails_helper'

RSpec.describe 'wants機能', type: :system do
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: 'iamkenji2231@gmail.com'
    fill_in 'パスワード', with: '2231Ke52'
    click_button 'ログイン'
    click_on 'お店を検索する'
    fill_in 'text_field', with: 'スターバックス 新宿'
    click_on '検索'
    find_link('スターバックス コーヒー 新宿サブナード店').click
    fill_in 'want_caption', with: '新宿のよく行くスタバ'
    find_field('list-name').set('新宿のスタバ')
    click_button '行きたいお店リストに追加する'
  end

  context '詳細画面にいる時' do
    before do
      find_link('行ったにする').click
    end
    context '行ったにするボタンを押した場合' do
      it '行ったお店一覧画面に行ける' do
        expect(page).to have_content('行ったお店一覧')
      end
    
      it '行ったにするボタンが行ってないにするボタンに変わる' do
        click_link '行きたいお店'
        expect(page).to have_link '行ってないにする'
      end
    end

    context '行ってないにするボタンを押した場合' do
      before do
        click_link '行きたいお店'
        find_link('行ってないにする').click
      end
      it '行ったお店一覧画面からお店がなくなる' do 
        expect(page).to_not have_content 'スターバックス コーヒー 新宿サブナード店'
      end
      it '行ってないにするボタンが行ったにするボタンに変わる' do
        click_link '行きたいお店'
        expect(page).to have_link '行ったにする'
      end
    end

    context '行きたいお店から削除するリンクを押した時' do
      before do 
        click_link '行きたいお店'
        find_link('詳細').click
      end
      it '行きたいお店から削除される' do
        find_link('行きたいお店から削除').click
        expect(page).to_not have_content 'スターバックス コーヒー 新宿サブナード店'
      end
    end
  end
end