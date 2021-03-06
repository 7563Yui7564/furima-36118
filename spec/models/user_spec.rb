require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do 
      it 'nicknameが空では登録できない' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに＠が含まれていないと登録できない' do
      @user.email = 'tanaka.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが５文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123465'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが全角文字では登録できない' do
      @user.password = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end

      it 'passwordが半角数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end

      it 'passwordが半角英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end

      it 'last_nameが空では登録できない' do
      @user.last_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角でないと登録できない' do
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end

      it 'first_nameが空では登録できない' do
      @user.first_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角でないと登録できない' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end

      it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaがカタカナでないと登録できない' do
      @user.last_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters.')
      end

      it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaがカタカナでないと登録できない' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
      end

      it 'birth_dateが空では登録できない' do
      @user.birth_date = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end  
  end
end
