require 'rails_helper'

RSpec.describe "viewing_forms/edit", type: :view do
  before(:each) do
    @viewing_form = assign(:viewing_form, ViewingForm.create!())
  end

  it "renders the edit viewing_form form" do
    render

    assert_select "form[action=?][method=?]", viewing_form_path(@viewing_form), "post" do
    end
  end
end
