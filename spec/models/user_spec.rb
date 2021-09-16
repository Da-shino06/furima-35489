require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録機能' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_furigana,first_name_furigana,birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠がないと登録できない' do
        @user.email = 'aaai.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordがないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字以上でないと登録できない' do
        @user.password = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password半角英数字混合であること' do
        @user.password = 'AAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is including both English letter and number')
      end
      it 'passwordとpassword_confirmationの値は一致していること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザーの本名にはlast_nameがあること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザーの本名にはfirst_nameがあること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザーの本名のlast_nameには全角（漢字・ひらがな・カタカナ）での入力であること' do
        @user.last_name = 'kuro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'ユーザーの本名のfirst_nameは全角（漢字・ひらがな・カタカナ）での入力であること' do
        @user.first_name = 'kuro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'ユーザーの本名にはlast_name_furiganaがあること' do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end
      it 'ユーザーの本名にはfirst_name_furiganaがあること' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end
      it 'ユーザーの本名のlast_name_furiganaは全角（カタカナ）での入力であること' do
        @user.last_name_furigana = 'kuro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name furigana is invalid. Input full-width katakana characters.')
      end
      it 'ユーザーの本名のfirst_name_firiganaは全角（カタカナ）での入力であること' do
        @user.first_name_furigana = 'kuro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name furigana is invalid. Input full-width katakana characters.')
      end
      it '生年月日がないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
