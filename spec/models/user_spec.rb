require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全カラムが正しく入力されていれば登録できる" do
      expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "abcde1"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合、登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれない場合、登録できない" do
        @user.email = "abcgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "abcd1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英字のみの場合、登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字のみの場合、登録できない" do
        @user.password ="111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角の場合、登録できない" do
        @user.password = "あいあいさー"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在しても、password_confirmationが空だと登録できない" do
        @user.password = "abcde1"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一致しない場合、登録できない" do
        @user.password = "abcde1"
        @user.password_confirmation = "abcde0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "chinese_character_last_nameが空だと登録できない" do
        @user.chinese_character_last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese character last name can't be blank")
      end
      it "chinese_character_last_nameが半角文字だと登録できない" do
        @user.chinese_character_last_name ="kusano"
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese character last name is invalid")
      end
      it "chinese_character_first_nameが空だと登録できない" do
        @user.chinese_character_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese character first name can't be blank")
      end
      it "chinese_character_first_nameが半角文字だと登録できない" do
        @user.chinese_character_first_name = "hitoshi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese character first name is invalid")
      end
      it "kana_last_nameが空だと登録できない" do
        @user.kana_last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it "kana_last_nameが半角文字だと登録できない" do
        @user.kana_last_name = "kusano"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end
      it "kana_last_nameが漢字だと登録できない" do
        @user.kana_last_name = "草野"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end
      it "kana_last_nameがひらがなだと登録できない" do
        @user.kana_last_name = "くさの"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end
      it "kana_first_nameが空だと登録できない" do
        @user.kana_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it "kana_first_nameが半角文字だと登録できない" do
        @user.kana_first_name ="hitoshi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
      it "kana_first_nameが漢字だと登録できない" do
        @user.kana_first_name = "仁"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
      it "kana_first_nameがひらがなだと登録できない" do
        @user.kana_first_name = "ひとし"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
