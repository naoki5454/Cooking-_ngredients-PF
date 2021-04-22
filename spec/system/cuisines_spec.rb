require 'rails_helper'

RSpec.describe "Cuisines", type: :system do
  describe '料理の投稿のテスト' do
    #let!(:cuisine) { create(:cuisine, genre_id:'1',customer_id:'1', cuisine_name:'hoge',material_introduction:'body',introduction:'hoge',time:'1') }
      describe "投稿画面(new_cuisine_path)のテスト" do
      before do
        visit new_cuisine_path
      end
      context '表示の確認' do
        it 'new_cuisine_pathが"/todolists/new"であるか' do
          expect(current_path).to eq('/cuisines/new')
        end
        it '投稿ボタンが表示されているか' do
          expect(page).to '投稿'
        end
      end
      context '投稿処理のテスト' do
        it '投稿後のリダイレクト先は正しいか' do
          fill_in 'cuisine[cuisine_name]'
          fill_in 'cuisine[material_introduction]'
          fill_in 'cuisine[introduction]'
          fill_in 'cuisine[time]'
          fill_in 'cuisine[genre_id]'
          fill_in 'cuisine[customer_id]'
          click_button '投稿'
          expect(page).to have_current_path cuisine_path(cuisine.last)
        end
      end
    end
  end
end