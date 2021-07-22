require 'rails_helper'
RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空では登録できない' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが半角英数字混合でないと登録できない' do
      @user.password = '/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width characters.'
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'last_nameが全角でないと登録できない' do
      @user.last_name = '/\A[ぁ-んァ-ヶー-龥々ー]+\z/'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters.'
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'first_nameが全角でないと登録できない' do
      @user.first_name = '/\A[ぁ-んァ-ヶー-龥々ー]+\z/'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it 'last_name_kanaがカタカナでないと登録できない' do
      @user.last_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'first_name_kanaがカタカナでないと登録できない' do
      @user.first_name_kana = '/\A[ァ-ヶー]+\z/'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid. Input full-width katakana characters.'
    end

    it 'birth_dateが空では登録できない' do
      @user.birth_date = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end
