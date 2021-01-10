require 'rails_helper'

RSpec.describe "viewing_forms/new", type: :view do
  before(:each) do
    assign(:viewing_form, ViewingForm.new())
  end

  it "renders new viewing_form form" do
    render

    assert_select "form[action=?][method=?]", viewing_forms_path, "post" do
    end
  end
end
