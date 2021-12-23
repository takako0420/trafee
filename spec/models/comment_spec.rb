require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    sheet = FactoryBot.create(:sheet)
    document = FactoryBot.create(:document, user_id: user.id, sheet_id: sheet.id)
    @comment = FactoryBot.build(:comment, document_id: document.id)
  end

  describe '目標保存' do
    context '目標を保存できるとき' do
      it 'すべての項目が揃っていれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context '目標を保存できないとき' do
      it '「振り返り」が入力されていないと保存できない' do
        @comment.feedback = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('振り返りを入力してください')
      end
      it '「次回までの目標」が入力されていないと保存できない' do
        @comment.target = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('次回までの目標を入力してください')
      end
      it 'document_idが紐づいていなければ登録できない' do
        @comment.document_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Documentを入力してください')
      end
      it '目標は１つのdocument_idにつき１度しか保存できない' do
        @comment.save
        user = FactoryBot.create(:user)
        sheet = FactoryBot.create(:sheet)
        document = FactoryBot.create(:document, user_id: user.id, sheet_id: sheet.id)
        another_comment = FactoryBot.build(:comment, document_id: document.id)
        another_comment.document_id = @comment.document_id
        another_comment.valid?
        expect(another_comment.errors.full_messages).to include('目標の記録は登録済みのため、保存できません')
      end
    end
  end
end
