require 'rails_helper'

RSpec.describe 'gone機能', type: :system do
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@test.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    click_on 'お店を検索する'
    fill_in 'text_field', with: 'スターバックス 新宿'
    click_on '検索'
    find_link('スターバックス コーヒー 新宿サブナード店').click
    fill_in 'want_caption', with: '新宿のよく行くスタバ'
    find_field('list-name').set('新宿のスタバ')
    click_button '行きたいお店リストに追加する'
    find_link('行ったにする').click
  end

  context '行った一覧画面にいる時' do
    context '詳細リンクを押した時' do
      before do
        find_link('詳細').click
      end
      it '詳細画面に行ける' do
        expect(page).to have_content('行ったお店詳細' && 'スターバックス コーヒー 新宿サブナード店')
      end
      context '詳細画面にいる時' do
        it '削除できる' do
          click_on '削除'
          expect(page).to_not have_content 'スターバックス コーヒー 新宿サブナード店' 
        end
        it 'commentが更新できる' do
          find('#text_area').set('友達と行った')
          attach_file 'update_image', 'public/test.jpg'
          click_button '更新する'
          expect(page).to have_content '友達と行った'
        end
        it 'imageが更新できる' do
          find('#text_area').set('友達と行った')
          attach_file 'update_image', 'public/test.jpg'
          click_button '更新する'
          expect(page).to have_selector("img[src$='test.jpg']")
        end
        context '投稿しようと思った時' do
          it '投稿一覧画面に行ける' do
            click_button '投稿する'
            expect(page).to have_selector 'h3', text: '投稿一覧画面'
          end
          it '投稿できる' do
            click_button '投稿する'
            click_on 'test1@test.com'
            click_on '自分の投稿を投稿一覧に表示する'
            click_on '投稿一覧'
            expect(page).to have_selector '.card-title', text: 'スターバックス コーヒー 新宿サブナード店'
          end
          it 'commentが投稿できる' do
            find('#posted_caption').set('投稿するよ')
            click_button '投稿する'
            click_on 'test1@test.com'
            click_on '自分の投稿を投稿一覧に表示する'
            click_on '投稿一覧'
            expect(page).to have_selector '.card-text', text: '投稿するよ'
          end
          it 'imageが投稿できる' do
            attach_file 'post_image', 'public/test.jpg'
            click_button '投稿する'
            click_on 'test1@test.com'
            click_on '自分の投稿を投稿一覧に表示する'
            click_on '投稿一覧'
            expect(page).to have_selector("img[src$='test.jpg']")
          end
        end
      end
      
    end
  end
end