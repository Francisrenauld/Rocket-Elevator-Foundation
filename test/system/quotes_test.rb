require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Building type", with: @quote.Building_Type
    fill_in "Maximum number of occupants per floor", with: @quote.Maximum_Number_Of_Occupants_Per_Floor
    fill_in "Number of dstinct businesses", with: @quote.Number_Of_Dstinct_Businesses
    fill_in "Number of elevators needed", with: @quote.Number_Of_Elevators_Needed
    fill_in "Number of hours of activity of the building", with: @quote.Number_Of_Hours_Of_Activity_Of_The_Building
    fill_in "Number of apartments", with: @quote.Number_of_apartments
    fill_in "Number of basements", with: @quote.Number_of_basements
    fill_in "Number of floors", with: @quote.Number_of_floors
    fill_in "Number of parking spaces", with: @quote.Number_of_parking_spaces
    fill_in "Number of separate companies", with: @quote.Number_of_separate_companies
    fill_in "Integer", with: @quote.integer
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Building type", with: @quote.Building_Type
    fill_in "Maximum number of occupants per floor", with: @quote.Maximum_Number_Of_Occupants_Per_Floor
    fill_in "Number of dstinct businesses", with: @quote.Number_Of_Dstinct_Businesses
    fill_in "Number of elevators needed", with: @quote.Number_Of_Elevators_Needed
    fill_in "Number of hours of activity of the building", with: @quote.Number_Of_Hours_Of_Activity_Of_The_Building
    fill_in "Number of apartments", with: @quote.Number_of_apartments
    fill_in "Number of basements", with: @quote.Number_of_basements
    fill_in "Number of floors", with: @quote.Number_of_floors
    fill_in "Number of parking spaces", with: @quote.Number_of_parking_spaces
    fill_in "Number of separate companies", with: @quote.Number_of_separate_companies
    fill_in "Integer", with: @quote.integer
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
