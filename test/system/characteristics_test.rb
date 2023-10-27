require "application_system_test_case"

class CharacteristicsTest < ApplicationSystemTestCase
  setup do
    @characteristic = characteristics(:one)
  end

  test "visiting the index" do
    visit characteristics_url
    assert_selector "h1", text: "Characteristics"
  end

  test "should create characteristic" do
    visit characteristics_url
    click_on "New characteristic"

    fill_in "Name", with: @characteristic.name
    click_on "Create Characteristic"

    assert_text "Characteristic was successfully created"
    click_on "Back"
  end

  test "should update Characteristic" do
    visit characteristic_url(@characteristic)
    click_on "Edit this characteristic", match: :first

    fill_in "Name", with: @characteristic.name
    click_on "Update Characteristic"

    assert_text "Characteristic was successfully updated"
    click_on "Back"
  end

  test "should destroy Characteristic" do
    visit characteristic_url(@characteristic)
    click_on "Destroy this characteristic", match: :first

    assert_text "Characteristic was successfully destroyed"
  end
end
