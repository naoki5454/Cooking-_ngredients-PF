require 'rails_helper'

RSpec.describe 'Cuisineモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { cuisine.valid? }
    let(:cuisine) { build(:cuisine) }
    context 'cuisine_nameカラム' do
      it '空欄でないこと' do
        cuisine.cuisine_name = ''
        is_expected.to eq false
      end
    end
    context 'material_introductionカラム' do
      it '空欄でないこと' do
        cuisine.material_introduction = ''
        is_expected.to eq false
      end
    end
    context 'introductionカラム' do
      it '空欄でないこと' do
        cuisine.introduction = ''
        is_expected.to eq false
      end
    end
    context 'timeカラム' do
      it '空欄でないこと' do
        cuisine.time = ''
        is_expected.to eq false
      end
    end
  end
end
