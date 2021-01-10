require 'rails_helper'

RSpec.describe "viewing_forms/show", type: :view do
  before(:each) do
    @viewing_form = assign(:viewing_form, ViewingForm.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
