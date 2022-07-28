require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { Building_Type: @quote.Building_Type, Maximum_Number_Of_Occupants_Per_Floor: @quote.Maximum_Number_Of_Occupants_Per_Floor, Number_Of_Dstinct_Businesses: @quote.Number_Of_Dstinct_Businesses, Number_Of_Elevators_Needed: @quote.Number_Of_Elevators_Needed, Number_Of_Hours_Of_Activity_Of_The_Building: @quote.Number_Of_Hours_Of_Activity_Of_The_Building, Number_of_apartments: @quote.Number_of_apartments, Number_of_basements: @quote.Number_of_basements, Number_of_floors: @quote.Number_of_floors, Number_of_parking_spaces: @quote.Number_of_parking_spaces, Number_of_separate_companies: @quote.Number_of_separate_companies, integer: @quote.integer } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { Building_Type: @quote.Building_Type, Maximum_Number_Of_Occupants_Per_Floor: @quote.Maximum_Number_Of_Occupants_Per_Floor, Number_Of_Dstinct_Businesses: @quote.Number_Of_Dstinct_Businesses, Number_Of_Elevators_Needed: @quote.Number_Of_Elevators_Needed, Number_Of_Hours_Of_Activity_Of_The_Building: @quote.Number_Of_Hours_Of_Activity_Of_The_Building, Number_of_apartments: @quote.Number_of_apartments, Number_of_basements: @quote.Number_of_basements, Number_of_floors: @quote.Number_of_floors, Number_of_parking_spaces: @quote.Number_of_parking_spaces, Number_of_separate_companies: @quote.Number_of_separate_companies, integer: @quote.integer } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
