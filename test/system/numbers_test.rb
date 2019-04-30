require "application_system_test_case"

class NumbersTest < ApplicationSystemTestCase
  setup do
    @number = numbers(:one)
  end

  test "visiting the index" do
    visit numbers_url
    assert_selector "h1", text: "Numbers"
  end

  test "creating a Number" do
    visit numbers_url
    click_on "New Number"

    fill_in "Country", with: @number.country
    fill_in "Phonenumber", with: @number.phonenumber
    click_on "Create Number"

    assert_text "Number was successfully created"
    click_on "Back"
  end

  test "updating a Number" do
    visit numbers_url
    click_on "Edit", match: :first

    fill_in "Country", with: @number.country
    fill_in "Phonenumber", with: @number.phonenumber
    click_on "Update Number"

    assert_text "Number was successfully updated"
    click_on "Back"
  end

  test "destroying a Number" do
    visit numbers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Number was successfully destroyed"
  end
end
