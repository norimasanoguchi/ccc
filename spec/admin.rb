require 'rails_helper'

# let(:定義名){ 定義内容 }
# visit **_path
# fill_in '入力箇所ラベル', with: '入力内容'
# click_button 'ボタンラベル'
# expect(page).to have_content 'コンテンツ'
# expect(page).to have_selector 'h2',text: '登録情報'
# expect(page).to have_selector 'h2.information',text: '登録情報'
# expect(page).to have_selector 'h2#information',text: '登録情報'
# a = Factory.Bot.create(:user, name:'', email: '')
# let(:login_user){ }Factory.Bot.create(:user, name:'', email: '') }

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
      expect(page).to have_selector 'h2',text: '登録情報'
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

  context '検索機能を利用する場合' do
    it '名前で検索する' do
      click_button '登録情報の確認・編集'
      expect(page).to have_selector 'h2',text: '登録情報'
    end

    it 'Emailで検索する' do
      click_button 'ホーム'
      expect(page).to have_selector 'h1',text: '検索'
    end

    it '電話番号で検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it 'WechatIDで検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it '下限年齢で検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it '上限年齢で検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it '年齢幅を指定して検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it '性別で検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it '居住地で検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it 'ビザで検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it '学歴で検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it 'JLPTで検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end

    it '中国語レベルで検索する' do
      click_button 'ログアウト'
      expect(page).to have_selector 'p',text: 'ログアウトしました'
    end
  end
end