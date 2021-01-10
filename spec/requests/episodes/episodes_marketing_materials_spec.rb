require 'rails_helper'

RSpec.describe "Episodes::MarketingMaterials", type: :request do
  describe "GET /episodes_marketing_materials" do
    it "works! (now write some real specs)" do
      get episodes_marketing_materials_path
      expect(response).to have_http_status(200)
    end
  end
end
