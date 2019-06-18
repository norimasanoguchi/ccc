require 'rails_helper'

describe 'ユーザー管理画面', type: :system do
  let(:user_a){ FactoryBot.create(:user, name:'test', email: 'test@mail.com', password: 'password') }
  
  before do
    visit new_user_session_path
    fill_in 'user_email', with: user_a.email
    fill_in 'user_password', with: user_a.password
    click_button 'ログイン'
    visit users_admin_index_path
  end

  context 'サイドバーを操作する場合' do
    it '登録情報の確認・編集が正しく機能する' do
      # click_button 'confirm_info'
      page.first("#sidebarConfirmInfoLink").click
      wait_for_loaded_until_css_exists("#editUserInfo")
      page.first("#editUserInfo").click
      fill_in 'inputUserame', with: 'changed_name'
      fill_in 'user_current_password', with: 'password'
      page.first("#editUserInfo").click
      expect(page).to have_content 'changed_nameさま'
    end

    it '「ホーム」ボタンが正しく機能する' do
      # click_button 'ホーム'
      page.first("#sidebarHomeLink").click
      expect(page).to have_selector 'a',text: 'testさま'
    end

    it '「ログアウト」ボタンが正しく機能する' do
      # click_button 'ログアウト'
      page.first("#sidebarLogoutLink").click
      expect(page).to have_selector 'div',text: 'ログアウトしました'
    end
  end

  context 'メッセージ機能を利用する場合' do
    let(:company_a){ FactoryBot.create(:company) }
    let(:conversation_a){ FactoryBot.create(:conversation, user_id: user_a.id , company_id: company_a.id) }

    before do
      FactoryBot.create(:message, conversation_id: conversation_a.id, user_id: user_a.id  )
      visit users_admin_index_path
      page.first("#messageDetailLink").click
    end

    it 'メッセージが正常に送れる' do
      fill_in 'Type a message', with: 'test message'
      page.first("#messageSendButton").click
      expect(page).to have_content 'test message'
    end

    it 'メッセージが空の時にバリデーションが写る' do
      fill_in 'Type a message', with: ''
      expect(page).to have_content 'バリデーションに失敗しました: Bodyを入力してください'
    end

  end

end