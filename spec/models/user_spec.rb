require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '苗字が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字を入力してください')
      end
      it '苗字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name = 'familyname'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は不正な値です')
      end
      it '苗字が半角では登録できない' do
        @user.family_name = 'ﾐｮｳｼﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は不正な値です')
      end
      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it '名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'firstname'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it '名前が半角では登録できない' do
        @user.first_name = 'ﾅﾏｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it '苗字（フリガナ）が空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（フリガナ）を入力してください')
      end
      it '苗字（フリガナ）がひらがなでは登録できない' do
        @user.family_name_kana = 'みょうじ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（フリガナ）は不正な値です')
      end
      it '苗字（フリガナ）が漢字では登録できない' do
        @user.family_name_kana = '苗字'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（フリガナ）は不正な値です')
      end
      it '苗字（フリガナ）が英語では登録できない' do
        @user.family_name_kana = 'familyname'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（フリガナ）は不正な値です')
      end
      it '苗字（フリガナ）が半角では登録できない' do
        @user.family_name_kana = 'ﾐｮｳｼﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（フリガナ）は不正な値です')
      end
      it '名前（フリガナ）が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（フリガナ）を入力してください')
      end
      it '名前（フリガナ）がひらがなでは登録できない' do
        @user.first_name_kana = 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（フリガナ）は不正な値です')
      end
      it '名前（フリガナ）が漢字では登録できない' do
        @user.first_name_kana = '名前'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（フリガナ）は不正な値です')
      end
      it '名前（フリガナ）が英語では登録できない' do
        @user.first_name_kana = 'firstname'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（フリガナ）は不正な値です')
      end
      it '名前（フリガナ）が半角では登録できない' do
        @user.first_name_kana = 'ﾅﾏｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（フリガナ）は不正な値です')
      end
      it '会社名が空では登録できない' do
        @user.company = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('会社名を入力してください')
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it '重複したメールアドレスが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが５文字以下では登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードが30文字以上では登録できない' do
        @user.password = '1234567890aabbccddee1234567890a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは30文字以内で入力してください')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '１11aaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワード（確認用）がなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードとパスワード（確認用）が不一致では登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'bbb000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
  end
end
