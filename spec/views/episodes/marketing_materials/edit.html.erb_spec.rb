require 'rails_helper'

RSpec.describe "episodes/marketing_materials/edit", type: :view do
  before(:each) do
    @episodes_marketing_material = assign(:episodes_marketing_material, Episodes::MarketingMaterial.create!())
  end

  it "renders the edit episodes_marketing_material form" do
    render

    assert_select "form[action=?][method=?]", episodes_marketing_material_path(@episodes_marketing_material), "post" do
    end
  end
end
