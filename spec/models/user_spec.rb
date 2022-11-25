require_relative '../rails_helper'

RSpec.describe User, type: :model do
    subject {User.new(name: 'Addis', posts_counter: 0)}

    before {subject.save}

    it 'User should have a name' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'User name should be at least 3 characters' do
        subject.name = 'Ad'
        expect(subject).to_not be_valid
    end

    it 'User name should be at most 20 characters' do
        subject.name = 'Addis' * 5
        expect(subject).to_not be_valid
    end

    it 'User should have a posts_counter' do
        subject.posts_counter = nil
        expect(subject).to_not be_valid
    end

    it 'User posts_counter should be greater than or equal to 0' do
        subject.posts_counter = -1
        expect(subject).to_not be_valid
    end

    it "user's recent posts should be in descending order" do
        author = User.create(name: 'Addis', posts_counter: 0)
        post1 = Post.create(title: 'Post 1', author_id: author.id, comments_counter: 0, likes_counter: 0)
        post2 = Post.create(title: 'Post 2', author_id: author.id, comments_counter: 0, likes_counter: 0)
        expect(author.recent_posts).to eq [post2, post1]
    end


end


