require 'rails_helper'

RSpec.describe "episodes/viewing_forms/show", type: :view do
  before(:each) do
    @episodes_viewing_form = assign(:episodes_viewing_form, Episodes::ViewingForm.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
