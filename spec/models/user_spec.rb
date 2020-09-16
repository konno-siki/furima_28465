require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー登録できるとき' do
    it '正しい情報を入力すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordが半角英数字混合で6文字以上だと登録できる' do
      @user.password = 'aaaa11'
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end
  end

  context 'ユーザー登録できないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに「@」が含まれていないと登録できない' do
      @user.email = 'aaaau.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下だと登録できない' do
      @user.password = 'aaaa1'
      @user.password_confirmation = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字でないと登録できない' do
      @user.password = '１１１１１１'
      @user.password_confirmation = '１１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Input half-width alphanumeric characters.')
    end
    it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角日本語でないと登録できない' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが全角日本語でないと登録できない' do
      @user.last_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
    end
    it 'first_name_readingが空だと登録できない' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it 'first_name_readingが全角カナでないと登録できない' do
      @user.first_name_reading = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading is invalid. Input full-width katakana characters.')
    end
    it 'last_name_readingが空だと登録できない' do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end
    it 'last_name_readingが全角カナでないと登録できない' do
      @user.last_name_reading = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name reading is invalid. Input full-width katakana characters.')
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
