require 'rails_helper'

RSpec.describe 'Contactモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    subject { contact.valid? }

    let(:contact) { build(:contact) }

    context 'nameカラム' do
      it '空欄でないこと' do
        contact.name = ''
        is_expected.to eq false
      end
    end
    context 'messageカラム' do
      it '空欄でないこと' do
        contact.message = ''
        is_expected.to eq false
      end
    end
  end
end
