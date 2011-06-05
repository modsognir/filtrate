require 'test_helper'

class FilterByNameTest < ActiveSupport::IntegrationCase
  test "one name" do
    User.create(:name => "Jarold Fraser")
    User.create(:name => "Modsognir Maladan")

    visit users_path

    fill_in "Name", :with => "Jarold"
    click_button "Submit"

    assert page.body.include?("Jarold Fraser")
    assert !page.body.include?("Modsognir Maladan")
  end
end
