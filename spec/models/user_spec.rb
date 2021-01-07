require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(
        nickname: '',
        email: 'kkk@gmail.com',
        password: '00000000',
        password_confirmation: '00000000',
        last_name: '姓',
        first_name: '名',
        last_reading: 'セイ',
        first_reading: 'メイ',
        birthday: '2000-2-1'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(
        nickname: 'SEIMEI',
        email: '',
        password: '00000000',
        password_confirmation: '00000000',
        last_name: '姓',
        first_name: '名',
        last_reading: 'セイ',
        first_reading: 'メイ',
        birthday: '2000-2-1'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(
        nickname: 'SEIMEI',
        email: 'kkk@gmail.com',
        password: '',
        password_confirmation: '',
        last_name: '姓',
        first_name: '名',
        last_reading: 'セイ',
        first_reading: 'メイ',
        birthday: '2000-2-1'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが違っていると登録できない' do
      user = User.new(
        nickname: 'SEIMEI',
        email: 'kkk@gmail.com',
        password: '00000000',
        password_confirmation: '00000001',
        last_name: '姓',
        first_name: '名',
        last_reading: 'セイ',
        first_reading: 'メイ',
        birthday: '2000-2-1'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      user = User.new(
        nickname: 'SEIMEI',
        email: 'kkk@gmail.com',
        password: '00000000',
        password_confirmation: '00000000',
        last_name: '',
        first_name: '名',
        last_reading: 'セイ',
        first_reading: 'メイ',
        birthday: '2000-2-1'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank",
                                                   'Last name is invalid. Input full-width characters.')
    end
    it 'first_nameが空では登録できない' do
      user = User.new(
        nickname: 'SEIMEI',
        email: 'kkk@gmail.com',
        password: '00000000',
        password_confirmation: '00000000',
        last_name: '姓',
        first_name: '',
        last_reading: 'セイ',
        first_reading: 'メイ',
        birthday: '2000-2-1'
      )
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank",
                                                   'First name is invalid. Input full-width characters.')
    end
    it 'last_readingが空では登録できない' do
      user = User.new(
        nickname: 'SEIMEI',
        email: 'kkk@gmail.com',
        password: '00000000',
        password_confirmation: '00000000',
        last_name: '姓',
        first_name: '名',
        last_reading: '',
        first_reading: 'メイ',
        birthday: '2000-2-1'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Last reading can't be blank",
                                                   'Last reading is invalid. Input full-width katakana characters.')
    end
    it 'first_readingが空では登録できない' do
      user = User.new(
        nickname: 'SEIMEI',
        email: 'kkk@gmail.com',
        password: '00000000',
        password_confirmation: '00000000',
        last_name: '姓',
        first_name: '名',
        last_reading: 'セイ',
        first_reading: '',
        birthday: '2000-2-1'
      )
      user.valid?
      expect(user.errors.full_messages).to include("First reading can't be blank",
                                                   'First reading is invalid. Input full-width katakana characters.')
    end
    it 'birthdayが空では登録できない' do
      user = User.new(
        nickname: 'SEIMEI',
        email: 'kkk@gmail.com',
        password: '00000000',
        password_confirmation: '00000000',
        last_name: '姓',
        first_name: '名',
        last_reading: 'セイ',
        first_reading: 'メイ',
        birthday: ''
      )
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
