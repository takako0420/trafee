require 'rails_helper'

RSpec.describe Sheet, type: :model do
  before do
    user = FactoryBot.create( :user )
    @item = FactoryBot.build( :item )
    @sheet = FactoryBot.build( :sheet, user_id: user.id )
    @sheet_item = FactoryBot.create( :sheet_with_item, user_id: user.id )
  end

  describe 'スキルマップ保存' do
    context 'スキルマップを登録できるとき' do
      it 'sheetとitem同時に登録できる' do
        expect(@sheet_item).to be_valid
      end
      it 'itemがなくても登録できる' do
        expect(@sheet).to be_valid
      end
    end

    context 'スキルマップを登録できないとき' do
      it 'タイトルがないと登録できない' do
        @sheet_item.title = ""
        @sheet_item.valid?
        expect(@sheet_item.errors.full_messages).to include('Titleを入力してください')
      end
      it 'ユーザーが紐づいていなければ登録できない' do
        @sheet_item.user = nil
        @sheet_item.valid?
        expect(@sheet_item.errors.full_messages).to include('Userを入力してください')
      end
      it 'タイトルは40文字以内でないと登録できない' do
        @sheet_item.title = "a" * 41
        @sheet_item.valid?
        expect(@sheet_item.errors.full_messages).to include('Titleは40文字以内で入力してください')
      end
      it 'テキストは100文字以内でないと登録できない' do
        @item.text = "a" * 101
        @item.valid?
        expect(@item.errors.full_messages).to include('Textは100文字以内で入力してください')
      end
    end
  end
end
