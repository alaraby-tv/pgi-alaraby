require 'rails_helper'

RSpec.describe "episodes/viewing_forms/index", type: :view do
  before(:each) do
    assign(:episodes_viewing_forms, [
      Episodes::ViewingForm.create!(),
      Episodes::ViewingForm.create!()
    ])
  end

  it "renders a list of episodes/viewing_forms" do
    render
  end
end
