require 'test_helper'

class FilterByDateRangeTest < ActiveSupport::IntegrationCase
  test "one name" do
    User.create(:name => "Jared Fraser", :date_of_birth => Date.new(1901,10,1))
    User.create(:name => "Modsognir Maladan", :date_of_birth => Date.new(1900,7,1))

    visit users_path

    fill_in "Name", :with => ""
    fill_in "Date of Birth From", :with => "1900/05/25"
    fill_in "Date of Birth To", :with => "1901/05/25"
    click_button "Submit"

    assert page.body.include?("Jared Fraser")
    assert !page.body.include?("Modsognir Maladan")
  end
end
