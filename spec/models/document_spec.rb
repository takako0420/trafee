require 'rails_helper'

RSpec.describe Document, type: :model do
  before do
    user = FactoryBot.create(:user)
    sheet = FactoryBot.create(:sheet)
    @document = FactoryBot.build(:document, user_id: user.id, sheet_id: sheet.id)
  end

  describe 'スキルマップテスト結果保存' do
    context 'テスト結果を保存できるとき' do
      it '全ての項目があれば登録できる' do
        expect(@document).to be_valid
      end
    end
    context 'テスト結果を保存できないとき' do
      it 'chose_oneが半角数字以外では登録できない' do
        @document.chose_one = 'a'
        @document.valid?
        expect(@document.errors.full_messages).to include("ボタン'1'は数値で入力してください")
      end
      it 'chose_twoが半角数字以外では登録できない' do
        @document.chose_two = 'a'
        @document.valid?
        expect(@document.errors.full_messages).to include("ボタン'2'は数値で入力してください")
      end
      it 'chose_threeが半角数字以外では登録できない' do
        @document.chose_three = 'a'
        @document.valid?
        expect(@document.errors.full_messages).to include("ボタン'3'は数値で入力してください")
      end
      it 'chose_fourが半角数字以外では登録できない' do
        @document.chose_four = 'a'
        @document.valid?
        expect(@document.errors.full_messages).to include("ボタン'4'は数値で入力してください")
      end
      it 'ユーザーが紐づいていなければ登録できない' do
        @document.user = nil
        @document.valid?
        expect(@document.errors.full_messages).to include('Userを入力してください')
      end
      it 'シートが紐づいていなければ登録できない' do
        @document.sheet = nil
        @document.valid?
        expect(@document.errors.full_messages).to include('Sheetを入力してください')
      end
    end
  end
end
