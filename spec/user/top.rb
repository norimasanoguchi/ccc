require 'rails_helper'

describe 'ユーザートップ画面', type: :system do
  # let(:login_user){ FactoryBot.create(:user, name:'test', email: 'test@mail.com', password: 'password',visa_id: 1, prefecture_id:1) }
  let(:login_user){ FactoryBot.create(:user, name:'test', email: 'test@mail.com') }

  context 'ログアウト時' do
    before do
      visit root_path
    end

    it '「いますぐ登録ボタン」が表示＆「メッセージを確認」が表示されてない' do
      save_and_open_page
      expect(page).to have_content 'いますぐ登録'
      expect(page).not_to have_content 'メッセージを確認'
    end

    it 'ナビバーに適切なメニューが表示されている' do
      expect(page).to have_content '今すぐアカウント登録'
      expect(page).to have_content 'ログインする'
      expect(page).to have_content '採用企業の方はこちら'
      expect(page).not_to have_content 'マイページを見る'
      expect(page).not_to have_content 'ログアウトする'
    end

    it 'スクロール時にハンバーガーメニューが表示されている' do
      #スクロールする処理
      expect(page).to have_content '今すぐアカウント登録'
      expect(page).to have_content 'ログインする'
      expect(page).to have_content '採用企業の方はこちら'
      expect(page).not_to have_content 'マイページを見る'
      expect(page).not_to have_content 'ログアウトする'
    end
  end

  context 'ログイン時' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: login_user.email
      fill_in 'user_password', with: login_user.password
      click_button 'ログイン'
      visit root_path
    end

    it '「いますぐ登録ボタン」が表示＆「メッセージを確認」が表示されてない' do
      expect(page).not_to have_content 'いますぐ登録'
      expect(page).to have_content 'メッセージを確認'
    end

    it 'ナビバーに適切なメニューが表示されている' do
      expect(page).to have_content 'マイページを見る'
      expect(page).to have_content 'ログアウトする'
      expect(page).to have_content '採用企業の方はこちら'
      expect(page).not_to have_content '今すぐアカウント登録'
      expect(page).not_to have_content 'ログインする'
    end
  end
end