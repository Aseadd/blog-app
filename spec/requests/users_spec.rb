require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  describe "GET /users" do
    it "works fine users ! " do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /users/:id" do
    it "works fine fo specific user! " do

      get users_path(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /users/id" do
    it "does render a different template" do
      get users_path(1)
      expect(response).to render_template(:index)
    end

    it "does render a different template" do
      get users_path(1)
      expect(response).to render_template(:index)
    end


    it "the body contains the user's name" do
      get users_path(1)
      expect(response.body).to include("Addis Tsega")
      end
    end

end