require 'rails_helper'

RSpec.describe "Posteds", type: :system do
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
    find_link('詳細').click
    click_button '投稿する'
    click_on 'test1@test.com'
    click_on '自分の投稿を投稿一覧に表示する'
    click_on '投稿一覧'
  end

  context 'ユーザーemailリンクをクリックした時' do
    it 'ユーザー詳細画面に行く' do
      find('#user_email').click
      expect(page).to have_selector '.user_email', text: 'test1@test.com'
    end
  end

  context 'お店のnameリンクをクリックした時' do
    it '投稿詳細ページへ行く' do
      find('#post_name').click
      expect(page).to have_selector '.post_name', text: 'スターバックス コーヒー 新宿サブナード店'
    end
  end

  context 'いいねするボタンを押したい時' do
    before '投稿詳細ページに変わり' do
      find('#post_name').click
      click_on 'いいねする'
    end
    it 'いいね消すボタンに変わる' do
      expect(page).to have_link 'いいね消す'
    end
    it '投稿一覧画面でいいね消すボタンに変わる' do
      click_on '投稿一覧'
      expect(page).to have_link 'いいね消す'
    end
    it 'されたいいね一覧に自分のemailが表示される' do
      expect(page).to have_selector '.likes', text: 'test1@test.com'
    end
    it '投稿詳細のいいね数が1増え表示が1になる' do
      expect(page).to have_selector '.heart', text: '1'
    end
    it '投稿詳細のいいね数が1増え表示が1になる' do
      click_on '投稿一覧'
      expect(page).to have_selector '.heart', text: '1'
    end

    context 'マイページのいいねした一覧に表示されるか調べたい時' do
      before 'マイページに行く' do
        find('#mypage').click
      end
      it 'いいね一覧に表示される' do
        expect(page).to have_selector '.like_post', text: 'スターバックス コーヒー 新宿サブナード店'
      end
    end

    context 'いいね消すボタンを押したい時' do
      before 'いいね消すボタンを押すと' do
        click_on 'いいね消す'
      end
      it '投稿詳細ページでいいねするボタンに変わる'do
        expect(page).to have_link 'いいねする'
      end
      it '投稿一覧ページでいいねするボタンに変わる'do
        click_on '投稿一覧'
        expect(page).to have_link 'いいねする'
      end
      it '投稿詳細ページでいいね数が1減り表示が0になる' do
        expect(page).to have_selector '.heart', text: '0'
      end
      it '投稿一覧ページでいいね数が1減り表示が0になる' do
        click_on '投稿一覧'
        expect(page).to have_selector '.heart', text: '0'
      end
    end
  end

  context '投稿を削除するボタンを押したい時' do
    before '投稿詳細ページに行き投稿削除ボタンを押し' do
      find('#post_name').click
      click_on '投稿を削除する'
    end
    it 'トップページに行き投稿がない' do
      expect(page).to_not have_selector '#post_name', text: 'スターバックス コーヒー 新宿サブナード店'
    end
  end

end
