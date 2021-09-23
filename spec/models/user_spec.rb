require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep 0.1
  end

  describe 'ユーザーの新規登録' do
    context 'ユーザー新規登録ができるとき' do
      it '必須項目が全て存在していれば登録できる' do
        expect(@user).to be_valid
      end
      it '「過去の実績」が空白でも登録できる' do
        @user.achievement_id = ''
        expect(@user).to be_valid
      end
      it '「過去の実績に関する補事項」が空白でも登録できる' do
        @user.achievement_content = ''
        expect(@user).to be_valid
      end
      it '「プロフィール」が空白でも登録できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができないとき' do
      it '「メールアドレス」が空白の場合登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '「パスワード」が空白の場合登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it '「名字」が空白の場合登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it '「名前」が空白の場合登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it '「名字カナ」が空白の場合登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください")
      end
      it '「名前カナ」が空白の場合登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it '「性別」が空白の場合登録できない' do
        @user.gender_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("性別を入力してください")
      end
      it '「誕生日」が空白の場合登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it '「プロフィール画像」が空白の場合登録できない' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("プロフィール画像を選択してください")
      end
      it '「ニックネーム」が空白の場合登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it '「スポーツカテゴリー」が空白の場合登録できない' do
        @user.sports_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("スポーツカテゴリーを入力してください")
      end
      it '「活動地域」が空白の場合登録できない' do
        @user.active_area_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("活動地域を入力してください")
      end
      it '「参加できる曜日」が空白の場合登録できない' do
        @user.active_day_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("参加できる曜日を入力してください")
      end
      it '「参加できる時間帯」が空白の場合登録できない' do
        @user.active_time_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("参加できる時間帯を入力してください")
      end
      it '「メールアドレス」が重複している場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it '「メールアドレス」に@が含まれていない場合登録できない' do
        @user.email = 'spotch.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '「パスワード」に数字が含まれていない場合登録できない' do
        @user.password = 'spotchmatch'
        @user.password_confirmation = 'spotchmatch'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください")
      end
      it '「パスワード」が半角数字のみの場合登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください")
      end
      it '「パスワード」に全角文字が含まれている場合登録できない' do
        @user.password = 'spotch９９'
        @user.password_confirmation = 'spotch９９'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください")
      end
      it '「パスワード」が5文字以下の場合登録できない' do
        @user.password = 'spo99'
        @user.password_confirmation = 'spo99'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it '「パスワード」と「確認用パスワード」が不一致の場合登録できない' do
        @user.password = 'spotch99'
        @user.password_confirmation = 'spotch100'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '「名字」に漢字・ひらがな・カタカナ以外が含まれている場合登録できない' do
        @user.last_name = 'SPOTCH'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は全角で入力してください")
      end
      it '「名前」に漢字・ひらがな・カタカナ以外が含まれている場合登録できない' do
        @user.first_name = 'SPOTCH'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力してください")
      end
      it '「名字カナ」にカタカナ以外が含まれている場合登録できない' do
        @user.last_name_kana = 'すぽっち'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナは全角カタカナで入力してください")
      end
      it '「名前カナ」にカタカナ以外が含まれている場合登録できない' do
        @user.first_name_kana = 'すぽっち'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナは全角カタカナで入力してください")
      end
    end
  end
end
