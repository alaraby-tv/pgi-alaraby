require "rails_helper"

RSpec.describe Episodes::ViewingFormsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/episodes/viewing_forms").to route_to("episodes/viewing_forms#index")
    end

    it "routes to #new" do
      expect(:get => "/episodes/viewing_forms/new").to route_to("episodes/viewing_forms#new")
    end

    it "routes to #show" do
      expect(:get => "/episodes/viewing_forms/1").to route_to("episodes/viewing_forms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/episodes/viewing_forms/1/edit").to route_to("episodes/viewing_forms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/episodes/viewing_forms").to route_to("episodes/viewing_forms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/episodes/viewing_forms/1").to route_to("episodes/viewing_forms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/episodes/viewing_forms/1").to route_to("episodes/viewing_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/episodes/viewing_forms/1").to route_to("episodes/viewing_forms#destroy", :id => "1")
    end

  end
end
