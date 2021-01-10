require 'rails_helper'

RSpec.describe "episodes/marketing_materials/new", type: :view do
  before(:each) do
    assign(:episodes_marketing_material, Episodes::MarketingMaterial.new())
  end

  it "renders new episodes_marketing_material form" do
    render

    assert_select "form[action=?][method=?]", episodes_marketing_materials_path, "post" do
    end
  end
end
