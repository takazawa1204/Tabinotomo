# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Itenerary, "Iteneraryモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { itenerary.valid? }
    
    let(:itenerary) { build(:itenerary) }
    
    context 'titleのカラム' do
      it '空欄でないこと' do
        itenerary.title = ""
        is_expected.to eq false
      end
    end
    
    context 'edit_passwordのカラム' do
      it '空欄でないこと' do
        itenerary.edit_password = ""
        is_expected.to eq false
      end
      it '6文字以上であること: 6文字はOK' do
        itenerary.edit_password = Faker::Lorem.characters(number:6)
        is_expected.to eq true
      end
      it '6文字以上であること: 5文字はNG' do
        itenerary.edit_password = Faker::Lorem.characters(number:5)
        is_expected.to eq false
      end
    end
  end
end