require 'rails_helper'

describe Post do
  it "is invalid without a user_id" do
    post = Post.new(user_id: nil)
    post.valid?
    expect(post.errors[:user_id]).to include("入力してください")
  end

  it "is valid with a content" do
    is_content = Post.new(
      content: "hoge",
      image: nil,
      user_id: 1
    )
    expect(is_content).to be_valid
  end

  it "is invalid without a content and image" do
    post = Post.new(
      content: nil,
      image: nil,
      user_id: 1
    )
    post.valid?
    expect(post.errors[:content_or_image]).to include("入力してください")
  end
end

