require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録'do
    context '新規登録がうまくいくとき' do
      it 'nameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとkana_last_nameとkana_first_nameとbirth_dayが存在すれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時'do
      it 'nameが空だと新規登録できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空だと新規登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が存在しないと新規登録できない' do
        @user.email = "aaaexample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと新規登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空だと新規登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと新規登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと新規登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'kana_last_nameが空だと新規登録できない' do
        @user.kana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_first_nameが空だと新規登録できない' do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'birth_dayが空だと新規登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'passwordは6文字以上でないと新規登録できない' do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字混合出なければいけない' do
        @user.password = "a1a1a1"
        @user.valid?
      end
      it 'passwordは確認用も合わせて二回入力しないといけない' do

      end
      it 'ユーザー本名は全角（漢字、ひらがな、カタカナ）であること' do

      end
      it 'ユーザー名のフリガナは全角（カタカナ）であること' do

      end
      it '' do

      end
      it '' do

      end
      it '' do

      end
    end
  end
end
