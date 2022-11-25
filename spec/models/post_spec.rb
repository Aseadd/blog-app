require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Post 1', author_id: 1, comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'Post should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Post title should be at most 250 characters' do
    subject.title = 'a' * 255
    expect(subject).to_not be_valid
  end

  it 'Post should have a comments_counter' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'Post comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Post should have a likes_counter' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'Post likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Post should have an author' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'Post counter method should have a post' do
    author = User.create(name: 'Addis Tsega', posts_counter: 0)
    Post.create(title: 'Post 1', author_id: author.id, comments_counter: 0, likes_counter: 0)
    lastuser = User.last
    expect(lastuser.posts_counter).to eq 1
  end
end
