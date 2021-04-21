require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }

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
    context 'nicknameカラム' do
      it '空欄でないこと' do
        customer.nickname = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        customer.nickname = other_customer.nickname
        is_expected.to eq false
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        customer.email = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        customer.email = other_customer.email
        is_expected.to eq false
      end
    end
  end
end