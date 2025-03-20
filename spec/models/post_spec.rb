require 'rails_helper'

RSpec.describe Post, type: :model do
  it "内容が空であれば無効であること" do
    @posts = Post.new(content: "")
    expect(@posts).to be_invalid
  end

  it "内容が140文字以内であれば有効であること" do
    @posts = Post.new(content: "a" * 140)
    expect(@posts).to be_valid
  end

  it "内容が141文字以上であれば無効であること" do
    @posts = Post.new(content: "a" * 141)
    expect(@posts).to be_invalid
  end
end
