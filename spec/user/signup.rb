require 'rails_helper'

describe 'ユーザーサインイン機能', type: :system do
  before do
    visit root_path
    click_button '今すぐアカウント登録'
  end

  context 'トップページからサインインする場合' do
    it '問題なくサインインできる' do
      fill_in '名前', with: 'テスト太郎'
      fill_in 'inputEmail', with: '2019/01/01'
      fill_in 'inputBirthday', with: '2019/01/01'
      choose '女性'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      select '東京都', from: 'user_prefecture_id'
      select 'doctor', from: 'user_edu_level'
      select 'N1', from: 'user_jlpt'
      select 'native', from: 'user_chinese_skill'
      fill_in 'user_tel', with: '00000000000'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_wechat_id', with: 'test_id'
      #写真ファイルの添付？
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button '登録'
      expect(page).to have_content '中国語で仕事をしよう！'
    end

    it '名前未入力の際エラーが発生する' do
      fill_in 'inputBirthday', with: '2019/01/01'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      fill_in 'user_tel', with: '00000000000'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_wechat_id', with: 'test_id'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      expect(page).to have_content '名前を入力してください'
    end

    it '誕生日未入力の際エラーが発生する' do
      fill_in '名前', with: 'テスト太郎'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      fill_in 'user_tel', with: '00000000000'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_wechat_id', with: 'test_id'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      expect(page).to have_content '電話番号は数値で入力してください'
    end

    it '電話番号が未入力の際にエラーが発生する' do
      fill_in '名前', with: 'テスト太郎'
      fill_in 'inputBirthday', with: '2019/01/01'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_wechat_id', with: 'test_id'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      expect(page).to have_content '電話番号は数値で入力してください'
    end

    it '電話番号の形式がおかしいエラーが発生する' do
      fill_in '名前', with: 'テスト太郎'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      fill_in 'user_tel', with: 'aabbccddate'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_wechat_id', with: 'test_id'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      expect(page).to have_content '電話番号は数値で入力してください'
    end

    it 'メアド未入力の際エラーが発生する' do
      fill_in '名前', with: 'テスト太郎'
      fill_in 'inputBirthday', with: '2019/01/01'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      fill_in 'user_tel', with: '00000000000'
      fill_in 'user_wechat_id', with: 'test_id'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      expect(page).to have_content 'メールアドレスを入力してください'
    end

    it 'Wechat ID未入力の際エラーが発生する' do
      fill_in '名前', with: 'テスト太郎'
      fill_in 'inputBirthday', with: '2019/01/01'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      fill_in 'user_tel', with: '00000000000'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      expect(page).to have_content 'WechatIDは1文字以上で入力してください'
    end

    it 'ビザ未入力の際エラーが発生する' do
      fill_in '名前', with: 'テスト太郎'
      fill_in 'inputBirthday', with: '2019/01/01'
      fill_in 'user_tel', with: '00000000000'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_wechat_id', with: 'test_id'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      expect(page).to have_content 'ビザを入力してください'
    end

    it 'パスワード未入力の際エラーが発生する' do
      fill_in '名前', with: 'テスト太郎'
      fill_in 'inputBirthday', with: '2019/01/01'
      fill_in 'user_tel', with: '00000000000'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_wechat_id', with: 'test_id'
      expect(page).to have_content 'パスワードを入力してください'
    end

    it 'パスワードと確認用パスワードが異なる際エラーが発生する' do
      fill_in '名前', with: 'テスト太郎'
      fill_in 'inputBirthday', with: '2019/01/01'
      fill_in 'user_tel', with: '00000000000'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_wechat_id', with: 'test_id'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'bad_password'
      expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
    end
    it 'パスワードが6文字以下の場合エラーが発生する' do
      fill_in '名前', with: 'テスト太郎'
      fill_in 'inputBirthday', with: '2019/01/01'
      fill_in 'user_tel', with: '00000000000'
      select '技術・人文知識・国際業務', from: 'user_visa_id'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_wechat_id', with: 'test_id'
      fill_in 'user_password', with: 'pas'
      fill_in 'user_password_confirmation', with: 'pas'
      expect(page).to have_content 'パスワードは6文字以上で入力してください'
    end

  end
end