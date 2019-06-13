require 'rails_helper'

describe 'ユーザー管理画面', type: :system do
  before do
    Factory.Bot.create(:user, name:'test', email: 'test@mail.com', email: 'password')
    visit new_user_session_path
    fill_in 'user_email', with: 'test@mail.com'
    fill_in 'user_password', with: 'password'
    click_button 'ログイン'
    visit users_admin_index_path
  end

  context 'サイドバーを操作する場合' do
    it '登録情報の確認・編集が正しく機能する' do
      click_button '登録情報の確認・編集'
      click_button '登録情報を編集する'
      fill_in 'inputUserame', with: 'changed_name'
      fill_in 'user_current_password', with: 'password'
      click_button '編集する'
      expect(page).to have_content 'changed_nameさま'
    end

    it '「ホーム」ボタンが正しく機能する' do
      click_button 'ホーム'
      expect(page).to have_selector 'h1',text: '検索'
    end

    it '「ログアウト」ボタンが正しく機能する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end
  end
end