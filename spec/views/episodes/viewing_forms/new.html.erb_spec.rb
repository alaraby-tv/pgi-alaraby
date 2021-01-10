require 'rails_helper'

RSpec.describe "episodes/viewing_forms/new", type: :view do
  before(:each) do
    assign(:episodes_viewing_form, Episodes::ViewingForm.new())
  end

  it "renders new episodes_viewing_form form" do
    render

    assert_select "form[action=?][method=?]", episodes_viewing_forms_path, "post" do
    end
  end
end
