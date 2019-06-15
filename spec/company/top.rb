require 'rails_helper'

describe 'ユーザートップ画面', type: :system do
  let(:login_company){ Factory.Bot.create(:company) }

  context 'ログアウトしている場合' do
    before do
      visit root_path
    end

    it '「いますぐ使ってみる！」が表示＆「人材をスカウト！」が表示されてない' do
      expect(page).to have_content 'いますぐ使ってみる！'
      expect(page).not_to have_content '人材をスカウト！'
    end

    it 'ナビバーに適切なメニューが表示されている' do
      expect(page).to have_content 'アカウント登録'
      expect(page).to have_content 'ログインする'
      expect(page).to have_content 'お仕事お探しの方はこちら'
      expect(page).not_to have_content 'マイページ'
      expect(page).not_to have_content 'ログアウトする'
    end

    it 'スクロール時にハンバーガーメニューが表示されている' do
      #スクロールする処理
      expect(page).to have_content 'アカウント登録'
      expect(page).to have_content 'ログインする'
      expect(page).to have_content '採用企業の方はこちら'
      expect(page).not_to have_content 'マイページ'
      expect(page).not_to have_content 'ログアウトする'
    end
  end

  context 'ログイン時' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: login_company.email
      fill_in 'user_password', with: login_company.password
      click_button 'ログイン'
      visit root_path
    end

    it '「いますぐ使ってみる！」が表示されてない＆「人材をスカウト！」が表示されている' do
      expect(page).not_to have_content 'いますぐ使ってみる！'
      expect(page).to have_content '人材をスカウト！'
    end

    it 'ナビバーに適切なメニューが表示されている' do
      expect(page).to have_content 'マイページ'
      expect(page).to have_content 'ログアウトする'
      expect(page).to have_content 'お仕事お探しの方はこちら'
      expect(page).not_to have_content 'アカウント登録'
      expect(page).not_to have_content 'ログインする'
    end
  end
end