require 'rails_helper'

RSpec.describe DonationObject, type: :model do
  before do
    user = FactoryBot.create(:user)
    team = FactoryBot.create(:team)
    @donation_object = FactoryBot.build(:donation_object, user_id: user.id, team_id: team.id)
    sleep 0.2
  end

  describe 'チームへの寄付機能' do
    context '寄付できるとき' do
      it '必須項目が全て存在すれば寄付できる' do
        expect(@donation_object).to be_valid
      end
      it '「応援メッセージ」が空の場合でも寄付できる' do
        @donation_object.text = ''
        expect(@donation_object).to be_valid
      end
    end
    context '寄付できないとき' do
      it '「寄付金額」が空の場合寄付できない' do
        @donation_object.price = ''
        @donation_object.valid?
        expect(@donation_object.errors.full_messages).to include('寄付金額を入力してください')
      end
      it '「寄付金額」が半角数字以外の場合寄付できない' do
        @donation_object.price = '２０００'
        @donation_object.valid?
        expect(@donation_object.errors.full_messages).to include('寄付金額は¥1,000~9,999,999の間で、半角数字で入力してください')
      end
      it '「寄付金額」が999円以下の場合寄付できない' do
        @donation_object.price = 999
        @donation_object.valid?
        expect(@donation_object.errors.full_messages).to include('寄付金額は¥1,000~9,999,999の間で、半角数字で入力してください')
      end
      it '「寄付金額」が10,000,000円以上の場合寄付できない' do
        @donation_object.price = 10, 0o00, 0o00
        @donation_object.valid?
        expect(@donation_object.errors.full_messages).to include('寄付金額は¥1,000~9,999,999の間で、半角数字で入力してください')
      end
      it '「user_id」が空の場合寄付できない' do
        @donation_object.user_id = nil
        @donation_object.valid?
        expect(@donation_object.errors.full_messages).to include('Userを入力してください')
      end
      it '「team_id」が空の場合寄付できない' do
        @donation_object.team_id = nil
        @donation_object.valid?
        expect(@donation_object.errors.full_messages).to include('Teamを入力してください')
      end
    end
  end
end
