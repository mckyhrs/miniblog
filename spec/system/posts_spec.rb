require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'タイムライン' do
    let!(:post1) { Post.create!(content: '投稿1', created_at: 2.days.ago) }
    let!(:post2) { Post.create!(content: '投稿2', created_at: 1.day.ago) }

    it '投稿が一覧表示される' do
      visit posts_path
      expect(page).to have_content(I18n.l(post1.created_at))
      expect(page).to have_content(I18n.l(post2.created_at))
      expect(page).to have_content('投稿2')
      expect(page).to have_content('投稿1')
    end

    it '投稿作成ページへのリンクが表示される' do
      visit posts_path
      expect(page).to have_link('投稿する', href: new_post_path)
    end
  end

  describe '投稿の作成' do
    before do
      visit new_post_path
    end

    context '有効なパラメータ' do
      it '投稿を作成できる' do
        fill_in 'post_content', with: 'テスト'
        click_button '投稿する'
        expect(page).to have_content('投稿を作成しました')
        expect(page).to have_content('テスト')
      end
    end

    context '無効なパラメータ' do
      it '投稿の作成に失敗する' do
        fill_in 'post_content', with: ''
        click_button '投稿する'
        expect(page).to have_content('エラーが発生しました')
        expect(page).to have_content('投稿内容 を入力してください')
      end
    end
  end
end
