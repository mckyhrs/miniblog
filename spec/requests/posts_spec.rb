require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'POST #create' do
    context '有効なパラメータの場合' do
      subject { post posts_path, params: { post: { content: 'テスト' } } }

      it '新しい投稿が作成されること' do
        expect { subject }.to change(Post, :count).by(1)
      end

      it '/indexにリダイレクトされること' do
        subject
        expect(response).to redirect_to(posts_path)
      end
    end

    context '無効なパラメータの場合' do
      subject { post posts_path, params: { post: { content: '' } } }

      it '新しい投稿が作成されないること' do
        expect { subject }.not_to change(Post, :count)
      end

      it 'ステータスがunprocessable_entityで、newテンプレートがレンダリングされること' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end
end
