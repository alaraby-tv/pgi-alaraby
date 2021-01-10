require 'rails_helper'

RSpec.describe "Episodes::ViewingForms", type: :request do
  describe "GET /episodes_viewing_forms" do
    it "works! (now write some real specs)" do
      get episodes_viewing_forms_path
      expect(response).to have_http_status(200)
    end
  end
end
