require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録'do
    context '新規登録がうまくいくとき' do
      it 'nameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとkana_last_nameとkana_first_nameとbirth_dayが存在すれば保存できる' do
        expect(@user).to be_valid?
      end
    end

    context '新規登録がうまくいかない時'do
      
    end
  end
end
