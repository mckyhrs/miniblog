require 'rails_helper'

RSpec.describe Post, type: :model do
  it '内容が空であれば無効であること' do
    post = Post.new(content: '')
    expect(post).not_to be_valid
  end

  it '内容が140文字以内であれば有効であること' do
    post = Post.new(content: 'a' * 140)
    expect(post).to be_valid
  end

  it '内容が141文字以上であれば無効であること' do
    post = Post.new(content: 'a' * 141)
    expect(post).not_to be_valid
  end
end
