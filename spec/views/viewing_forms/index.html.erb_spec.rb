require 'rails_helper'

RSpec.describe "viewing_forms/index", type: :view do
  before(:each) do
    assign(:viewing_forms, [
      ViewingForm.create!(),
      ViewingForm.create!()
    ])
  end

  it "renders a list of viewing_forms" do
    render
  end
end
