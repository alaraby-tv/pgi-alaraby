require 'rails_helper'

RSpec.describe "episodes/marketing_materials/show", type: :view do
  before(:each) do
    @episodes_marketing_material = assign(:episodes_marketing_material, Episodes::MarketingMaterial.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
