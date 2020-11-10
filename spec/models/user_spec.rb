require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在してれば保存できる' do
    expect(@user).to be_valid
  end
  it 'nicknameが空だと保存できない' do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it 'emailが空だと保存できない' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'emailが重複していると保存できない' do
    @user.save
    @another_user = FactoryBot.build(:user)
    @another_user.valid?
    expect(@another_user.errors.full_messages).to include('Email has already been taken')
  end
  it 'emailに@が含まれていないと保存できない' do
    @user.email = 'aaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end
  it 'passwordが空だと保存できない' do
    @user.password = nil
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordが5文字以下だと保存できない' do
    @user.password = 'aaaa1'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordは半角英数字混合でなければ保存できない' do
    @user.password = 'aaAaaa'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Input half-width alphanumeric characters mix.')
  end
  it 'passwordとpassword_confirmationが一致していなければ保存できない' do
    @user.password_confirmation = 'bbbbb1'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'last_nameが空だと保存できない' do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end
  it 'last_nameが全角ひらがなカタカナ漢字でなければ保存できない' do
    @user.last_name = '1111'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
  end
  it 'first_nameが空だと保存できない' do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end
  it 'first_nameが全角ひらがなカタカナ漢字でなければ保存できない' do
    @user.first_name = '1111'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
  end
  it 'last_name_kanaが空だと保存できない' do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end
  it 'last_name_kanaが全角カタカナでなければ保存できない' do
    @user.last_name_kana = '1111'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters.')
  end
  it 'first_name_kanaが空だと保存できない' do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end
  it 'first_name_kanaが全角カタカナでなければ保存できない' do
    @user.first_name_kana = '1111'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
  end
  it 'birthdayが空だと保存できない' do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end
