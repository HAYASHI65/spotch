require 'rails_helper'

RSpec.describe Team, type: :model do
  before do
    @team = FactoryBot.build(:team)
    sleep 0.2
  end

  describe 'チームの新規投稿' do
    context 'チーム新規投稿ができるとき' do
      it '必須項目が全て存在すれば投稿できる' do
        expect(@team).to be_valid
      end
      it '「プロフィール」が空でも投稿できる' do
        @team.profile = ''
        expect(@team).to be_valid
      end
    end

    context 'チーム新規投稿ができないとき' do
      it '「プロフィール画像」が空の場合投稿できない' do
        @team.image = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('チーム画像を選択してください')
      end
      it '「チーム名」が空の場合投稿できない' do
        @team.team_name = ''
        @team.valid?
        expect(@team.errors.full_messages).to include('チーム名を入力してください')
      end
      it '「スポーツカテゴリー」が空白の場合登録できない' do
        @team.sports_id = ''
        @team.valid?
        expect(@team.errors.full_messages).to include('スポーツカテゴリーを入力してください')
      end
      it '「団体カテゴリー」が空白の場合登録できない' do
        @team.group_id = ''
        @team.valid?
        expect(@team.errors.full_messages).to include('団体カテゴリーを入力してください')
      end
      it '「活動地域」が空白の場合登録できない' do
        @team.active_area_id = ''
        @team.valid?
        expect(@team.errors.full_messages).to include('活動地域を入力してください')
      end
      it '「活動曜日」が空白の場合登録できない' do
        @team.active_day_id = ''
        @team.valid?
        expect(@team.errors.full_messages).to include('活動曜日を入力してください')
      end
      it '「活動時間帯」が空白の場合登録できない' do
        @team.active_time_id = ''
        @team.valid?
        expect(@team.errors.full_messages).to include('活動時間帯を入力してください')
      end
      it '「具体的な活動場所」が空白の場合登録できない' do
        @team.place = ''
        @team.valid?
        expect(@team.errors.full_messages).to include('具体的な活動場所を入力してください')
      end
      it '「男女比」が空白の場合登録できない' do
        @team.gender_ratio = ''
        @team.valid?
        expect(@team.errors.full_messages).to include('男女比を入力してください')
      end
      it '「チームレベル」が空白の場合登録できない' do
        @team.level_id = ''
        @team.valid?
        expect(@team.errors.full_messages).to include('チームレベルを入力してください')
      end
      it '「user_id」が存在しない場合登録できない' do
        @team.user = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
