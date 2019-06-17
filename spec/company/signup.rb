require 'rails_helper'

describe '企業サインイン機能', type: :system do
  before do
    visit companies_top_index_path
    click_button 'アカウント登録'
  end

  context 'トップページからサインインする場合' do
    it '問題なくサインインできる' do
      fill_in '貴社名', with: 'テスト株式会社'
      fill_in 'ご担当者名', with: '佐藤次郎'
      fill_in 'TEL', with: '0343434343'
      fill_in 'Email', with: 'testtest@test.com'
      fill_in 'company_password', with: 'password'
      fill_in 'company_password_confirmation', with: 'password'
      click_button '登録'
      expect(page).to have_content '中国語で仕事をしよう！'
    end

    it '企業名未入力の際エラーが発生する' do
      fill_in 'ご担当者名', with: '佐藤次郎'
      fill_in 'TEL', with: '0343434343'
      fill_in 'Email', with: 'testtest@test.com'
      fill_in 'company_password', with: 'password'
      fill_in 'company_password_confirmation', with: 'password'
      expect(page).to have_content '企業名を入力してください'
    end

    it 'メアドが未入力の際にエラーが発生する' do
      fill_in '貴社名', with: 'テスト株式会社'
      fill_in 'ご担当者名', with: '佐藤次郎'
      fill_in 'TEL', with: '0343434343'
      fill_in 'company_password', with: 'password'
      fill_in 'company_password_confirmation', with: 'password'
      click_button '登録'
      expect(page).to have_content 'メールアドレスを入力してください'
    end

    it '電話番号が未入力の際にエラーが発生する' do
      fill_in '貴社名', with: 'テスト株式会社'
      fill_in 'ご担当者名', with: '佐藤次郎'
      fill_in 'Email', with: 'testtest@test.com'
      fill_in 'company_password', with: 'password'
      fill_in 'company_password_confirmation', with: 'password'
      expect(page).to have_content 'パスワードを入力してください'
    end

    it '電話番号の形式がおかしいエラーが発生する' do
      fill_in '貴社名', with: 'テスト株式会社'
      fill_in 'ご担当者名', with: '佐藤次郎'
      fill_in 'TEL', with: 'ddddddddd'
      fill_in 'Email', with: 'testtest@test.com'
      fill_in 'company_password', with: 'password'
      fill_in 'company_password_confirmation', with: 'password'
      expect(page).to have_content '電話番号は数値で入力してください'
    end

    it 'パスワード未入力の際エラーが発生する' do
      fill_in '貴社名', with: 'テスト株式会社'
      fill_in 'ご担当者名', with: '佐藤次郎'
      fill_in 'TEL', with: '0343434343'
      fill_in 'Email', with: 'testtest@test.com'
      fill_in 'company_password_confirmation', with: 'password'
      expect(page).to have_content 'パスワードを入力してください'
    end

    it 'パスワードと確認用パスワードが異なる際エラーが発生する' do
      fill_in '貴社名', with: 'テスト株式会社'
      fill_in 'ご担当者名', with: '佐藤次郎'
      fill_in 'TEL', with: '0343434343'
      fill_in 'Email', with: 'testtest@test.com'
      fill_in 'company_password', with: 'password'
      fill_in 'company_password_confirmation', with: 'passworddddd'
      expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
    end

    it 'パスワードが6文字以下の場合エラーが発生する' do
      fill_in '貴社名', with: 'テスト株式会社'
      fill_in 'ご担当者名', with: '佐藤次郎'
      fill_in 'TEL', with: '0343434343'
      fill_in 'Email', with: 'testtest@test.com'
      fill_in 'company_password', with: 'pas'
      fill_in 'company_password_confirmation', with: 'pas'
      expect(page).to have_content 'パスワードは6文字以上で入力してください'
    end
  end
end