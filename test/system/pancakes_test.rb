require "application_system_test_case"

class PancakesTest < ApplicationSystemTestCase
  setup do
    @pancake = pancakes(:one)
  end

  test "visiting the index" do
    visit pancakes_url
    assert_selector "h1", text: "Pancakes"
  end

  test "should create pancake" do
    visit pancakes_url
    click_on "New pancake"

    fill_in "Description", with: @pancake.description
    fill_in "Name", with: @pancake.name
    click_on "Create Pancake"

    assert_text "Pancake was successfully created"
    click_on "Back"
  end

  test "should update Pancake" do
    visit pancake_url(@pancake)
    click_on "Edit this pancake", match: :first

    fill_in "Description", with: @pancake.description
    fill_in "Name", with: @pancake.name
    click_on "Update Pancake"

    assert_text "Pancake was successfully updated"
    click_on "Back"
  end

  test "should destroy Pancake" do
    visit pancake_url(@pancake)
    click_on "Destroy this pancake", match: :first

    assert_text "Pancake was successfully destroyed"
  end
end
