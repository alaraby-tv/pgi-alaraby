require 'rails_helper'

RSpec.describe "episodes/viewing_forms/edit", type: :view do
  before(:each) do
    @episodes_viewing_form = assign(:episodes_viewing_form, Episodes::ViewingForm.create!())
  end

  it "renders the edit episodes_viewing_form form" do
    render

    assert_select "form[action=?][method=?]", episodes_viewing_form_path(@episodes_viewing_form), "post" do
    end
  end
end
