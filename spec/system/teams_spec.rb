require 'rails_helper'

RSpec.describe "チーム新規投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @team = FactoryBot.build(:team)
  end

  context 'チーム新規投稿ができるとき' do
    it 'ログインしたユーザーはチームの新規投稿ができる' do
      # トップページに移動する
      visit root_path
      # ログインする
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # トップページにチーム新規投稿ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('チームを投稿する')
      # 新規投稿ページへ移動する
      visit new_team_path
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      @team_iamge = attach_file('team[image]', image_path, make_visible: true)
      # チーム情報を入力する
      fill_in 'team_team_name', with: @team.team_name
      select 'バドミントン', from: 'team[sports_id]'
      select 'クラブチーム', from: 'team[group_id]'
      select '杉並区', from: 'team[active_area_id]'
      select '水曜日', from: 'team[active_day_id]'
      select '9:00~11:00', from: 'team[active_time_id]'
      fill_in 'team_place', with: @team.place
      fill_in 'team_gender_ratio', with: @team.gender_ratio
      select 'やや強い/やや厳しい', from: 'team[level_id]'
      fill_in 'team-profile', with: @team.profile
      # 投稿ボタンを押すとTeamモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{Team.count}.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページに先ほど投稿した内容のチームが存在することを確認する(画像)
      expect(page).to have_selector("img[src$='test_image.png']")
      # トップページに先ほど投稿した内容のチームが存在することを確認する(テキスト)
      expect(page).to have_content(@team.team_name)
      expect(page).to have_content('バドミントン')
      expect(page).to have_content('クラブチーム')
      expect(page).to have_content('杉並区')
      expect(page).to have_content(@user.nickname)
    end
  end
end
