require "rails_helper"

RSpec.describe Products::EpisodesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products/episodes").to route_to("products/episodes#index")
    end

    it "routes to #new" do
      expect(:get => "/products/episodes/new").to route_to("products/episodes#new")
    end

    it "routes to #show" do
      expect(:get => "/products/episodes/1").to route_to("products/episodes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/products/episodes/1/edit").to route_to("products/episodes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/products/episodes").to route_to("products/episodes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/products/episodes/1").to route_to("products/episodes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/products/episodes/1").to route_to("products/episodes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/products/episodes/1").to route_to("products/episodes#destroy", :id => "1")
    end

  end
end
