require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! " do
      user_id = 1
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/id" do
    it "works fine fo specific post! " do
      get posts_path(1)
      expect(response).to have_http_status(200)
      end
    end

  describe "GET /posts" do
    it "does render a different template" do
      user = User.create(name: "Addis Tsega")
      post = Post.create(title: "Hello World", text: "This is my first post", author_id: 1)
      post_id = 1
      get '/posts'
      expect(response.body).to render_template(:index)
      end
    end

    describe 'GET /index' do
      it "Redirects to the user posts' page" do
        get posts_path(1)
        expect(response).to render_template(:index)
        expect(response.body).to include('Here are list of posts for a given user')
       
      end
      end


end
