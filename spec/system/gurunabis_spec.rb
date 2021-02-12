require 'rails_helper'

RSpec.describe 'ぐるなび検索機能', type: :system do
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@test.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    click_on 'お店を検索する'
  end
  context 'ぐるなび検索した時' do
    before do
      fill_in 'text_field', with: 'スターバックス 新宿'
      click_on '検索'
    end

    it 'スターバックス コーヒー 新宿サブナード店 が表示される' do
      expect(page).to have_selector '.rest-link', text: 'スターバックス コーヒー 新宿サブナード店'
    end

    it 'スターバックス コーヒー 新宿サブナード店 の詳細ページに行ける' do
      find_link('スターバックス コーヒー 新宿サブナード店').click
      expect(page).to have_button '行きたいお店リストに追加する'
    end
    
    it 'スターバックス コーヒー 新宿サブナード店 を行きたいお店リストに加られる' do
      find_link('スターバックス コーヒー 新宿サブナード店').click
      click_button '行きたいお店リストに追加する'
      expect(page).to have_content('行きたいお店詳細' && 'スターバックス コーヒー 新宿サブナード店')
    end

    it 'スターバックス コーヒー 新宿サブナード店 をキャプション、リストネーム付きで行きたいお店リストに加られる' do
      find_link('スターバックス コーヒー 新宿サブナード店').click
      fill_in 'want_caption', with: '新宿のよく行くスタバ'
      find_field('list-name').set('新宿のスタバ')
      click_button '行きたいお店リストに追加する'
      expect(page).to have_content('新宿のよく行くスタバ' && '新宿のスタバ')
    end
  end
end