require 'rails_helper'

RSpec.describe "episodes/marketing_materials/index", type: :view do
  before(:each) do
    assign(:episodes_marketing_materials, [
      Episodes::MarketingMaterial.create!(),
      Episodes::MarketingMaterial.create!()
    ])
  end

  it "renders a list of episodes/marketing_materials" do
    render
  end
end
