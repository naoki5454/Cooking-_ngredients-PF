require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let(:contact) { build(:contact) }

    context 'nameカラム' do
      it '空欄でないこと' do
        customer.name = ''
        is_expected.to eq false
      end
    end
    context 'k_nameカラム' do
      it '空欄でないこと' do
        customer.k_name = ''
        is_expected.to eq false
      end
    end
  end
end
