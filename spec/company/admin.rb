require 'rails_helper'

describe 'ユーザー管理画面', type: :system do
  before do
    let(:company_a){ Factory.Bot.create(:company, company_name:'test', email: 'test@mail.com', password: 'password') }
    visit new_company_session_path
    fill_in 'company_email', with: company_a.email
    fill_in 'company_password', with: company_a.password
    click_button 'ログイン'
    visit companies_admin_index_path
  end

  context 'サイドバーを操作する場合' do
    it '登録情報の確認・編集が正しく機能する' do
      click_button '登録情報の確認・編集'
      click_button '登録情報を編集する'
      fill_in 'company_company_name', with: 'changed_name'
      fill_in 'company_current_password', with: 'password'
      click_button '編集する'
      #現状トップページにリダイレクトされるが、本来は管理画面トップにいくべき
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

  context 'メッセージ機能を利用する場合' do
    before do
      let(:user_a){ Factory.Bot.create(:user) }
      Factory.Bot.create(:conversation, user_id: user_a.id , company_id: company_a.id)
      click_button "message_userid_#{user_a.id}"
    end

    it 'メッセージが正常に送れる' do
      fill_in 'Type a message', with: 'test message'
      expect(page).to have_content 'test message'
    end

    it 'メッセージが空の時にバリデーションが写る' do
      fill_in 'Type a message', with: ''
      expect(page).to have_content 'バリデーションに失敗しました: Bodyを入力してください'
    end
  end

  context '検索機能を利用する場合' do
    before do
      let(:user_a){ Factory.Bot.create(:user, name:'鈴木一郎', email:'test1@example.com', password:'password',birthday:'2009-01-01',
                                       sex:'男',tel:"111-1111-1111", wechat_id:"test1",edu_level:"bachelor",jlpt:"no_certif",management:"no",chinese_skill:"native",visa_id:"2",prefecture_id:"1",image: "nil") }

      let(:user_b){ Factory.Bot.create(:user, name:'鈴木次郎', email:'test2@example.com', password:'password',birthday:'2004-01-01',
                                       sex:'女',tel:"222-2222-2222", wechat_id:"test2",edu_level:"mastor",jlpt:"N1",management:"no",chinese_skill:"advanced",visa_id:"1",prefecture_id:"2",image: "nil") }

      let(:user_c){ Factory.Bot.create(:user, name:'鈴木三郎', email:'test2@example.com', password:'password',birthday:'1999-01-01',
                                       sex:'女',tel:"333-3333-3333", wechat_id:"test3",edu_level:"doctor",jlpt:"N2",management:"no",chinese_skill:"advanced",visa_id:"1",prefecture_id:"3",image: "nil") }
      visit companies_admin_index_path
    end

    it '名前で検索できる' do
      fill_in 'q_name_cont', with: '一郎'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it '名前で検索に当てはまらない人物が表示されてない' do
      fill_in 'q_name_cont', with: '一郎'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '三郎'
    end


    it 'Emailで検索する' do
      fill_in 'q_email_cont', with: 'test1'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it 'Emailで検索に当てはまらない人物が表示されてない' do
      fill_in 'q_email_cont', with: 'test1'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '三郎'
    end

    it '電話番号で検索する' do
      fill_in 'q_tel_cont', with: '111'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it '電話番号で検索に当てはまらない人物が表示されてない' do
      fill_in 'q_tel_cont', with: '111'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '三郎'
    end

    it 'WechatIDで検索する' do
      fill_in 'q_wechat_id_cont', with: 'test1'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it 'WechatIDで検索に当てはまらない人物が表示されてない' do
      fill_in 'q_wechat_id_cont', with: 'test1'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '三郎'
    end

      it '下限年齢で検索する' do
        fill_in 'q_birthday_to_age_gteq', with: '19'
        click_button '検索'
        expect(page).to have_selector 'td',text: '三郎'
      end

    it '下限年齢で検索に当てはまらない人物が表示されてない' do
      fill_in 'q_birthday_to_age_gteq', with: '19'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '次郎'
    end

    it '上限年齢で検索する' do
      fill_in 'q_birthday_to_age_lteq', with: '14'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it '上限年齢で検索に当てはまらない人物が表示されてない' do
      fill_in 'q_birthday_to_age_lteq', with: '14'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '次郎'
    end

    it '年齢幅を指定して検索する' do
      fill_in 'q_birthday_to_age_gteq', with: '11'
      fill_in 'q_birthday_to_age_lteq', with: '19'
      click_button '検索'
      expect(page).to have_selector 'td',text: '次郎'
    end

    it '性別で検索する' do
      choose '男'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it '性別で検索に当てはまらない人物が表示されてない' do
      choose '女'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '一郎'
    end

    it '居住地で検索する' do
      select '北海道'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it '居住地で検索に当てはまらない人物が表示されてない' do
      select '北海道'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '次郎'
    end

    it 'ビザで検索する' do
      select '人文・知識・国際業務'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it 'ビザで検索に当てはまらない人物が表示されてない' do
      select '人文・知識・国際業務'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '次郎'
    end

    it '学歴で検索する' do
      check 'bachelor'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it '学歴で検索に当てはまらない人物が表示されてない' do
      check 'bachelor'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '次郎'
    end

    it 'JLPTで検索する' do
      check 'N1'
      click_button '検索'
      expect(page).to have_selector 'td',text: '次郎'
    end

    it 'JLPTで検索に当てはまらない人物が表示されてない' do
      check 'N1'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '一郎'
    end

    it '中国語レベルで検索する' do
      check 'ネイティブ'
      click_button '検索'
      expect(page).to have_selector 'td',text: '一郎'
    end

    it '中国語レベルで検索に当てはまらない人物が表示されてない' do
      check 'ネイティブ'
      click_button '検索'
      expect(page).not_to have_selector 'td',text: '次郎'
    end
  end
end