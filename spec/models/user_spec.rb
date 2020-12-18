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
      it '重複したemailが存在する場合は保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordは半角英数混合以外では保存できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角数字と半角英字の両方を含めて設定してください")
      end
      it 'passwordが数字のみだと保存できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角数字と半角英字の両方を含めて設定してください")
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角数字と半角英字の両方を含めて設定してください")
      end
      it 'passwordは6文字以上でないと新規登録できない' do
        @user.password = "aa1aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationは同じでないといけない' do
        @user.password = "a1a1a1"
        @user.password_confirmation = "a1a1aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと新規登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. input full-width characters")

      end
      it 'first_nameが空だと新規登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない'do
        @user.first_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. input full-width characters")
      end
      it 'kana_last_nameが空だと新規登録できない' do
        @user.kana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_last_nameは全角（カタカナ）でないと登録できない' do
        @user.kana_last_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid. input full-width katakana characters")
      end
      it 'kana_first_nameが空だと新規登録できない' do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_first_nameは全角（カタカナ）でないと登録できない' do
        @user.kana_first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. input full-width katakana characters")
      end
      it 'birth_dayが空だと新規登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
