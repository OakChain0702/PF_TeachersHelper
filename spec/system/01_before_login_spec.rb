require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
  #     it 'Log inリンクが表示される: 左上から5番目のリンクが「Log in」である' do
  #       log_in_link = find_all('a')[5].native.inner_text
  #       expect(log_in_link).to match(/log in/i)
  #     end
  #     it 'Log inリンクの内容が正しい' do
  #       log_in_link = find_all('a')[5].native.inner_text
  #       expect(page).to have_link log_in_link, href: new_user_session_path
  #     end
  #     it 'Sign Upリンクが表示される: 左上から6番目のリンクが「Sign Up」である' do
  #       sign_up_link = find_all('a')[6].native.inner_text
  #       expect(sign_up_link).to match(/sign up/i)
  #     end
  #     it 'Sign Upリンクの内容が正しい' do
  #       sign_up_link = find_all('a')[6].native.inner_text
  #       expect(page).to have_link sign_up_link, href: new_user_registration_path
  #     end
  #   end
  # end
  #　◯番目の概念　確認


  # describe 'アバウト画面のテスト' do
  #   before do
  #     visit '/home/about'
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/home/about'
  #     end
  #   end
  # end
  # menu画面はログイン後に遷移可能

  # describe 'ヘッダーのテスト: ログインしていない場合' do
  #   before do
  #     visit root_path
  #   end

  #   context '表示内容の確認' do
  #     it 'タイトルが表示される' do
  #       expect(page).to have_content 'Bookers'
  #     end
  #     it 'Homeリンクが表示される: 左上から1番目のリンクが「Home」である' do
  #       home_link = find_all('a')[1].native.inner_text
  #       expect(home_link).to match(/home/i)
  #     end
  #     it 'Aboutリンクが表示される: 左上から2番目のリンクが「About」である' do
  #       about_link = find_all('a')[2].native.inner_text
  #       expect(about_link).to match(/about/i)
  #     end
  #     it 'sign upリンクが表示される: 左上から3番目のリンクが「sign up」である' do
  #       signup_link = find_all('a')[3].native.inner_text
  #       expect(signup_link).to match(/sign up/i)
  #     end
  #     it 'loginリンクが表示される: 左上から4番目のリンクが「login」である' do
  #       login_link = find_all('a')[4].native.inner_text
  #       expect(login_link).to match(/login/i)
  #     end
  #   end

  #   context 'リンクの内容を確認' do
  #     subject { current_path }

  #     it 'Homeを押すと、トップ画面に遷移する' do
  #       home_link = find_all('a')[1].native.inner_text
  #       home_link = home_link.delete(' ')
  #       home_link.gsub!(/\n/, '')
  #       click_link home_link
  #       is_expected.to eq '/'
  #     end
  #     it 'Aboutを押すと、アバウト画面に遷移する' do
  #       about_link = find_all('a')[2].native.inner_text
  #       about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #       click_link about_link
  #       is_expected.to eq '/home/about'
  #     end
  #     it 'sign upを押すと、新規登録画面に遷移する' do
  #       signup_link = find_all('a')[3].native.inner_text
  #       signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #       click_link signup_link
  #       is_expected.to eq '/users/sign_up'
  #     end
  #     it 'loginを押すと、ログイン画面に遷移する' do
  #       login_link = find_all('a')[4].native.inner_text
  #       login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #       click_link login_link
  #       is_expected.to eq '/users/sign_in'
  #     end
  #   end
   end
  # ログイン前の制限が多い

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it '社員番号フォームが表示される' do
        expect(page).to have_field 'user[employee_number]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    # context '新規登録成功のテスト' do
    #   before do
    #     fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
    #     fill_in 'user[email]', with: Faker::Internet.email
    #     fill_in 'user[password]', with: 'password'
    #     fill_in 'user[password_confirmation]', with: 'password'
    #   end
    # fakerでできる?

      # it '正しく新規登録される' do
      #   expect { click_button 'Sign up' }.to change(User.all, :count).by(1)
      # end
      # User.allの記載

      it '新規登録後のリダイレクト先が、menuになっている' do
        click_button '新規登録'
        expect(current_path).to eq '/menu'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it '社員番号フォームが表示される' do
        expect(page).to have_field 'user[employee_number]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'Log inボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
      # it 'emailフォームは表示されない' do
      #   expect(page).not_to have_field 'user[email]'
      # end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[name]', with: user.name
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end

      it 'ログイン後のリダイレクト先が、ログインしたユーザの詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[name]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'Log in'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[employee_number]', with: user.name
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      # it 'タイトルが表示される' do
      #   expect(page).to have_content 'Bookers'
      # end
      # ロゴの場合
      it '生徒一覧リンクが表示される: 左上から1番目のリンクが「生徒一覧」である' do
        students_link = find_all('a')[1].native.inner_text
        expect(students_link).to match(/students/i)
        # iはアイコン？
      end
      it '講師一覧リンクが表示される: 左上から2番目のリンクが「講師一覧」である' do
        teachers_link = find_all('a')[2].native.inner_text
        expect(teachers_link).to match(/teachers/i)
      end
      it '授業一覧リンクが表示される: 左上から3番目のリンクが「授業一覧」である' do
        lessons_link = find_all('a')[3].native.inner_text
        expect(lessons_link).to match(/lessons/i)
      end
      it 'ログアウトリンクが表示される: 左上から4番目のリンクが「ログアウト」である' do
        logout_link = find_all('a')[4].native.inner_text
        expect(logout_link).to match(/logout/i)
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[employee_number]', with: user.name
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      logout_link = find_all('a')[4].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      # it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
      #   expect(page).to have_link '', href: '/home/about'
      # end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end
