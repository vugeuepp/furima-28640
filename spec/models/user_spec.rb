require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname、email、password、password_confirmation、last_name、first_name、last_reading、first_reading、birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが＠を含まないのでは登録できない' do
      @user.email = "xxxgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上であれば登録できる' do
      @user.password = "aa0000"
      @user.password_confirmation = "aa0000"
      expect(@user).to be_valid
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "aa000"
      @user.password_confirmation = "aa000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = "aa0000"
      @user.password_confirmation = "bb0000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
        # 一応メモとして残しています
    # it 'パスワードは、確認用を含めて2回入力すること' do
    #   @user.password_confirmation = ""
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    # end
    
    it 'last_nameが空では登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank",
                                                   'Last name is invalid. Input full-width characters.')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank",
                                                   'First name is invalid. Input full-width characters.')
    end
    it 'last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = "kim"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = "Dahyun"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it 'last_readingが空では登録できない' do
      @user.last_reading = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last reading can't be blank",
                                                   'Last reading is invalid. Input full-width katakana characters.')
    end
    it 'first_readingが空では登録できない' do
      @user.first_reading = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First reading can't be blank",
                                                   'First reading is invalid. Input full-width katakana characters.')
    end
    it 'last_readingは全角（カタカナ）でないと登録できない' do
      @user.last_reading = "やま"
      @user.valid?
      expect(@user.errors.full_messages).to include('Last reading is invalid. Input full-width katakana characters.')
    end
    it 'first_readingは全角（カタカナ）でないと登録できない' do
      @user.first_reading = "かわ"
      @user.valid?
      expect(@user.errors.full_messages).to include('First reading is invalid. Input full-width katakana characters.')
    end
    
    it 'birthdayが空では登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
