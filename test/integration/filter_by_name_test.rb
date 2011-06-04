require 'test_helper'

class FilterByNameTest < ActiveSupport::IntegrationCase
  test "one name" do
    User.create(:name => "Jared Fraser")
    User.create(:name => "Modsognir Maladan")

    visit users_path

    fill_in "Name", :with => "Jared"
    click_button "Submit"

    assert page.body.include?("Jared Fraser")
    assert !page.body.include?("Modsognir Maladan")
  end
end
