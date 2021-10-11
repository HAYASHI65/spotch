require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
    sleep 0.2
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.last_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.last_name_kana
      fill_in 'first-name-kana', with: @user.first_name_kana
      select "男性", from: 'user[gender_id]'
      select '1994', from: 'user[birthday(1i)]'
      select '9', from: 'user[birthday(2i)]'
      select '18', from: 'user[birthday(3i)]'
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('user[image]', image_path, make_visible: true)
      fill_in 'user_nickname', with: @user.nickname
      select 'バドミントン', from: 'user[sports_id]'
      select '杉並区', from: 'user[active_area_id]'
      select '水曜日', from: 'user[active_day_id]'
      select '9:00~11:00', from: 'user[active_time_id]'
      select '県大会出場', from: 'user[achievement_id]'
      fill_in 'achievement-content', with: @user.achievement_content
      fill_in 'user-profile', with: @user.profile
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{User.count}.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページにログアウトボタンが表示されていることを確認する
      expect(page).to have_content('マイページ')
      expect(page).to have_content('お気に入り')
      expect(page).to have_content('Myチーム')
      expect(page).to have_content('チャット')
      expect(page).to have_content('寄付')
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
    
  end

  context 'ユーザー新規登録ができない時' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      
    end
    
  end
end
