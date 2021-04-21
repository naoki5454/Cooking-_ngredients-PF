require 'rails_helper'

RSpec.describe 'CuisineCommentモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    subject { cuisine_comment.valid? }

    let(:cuisine_comment) { build(:cuisine_comment) }

    context 'commentカラム' do
      it '空欄でないこと' do
        cuisine_comment.comment = ''
        is_expected.to eq false
      end
    end
  end
end
