require "rails_helper"

RSpec.describe Episodes::MarketingMaterialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/episodes/marketing_materials").to route_to("episodes/marketing_materials#index")
    end

    it "routes to #new" do
      expect(:get => "/episodes/marketing_materials/new").to route_to("episodes/marketing_materials#new")
    end

    it "routes to #show" do
      expect(:get => "/episodes/marketing_materials/1").to route_to("episodes/marketing_materials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/episodes/marketing_materials/1/edit").to route_to("episodes/marketing_materials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/episodes/marketing_materials").to route_to("episodes/marketing_materials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/episodes/marketing_materials/1").to route_to("episodes/marketing_materials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/episodes/marketing_materials/1").to route_to("episodes/marketing_materials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/episodes/marketing_materials/1").to route_to("episodes/marketing_materials#destroy", :id => "1")
    end

  end
end
