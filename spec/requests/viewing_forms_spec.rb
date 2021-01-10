require 'rails_helper'

RSpec.describe "ViewingForms", type: :request do
  describe "GET /viewing_forms" do
    it "works! (now write some real specs)" do
      get viewing_forms_path
      expect(response).to have_http_status(200)
    end
  end
end
