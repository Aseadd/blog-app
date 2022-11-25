require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 1, post_id: 1) }
  before { subject.save }

  it 'Like should have an author' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'Like should have a post' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'Counter method should have a like' do
    author = User.create(name: 'Addis Tsega', posts_counter: 1)
    post = Post.create(title: 'Post 1', author_id: author.id, comments_counter: 0, likes_counter: 1)
    Like.create(author_id: author.id, post_id: post.id)
    lastpost = Post.last
    expect(lastpost.likes_counter).to eq 1
  end
end